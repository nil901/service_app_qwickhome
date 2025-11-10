// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:service_app_qwickhome/dashboard/punch_in_timer.dart';
// import '../colors/colors.dart';
// import '../utils/custom_app_bar.dart';
// import '../utils/size.dart';
//
// class PunchInScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      appBar: CustomAppBar(title: 'Punch In'),
//       backgroundColor: kwhite,
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//
//         Container(
//           width: double.infinity,
//         margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(15),
//           border: Border.all(color: HexColor('#e5e5e5'), width: 0.85),
//           boxShadow: [
//             BoxShadow(
//               blurRadius: 4,
//               color: Colors.black.withOpacity(0.04),
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CircleAvatar(
//                   radius: 20,
//                   child: Image.asset('assets/images/user_img.png'),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Riya Sharma",
//                         style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15.5,
//                             color: Colors.black),
//                       ),
//                       const SizedBox(height: 3),
//                       Text(
//                         "Service - Deep Wardrobe Assistance + Ironing",
//                         style: const TextStyle(
//                           fontSize: 13.5,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         "Date & Time – 04 Oct 2025, 10:00 AM - 12:00 PM",
//                         style: const TextStyle(fontSize: 13, color: Colors.black),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         "Address – 8, Rosewood Villas, Nashik",
//                         style: const TextStyle(fontSize: 13, color: Colors.black),
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       h20,
//                       GestureDetector(
//                         onTap: () {},
//                         child: Text(
//                           "View Details about the Service",
//                           style: TextStyle(
//                             color: HexColor('#004271'),
//                             fontWeight: FontWeight.w600,
//                             fontSize: 13,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//           ],
//           ),
//         ),
//             SizedBox(height: 24),
//             Padding(
//               padding: const EdgeInsets.only(left: 20.0),
//               child: Text('Confirm your arrival time', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
//             ),
//             SizedBox(height: 8),
//             Padding(
//               padding: const EdgeInsets.all(14.0),
//               child: Container(
//                 width: double.infinity,
//                 height: 290,
//                 padding: EdgeInsets.all(30),
//                 decoration: BoxDecoration(
//                   color: Color(0xFFFCFCFC), // background
//                   borderRadius: BorderRadius.circular(15),
//                   border: Border.all(color: Color(0xFFDBDBDB), width: 0.5),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.05),
//                       blurRadius: 4,
//                       offset: Offset(0, 4),
//                     ),
//                   ],
//                 ),
//
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       '10:05 AM',
//                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                     ),
//
//                     Text(
//                       'Address: B, Rosewood Villas, Nashik',
//                       style: TextStyle(fontSize: 13, color: Colors.black54),
//                     ),
//
//                     SizedBox(height: 16),
//
//                     Text(
//                       'Take a photo at customer location',
//                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//                     ),
//
//                     SizedBox(height: 8),
//
//                     ElevatedButton.icon(
//                       icon: Icon(Icons.photo_camera),
//                       label: Text('Capture a photo to start the service'),
//                       onPressed: () {
//                         // TODO: Add photo logic
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.white,
//                         foregroundColor: Colors.black,
//                         elevation: 2,
//                         minimumSize: Size(double.infinity, 44),
//                         alignment: Alignment.centerLeft,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           side: BorderSide(color: Colors.black12),
//                         ),
//                       ),
//                     ),
//
//                     SizedBox(height: 10),
//
//                     Text('Add notes (optional)',
//                         style: TextStyle(fontSize: 14, color: Colors.black54)),
//                     SizedBox(height: 12),
//                     SizedBox(
//                       width: 350,
//                       height: 38,
//                       child: TextField(
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//                           hintText: 'E.g, reached location, started setup....',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),  // 10px radius
//                             borderSide: BorderSide(
//                               color: Color(0xFFDBDBDB), // Light border
//                               width: 0.5, // 0.5px border
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(
//                               color: Color(0xFFDBDBDB),
//                               width: 0.5,
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(
//                               color: Color(0xFF004271), // Focus color
//                               width: 1,
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//
//             Spacer(),
//             // Punch in button
//             SizedBox(
//               width: double.infinity,
//               child:
//               Padding(
//                 padding:
//                 const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
//                 child: SizedBox(
//                   width: double.infinity,
//                   height: 44,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: HexColor('#004271'),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=> TimerScreen()));
//                     },
//                     child: const Text(
//                       "Punch In Now",
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//


import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:service_app_qwickhome/dashboard/punch_in_timer.dart';
import '../colors/colors.dart';
import '../utils/custom_app_bar.dart';
import '../utils/size.dart';

import '../api_service/api_services.dart';
import '../api_service/urls.dart';
import '../models/punchin_get_model.dart';

class PunchInScreen extends StatefulWidget {
  final String bookingId;

  const PunchInScreen({super.key, required this.bookingId});

  @override
  State<PunchInScreen> createState() => _PunchInScreenState();
}

class _PunchInScreenState extends State<PunchInScreen> {
  PunchInDetailModel? punchData;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    fetchPunchInDetails();
  }

  Future<void> fetchPunchInDetails() async {
    setState(() => loading = true);

    try {
      final res = await ApiService.postRequest(
        punchInDetailPageGet, // ✅ API URL
        {"bookingId": widget.bookingId}, // ✅ Dynamic bookingId
      );

      if (res.data["success"] == true) {
        punchData = PunchInDetailModel.fromJson(res.data);
      }
    } catch (e) {
      debugPrint("Punch API Error: $e");
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Punch In'),
      backgroundColor: kwhite,
      body: loading || punchData == null
          ? const Center(child: CircularProgressIndicator())
          : _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    final user = punchData!.data!.userDetails;
    final service = punchData!.data!.serviceDetails;
    final address = punchData!.data!.defaultAddress;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: HexColor('#e5e5e5'), width: 0.85),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.04),
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(user!.image ?? ""),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name ?? "",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.5,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            "Service - ${service!.name}",
                            style: const TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Date & Time – ${punchData!.data!.scheduledDate}, ${punchData!.data!.preferredTime}",
                            style: const TextStyle(fontSize: 13, color: Colors.black),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Address – ${address!.addressDetails}",
                            style: const TextStyle(fontSize: 13, color: Colors.black),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          h20,
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "View Details about the Service",
                              style: TextStyle(
                                color: HexColor('#004271'),
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),

          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text('Confirm your arrival time',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          ),
          const SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              width: double.infinity,
              height: 290,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: const Color(0xFFFCFCFC),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFFDBDBDB), width: 0.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TimeOfDay.now().format(context),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),

                  Text(
                    'Address: ${address.addressDetails}',
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    'Take a photo at customer location',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),

                  const SizedBox(height: 8),

                  ElevatedButton.icon(
                    icon: const Icon(Icons.photo_camera),
                    label: const Text('Capture a photo to start the service'),
                    onPressed: () {
                      // TODO: add camera later
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      elevation: 2,
                      minimumSize: const Size(double.infinity, 44),
                      alignment: Alignment.centerLeft,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(color: Colors.black12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text('Add notes (optional)',
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                  const SizedBox(height: 12),

                  SizedBox(
                    width: 350,
                    height: 38,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        hintText: 'E.g, reached location, started setup....',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: HexColor('#004271'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => TimerScreen()));
                },
                child: const Text(
                  "Punch In Now",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
