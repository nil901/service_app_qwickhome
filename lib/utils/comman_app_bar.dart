// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
//
// import '../dashboard/notification_screen.dart';
//
// class CommanAppBar extends StatelessWidget implements PreferredSizeWidget {
//
//   const CommanAppBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity, // responsive width
//       height: preferredSize.height,
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       decoration: BoxDecoration(
//         color: HexColor('#E4F9FF'),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.15),
//             offset: const Offset(0, 3),
//             blurRadius: 4,
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // Location + Name Column
//           Expanded(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center, // center content
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // const Icon(Icons.location_on, color: Colors.black, size: 30),
//                 Image.asset('assets/images/user_img.png', height: 35, width: 45,),
//                 const SizedBox(width: 4),
//                 Flexible( // Flexible instead of Expanded to avoid cutting text
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(
//                         "Patil Classics",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Flexible(
//                             child: Text(
//                               "Tidake colony, Durwankur Lawns, Nashik ....",
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.grey.shade700,
//                               ),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           const Icon(
//                             Icons.keyboard_arrow_down,
//                             size: 16,
//                             color: Colors.black,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           // Notification Icon Only (Cart removed)
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => NotificationScreen(),
//                 ),
//               );
//             },
//             icon: const Icon(
//               Icons.notifications_none,
//               color: Colors.black,
//               size: 24,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Size get preferredSize => const Size.fromHeight(130);
// }


import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hexcolor/hexcolor.dart';
import '../dashboard/notification_screen.dart';

class CommanAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CommanAppBar({super.key});

  @override
  State<CommanAppBar> createState() => _CommanAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(130);
}

class _CommanAppBarState extends State<CommanAppBar> {
  String currentCity = "Fetching...";
  String currentAddress = "Loading...";

  @override
  void initState() {
    super.initState();
    getUserLocation();
  }

  Future<void> getUserLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        throw Exception("GPS is OFF");
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception("Permission Denied Forever");
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      print("LAT: ${position.latitude}, LNG: ${position.longitude}");

      List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks.first;

      setState(() {
        currentCity = place.locality ?? "Unknown City";
        currentAddress =
        "${place.street ?? ''}, ${place.subLocality ?? ''}, ${place.locality ?? ''}";
      });
    } catch (e) {
      print("LOCATION ERROR: $e");
      setState(() {
        currentCity = "Error";
        currentAddress = "Unable to fetch location";
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.preferredSize.height,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: HexColor('#E4F9FF'),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(0, 3),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Location + Name Column
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/user_img.png', height: 35, width: 45),
                const SizedBox(width: 4),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentCity,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              currentAddress,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade700,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Icon(Icons.keyboard_arrow_down,
                              size: 16, color: Colors.black),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Notification Icon
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
