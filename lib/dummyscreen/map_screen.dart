import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:service_app_qwickhome/prefs/app_preference.dart';
import '../api_service/api_services.dart';
import '../api_service/urls.dart';
import '../dashboard/punch_in.dart';
import '../prefs/preferece_keys.dart';
import '../utils/custom_app_bar.dart';

final String googleApiKey = "AIzaSyBGv9znbx4hAdCp_6YK0-HO2XVKI4ZXALk";

class ProviderTrackingPage extends StatefulWidget {
  final int customerId;

  final String? bookingId;
  final int? serviceId;
  final String? serviceName;
  const ProviderTrackingPage({
    super.key,
    required this.customerId,
    required this.bookingId,
    required this.serviceId,
    required this.serviceName,
  });

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

  Set<Polyline> _polylines = {};

  // dynamic customer id
  late int customerId;

  String distanceText = "";
  String durationText = "";
  String arrivalTime = "";

  @override
  void initState() {
    super.initState();
    customerId = widget.customerId;
    _startProvider();
  }

  Future<void> _startProvider() async {
    bool ok = await _checkPermission();
    if (!ok) return;

    try {
      Position pos = await Geolocator.getCurrentPosition();
      _providerLatLng = LatLng(pos.latitude, pos.longitude);
      _updateProviderMarker();

      final controller = await _mapController.future;
      controller.animateCamera(CameraUpdate.newLatLngZoom(_providerLatLng!, 15));

      _timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
        await _sendProviderLocation();
        await _fetchBothLocations();
      });
    } catch (e) {
      print("Start Provider Error: $e");
    }
  }

  Future<bool> _checkPermission() async {
    LocationPermission p = await Geolocator.checkPermission();
    if (p == LocationPermission.denied) {
      p = await Geolocator.requestPermission();
    }
    return p != LocationPermission.denied &&
        p != LocationPermission.deniedForever;
  }

  Future<void> _sendProviderLocation() async {
    try {
      Position pos = await Geolocator.getCurrentPosition();
      _providerLatLng = LatLng(pos.latitude, pos.longitude);
      _updateProviderMarker();

      await ApiService.postRequest(
        updateApi,
        {
          "user": customerId,
          "userLatitude": _userLatLng?.latitude.toString() ?? "",
          "userLongitude": _userLatLng?.longitude.toString() ?? "",
          "serviceProvider": AppPreference().getInt(PreferencesKey.userId),
          "serviceProviderLatitude": pos.latitude.toString(),
          "serviceProviderLongitude": pos.longitude.toString(),
        },
      );
    } catch (e) {
      print("Send Provider Error: $e");
    }
  }

  Future<void> _fetchBothLocations() async {
    try {
      final res = await ApiService.postRequest(
        getLocation,
        {
          "user": customerId,
          "serviceProvider": AppPreference().getInt(PreferencesKey.userId),
        },
      );

      final data = res.data;

      try {
        // -------- USER ----------
        if (data != null && data["user"] != null) {
          final ulatStr = data["user"]["latitude"].toString();
          final ulngStr = data["user"]["longitude"].toString();
          double ulat = double.parse(ulatStr);
          double ulng = double.parse(ulngStr);
          _userLatLng = LatLng(ulat, ulng);
          _updateUserMarker();
        } else {
          _userLatLng = null;
        }

        // ------ PROVIDER ------
        if (data != null && data["serviceprovider"] != null) {
          final platStr = data["serviceprovider"]["latitude"].toString();
          final plngStr = data["serviceprovider"]["longitude"].toString();
          double plat = double.parse(platStr);
          double plng = double.parse(plngStr);
          _providerLatLng = LatLng(plat, plng);
          _updateProviderMarker();
        }

        // Debug
        print("DEBUG - Provider: $_providerLatLng");
        print("DEBUG - User: $_userLatLng");

        // ----- REAL ROAD ROUTE -----
        if (_userLatLng != null && _providerLatLng != null) {
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
              _polylines = {};
              distanceText = _formatDistance(distanceMeters);
              durationText = "Less than a minute";
              arrivalTime = _formatTime(DateTime.now());
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
            print("DEBUG - Directions returned no route (empty). Using straight distance.");
            setState(() {
              _polylines = {};
              distanceText = _formatDistance(distanceMeters);
              // keep durationText as is or fallback
              if (durationText.isEmpty) {
                durationText = _formatApproxDuration(distanceMeters);
              }
            });
          } else {
            _drawRealRoute(realRoute);
          }
        } else {
          print("DEBUG - One of locations is null, cannot draw route.");
          setState(() {
            _polylines = {};
            distanceText = "";
            durationText = "";
            arrivalTime = "";
          });
        }
      } catch (e) {
        print("PARSE ERROR: $e");
      }
    } catch (e) {
      print("Get Both Error: $e");
    }
  }

  Future<List<LatLng>> _getPolylineRoute(LatLng start, LatLng end) async {
    try {
      final String url =
          "https://maps.googleapis.com/maps/api/directions/json?"
          "origin=${start.latitude},${start.longitude}"
          "&destination=${end.latitude},${end.longitude}"
          "&mode=driving"
          "&departure_time=now"
          "&key=$googleApiKey";

      print("DEBUG - Directions URL: $url");

      final res = await ApiService.getRequest(url);

      final data = res.data;

      print("DEBUG - Directions response: ${data}");

      final status = (data["status"] ?? "").toString();
      print("DEBUG - Directions API status: $status");
      if (status != "OK") {
        print("Directions API not OK: $status");
        return [];
      }

      if (data["routes"] != null && data["routes"].isNotEmpty) {
        // Extract distance & duration from legs[0]
        try {
          final leg = data["routes"][0]["legs"][0];
          if (leg != null) {
            setState(() {
              distanceText = (leg["distance"] != null && leg["distance"]["text"] != null)
                  ? leg["distance"]["text"].toString()
                  : "";
              durationText = (leg["duration"] != null && leg["duration"]["text"] != null)
                  ? leg["duration"]["text"].toString()
                  : "";

              final int durationSec = (leg["duration"] != null && leg["duration"]["value"] != null)
                  ? int.parse(leg["duration"]["value"].toString())
                  : 0;

              final DateTime arrival = DateTime.now().add(Duration(seconds: durationSec));
              arrivalTime = _formatTime(arrival);
            });
          }
        } catch (e) {
          print("Failed to parse legs: $e");
        }

        String encoded = data["routes"][0]["overview_polyline"]["points"];
        return _decodePolyline(encoded);
      } else {
        return [];
      }
    } catch (e) {
      print("Directions Error: $e");
      return [];
    }
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

  String _formatDistance(double meters) {
    if (meters < 1000) {
      return "${meters.toStringAsFixed(0)} m";
    } else {
      double km = meters / 1000;
      return "${km.toStringAsFixed(1)} km";
    }
  }

  String _formatApproxDuration(double meters) {
    // fallback: assume avg speed 40 km/h => 11.11 m/s
    final avgMetersPerSec = 11.11;
    final sec = (meters / avgMetersPerSec).round();
    if (sec < 60) return "${sec}s";
    final mins = (sec / 60).round();
    return "${mins} min";
  }

  String _formatTime(DateTime dt) {
    final hour = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
    final minute = dt.minute.toString().padLeft(2, '0');
    final ampm = dt.hour >= 12 ? "PM" : "AM";
    return "$hour:$minute $ampm";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Your Service has started'),
      body: Stack(
        children: [
          GoogleMap(
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

          // Bottom panel
          Positioned(
            left: 0,
            right: 0,
            bottom: 1,
            child: Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(14),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFE4F9FF),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Time big
                    Text(
                      durationText.isEmpty ? "Calculating..." : durationText,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // distance + arrival time row
                    Row(
                      children: [
                        // dot + distance
                        Row(
                          children: [
                            const Text("• ", style: TextStyle(fontSize: 16)),
                            Text(
                              distanceText.isEmpty ? "-" : distanceText,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),

                        // dot + ETA
                        Row(
                          children: [
                            const Text("• ", style: TextStyle(fontSize: 16)),
                            Text(
                              arrivalTime.isEmpty ? "-" : arrivalTime,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Buttons row
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF004271),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => PunchInScreen(
                                      bookingId: widget.bookingId!,
                                      serviceId: widget.serviceId!,
                                      serviceName: widget.serviceName!,
                                    ),
                                  ),
                                );

                              },
                              child: const Text(
                                "Punch In",
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Color(0xFF004271)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                // TODO: Exit action
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Exit",
                                style: TextStyle(
                                  color: Color(0xFF004271),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
