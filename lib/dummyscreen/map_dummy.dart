import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class ProviderTrackingPage extends StatefulWidget {
  const ProviderTrackingPage({super.key});

  @override
  State<ProviderTrackingPage> createState() => _ProviderTrackingPageState();
}

class _ProviderTrackingPageState extends State<ProviderTrackingPage> {
  final Completer<GoogleMapController> _mapController = Completer();

  LatLng? _providerLatLng;
  LatLng? _userLatLng;

  Marker? _providerMarker;
  Marker? _userMarker;

  Timer? _timer;

  final String updateApi = "http://admin.qwikhom.ae/api/updateLocation";
  final String getApi = "http://admin.qwikhom.ae/api/getLocation";

  final String providerId = "9";
  final String userId = "18";

  // ✅ Terii provided Directions API key (placed here for testing)
  final String googleApiKey = "AIzaSyBGv9znbx4hAdCp_6YK0-HO2XVKI4ZXALk";

  Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    _startProvider();
  }

  Future<void> _startProvider() async {
    bool ok = await _checkPermission();
    if (!ok) return;

    Position pos = await Geolocator.getCurrentPosition();
    _providerLatLng = LatLng(pos.latitude, pos.longitude);
    _updateProviderMarker();

    final controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(_providerLatLng!, 15));

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      await _sendProviderLocation();
      await _fetchBothLocations();
    });
  }

  Future<bool> _checkPermission() async {
    LocationPermission p = await Geolocator.checkPermission();
    if (p == LocationPermission.denied) {
      p = await Geolocator.requestPermission();
    }
    return p != LocationPermission.denied &&
        p != LocationPermission.deniedForever;
  }

  // --------------------------
  // SEND PROVIDER LOCATION
  // --------------------------
  Future<void> _sendProviderLocation() async {
    Position pos = await Geolocator.getCurrentPosition();
    _providerLatLng = LatLng(pos.latitude, pos.longitude);
    _updateProviderMarker();

    await http.post(
      Uri.parse(updateApi),
      body: {
        "user": userId,
        "userLatitude": "",
        "userLongitude": "",
        "serviceProvider": providerId,
        "serviceProviderLatitude": pos.latitude.toString(),
        "serviceProviderLongitude": pos.longitude.toString(),
      },
    );
  }

  // --------------------------
  // GET USER + PROVIDER LOCATIONS + ROUTE
  // --------------------------
  Future<void> _fetchBothLocations() async {
    final res = await http.post(
      Uri.parse(getApi),
      body: {"user": userId, "serviceProvider": providerId},
    );

    if (res.statusCode != 200) {
      print("GET API failed: ${res.statusCode}");
      return;
    }

    final data = jsonDecode(res.body);
    try {
      // -------- USER ----------
      if (data["user"] != null) {
        double ulat = double.parse(data["user"]["latitude"]);
        double ulng = double.parse(data["user"]["longitude"]);
        _userLatLng = LatLng(ulat, ulng);
        _updateUserMarker();
      } else {
        _userLatLng = null;
      }

      // ------ PROVIDER ------
      if (data["serviceprovider"] != null) {
        double plat = double.parse(data["serviceprovider"]["latitude"]);
        double plng = double.parse(data["serviceprovider"]["longitude"]);
        _providerLatLng = LatLng(plat, plng);
        _updateProviderMarker();
      }

      // Debug: print coordinates so you can check in logs
      print("DEBUG - Provider: $_providerLatLng");
      print("DEBUG - User: $_userLatLng");

      // ----- REAL ROAD ROUTE -----
      if (_userLatLng != null && _providerLatLng != null) {
        // If they are extremely close, skip directions call
        final distanceMeters = _distanceBetween(
          _providerLatLng!.latitude,
          _providerLatLng!.longitude,
          _userLatLng!.latitude,
          _userLatLng!.longitude,
        );
        print("DEBUG - Distance (m): $distanceMeters");

        if (distanceMeters < 10) {
          // Too close — Directions API may return empty route
          print(
            "DEBUG - Provider and User are within ~10 meters. Skipping directions.",
          );
          setState(() {
            _polylines = {}; // clear
          });
          _fitBounds(_providerLatLng!, _userLatLng!);
          return;
        }

        _fitBounds(_providerLatLng!, _userLatLng!);

        List<LatLng> realRoute = await _getPolylineRoute(
          _providerLatLng!,
          _userLatLng!,
        );

        if (realRoute.isEmpty) {
          print("DEBUG - Directions returned no route (empty).");
          // keep polylines empty
          setState(() {
            _polylines = {};
          });
        } else {
          _drawRealRoute(realRoute);
        }
      } else {
        print("DEBUG - One of locations is null, cannot draw route.");
        setState(() {
          _polylines = {};
        });
      }
    } catch (e) {
      print("PARSE ERROR: $e");
    }
  }

  // -------------------------
  // GOOGLE DIRECTIONS API CALL
  // -------------------------
  Future<List<LatLng>> _getPolylineRoute(LatLng start, LatLng end) async {
    // using driving mode and departure_time=now increases chance of getting a route
    final String url =
        "https://maps.googleapis.com/maps/api/directions/json?"
        "origin=${start.latitude},${start.longitude}"
        "&destination=${end.latitude},${end.longitude}"
        "&mode=driving"
        "&departure_time=now"
        "&key=$googleApiKey";

    print("DEBUG - Directions URL: $url");

    final res = await http.get(Uri.parse(url));
    if (res.statusCode != 200) {
      print("Directions API HTTP error: ${res.statusCode}");
      return [];
    }

    // DEBUG: print full response body (can be large)
    print("DEBUG - Directions response body: ${res.body}");

    final data = jsonDecode(res.body);

    // Check API status
    final status = (data["status"] ?? "").toString();
    print("DEBUG - Directions API status: $status");
    if (status != "OK") {
      // Could be ZERO_RESULTS, OVER_QUERY_LIMIT, REQUEST_DENIED, etc.
      print("Directions API not OK: $status");
      return [];
    }

    List<LatLng> polyPoints = [];

    if (data["routes"] != null && data["routes"].isNotEmpty) {
      String encoded = data["routes"][0]["overview_polyline"]["points"];
      polyPoints = _decodePolyline(encoded);
    }

    return polyPoints;
  }

  // Decode Google polyline
  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> points = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;

      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);

      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;

      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);

      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }

    return points;
  }

  // Draw Route
  void _drawRealRoute(List<LatLng> points) {
    setState(() {
      _polylines = {
        Polyline(
          polylineId: const PolylineId("real_route"),
          width: 6,
          color: Colors.blue,
          points: points,
        ),
      };
    });
  }

  void _updateProviderMarker() {
    if (_providerLatLng == null) return;

    setState(() {
      _providerMarker = Marker(
        markerId: const MarkerId("provider"),
        position: _providerLatLng!,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        infoWindow: const InfoWindow(title: "You (Provider)"),
      );
    });
  }

  void _updateUserMarker() {
    if (_userLatLng == null) return;

    setState(() {
      _userMarker = Marker(
        markerId: const MarkerId("user"),
        position: _userLatLng!,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: const InfoWindow(title: "Customer Location"),
      );
    });
  }

  Future<void> _fitBounds(LatLng a, LatLng b) async {
    try {
      final controller = await _mapController.future;

      LatLngBounds bounds = LatLngBounds(
        southwest: LatLng(
          min(a.latitude, b.latitude),
          min(a.longitude, b.longitude),
        ),
        northeast: LatLng(
          max(a.latitude, b.latitude),
          max(a.longitude, b.longitude),
        ),
      );

      controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 60));
    } catch (_) {}
  }

  // helper: approximate distance in meters between two lat-lngs (haversine)
  double _distanceBetween(double lat1, double lon1, double lat2, double lon2) {
    const R = 6371000; // meters
    final dLat = _deg2rad(lat2 - lat1);
    final dLon = _deg2rad(lon2 - lon1);
    final a =
        sin(dLat / 2) * sin(dLat / 2) +
            cos(_deg2rad(lat1)) *
                cos(_deg2rad(lat2)) *
                sin(dLon / 2) *
                sin(dLon / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return R * c;
  }

  double _deg2rad(double deg) => deg * (pi / 180);

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Provider — Track Customer")),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(19.9975, 73.7898),
          zoom: 12,
        ),
        markers: {
          if (_providerMarker != null) _providerMarker!,
          if (_userMarker != null) _userMarker!,
        },
        polylines: _polylines,
        myLocationEnabled: true,
        onMapCreated: (controller) {
          if (!_mapController.isCompleted) {
            _mapController.complete(controller);
          }
        },
      ),
    );
  }
}