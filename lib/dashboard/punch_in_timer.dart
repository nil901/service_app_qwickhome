// // import 'package:flutter/material.dart';
// // import 'package:hexcolor/hexcolor.dart';
// // import 'package:service_app_qwickhome/dashboard/punch_out_screen.dart';
// // import '../colors/colors.dart';
// // import '../utils/custom_app_bar.dart';
// // import '../utils/size.dart';
// //
// // class TimerScreen extends StatefulWidget {
// //   final String bookingId;
// //   final String userId;
// //
// //   const TimerScreen({
// //     super.key,
// //     required this.bookingId,
// //     required this.userId,
// //   });
// //
// //   @override
// //   State<TimerScreen> createState() => _TimerScreenState();
// // }
// //
// // class _TimerScreenState extends State<TimerScreen> {
// //   File? midImage;
// //   TextEditingController midNotesCtrl = TextEditingController();
// //   bool uploading = false;
// //
// //
// //   Future<File?> compressImage(File file) async {
// //     final dir = await getTemporaryDirectory();
// //     final targetPath = p.join(
// //       dir.path,
// //       "${DateTime.now().millisecondsSinceEpoch}.jpg",
// //     );
// //
// //     XFile? result = await FlutterImageCompress.compressAndGetFile(
// //       file.absolute.path,
// //       targetPath,
// //       quality: 60,
// //     );
// //
// //     return result == null ? null : File(result.path);
// //   }
// //
// //   /// ✅ Take / Compress Mid Image
// //   Future<void> pickMidImage() async {
// //     final picked = await ImagePicker().pickImage(source: ImageSource.camera);
// //
// //     if (picked != null) {
// //       File original = File(picked.path);
// //       File? compressed = await compressImage(original);
// //
// //       setState(() {
// //         midImage = compressed ?? original;
// //       });
// //     }
// //   }
// //
// //   /// ✅ Call Mid-Progress API
// //   Future<void> uploadMidProgress() async {
// //     if (midImage == null) {
// //       ScaffoldMessenger.of(context)
// //           .showSnackBar(SnackBar(content: Text("Please add mid-service photo 📸")));
// //       return;
// //     }
// //
// //     setState(() => uploading = true);
// //
// //     try {
// //       FormData data = FormData.fromMap({
// //         "serviceProvider": widget.userId,
// //         "bookingId": widget.bookingId,
// //         "midNotes": midNotesCtrl.text,
// //         "midImage": await MultipartFile.fromFile(
// //           midImage!.path,
// //           filename: midImage!.path.split('/').last,
// //           contentType: MediaType("image", "jpeg"),
// //         ),
// //       });
// //
// //       final res = await ApiService.postMultipart(updateMidProgressUrl, data);
// //
// //       if (res.data["success"] == true) {
// //         ScaffoldMessenger.of(context)
// //             .showSnackBar(SnackBar(content: Text("Mid progress uploaded ✅")));
// //
// //         setState(() {
// //           midImage = null;
// //           midNotesCtrl.clear();
// //         });
// //       }
// //     } catch (e) {
// //       ScaffoldMessenger.of(context)
// //           .showSnackBar(SnackBar(content: Text("Upload failed ❌")));
// //     }
// //
// //     setState(() => uploading = false);
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: CustomAppBar(title: 'Timer'),
// //       backgroundColor: kwhite,
// //       body: SingleChildScrollView(
// //         padding: EdgeInsets.all(8),
// //         child: Column(
// //           children: [
// //             Container(
// //                 width: double.infinity,
// //                 margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
// //                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
// //                 decoration: BoxDecoration(
// //                   color: Colors.white,
// //                   borderRadius: BorderRadius.circular(15),
// //                   border: Border.all(color: HexColor('#e5e5e5'), width: 0.85),
// //                   boxShadow: [
// //                     BoxShadow(
// //                       blurRadius: 4,
// //                       color: Colors.black.withOpacity(0.04),
// //                       offset: const Offset(0, 2),
// //                     ),
// //                   ],
// //                 ),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Row(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         CircleAvatar(
// //                           radius: 20,
// //                           child: Image.asset('assets/images/user_img.png'),
// //                         ),
// //                         const SizedBox(width: 12),
// //                         Expanded(
// //                           child: Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               Text(
// //                                 "Riya Sharma",
// //                                 style: const TextStyle(
// //                                     fontWeight: FontWeight.bold,
// //                                     fontSize: 15.5,
// //                                     color: Colors.black),
// //                               ),
// //                               const SizedBox(height: 3),
// //                               Text(
// //                                 "Service - Deep Wardrobe Assistance + Ironing",
// //                                 style: const TextStyle(
// //                                   fontSize: 13.5,
// //                                   fontWeight: FontWeight.w500,
// //                                   color: Colors.black,
// //                                 ),
// //                               ),
// //                               const SizedBox(height: 4),
// //                               Text(
// //                                 "Date & Time – 04 Oct 2025, 10:00 AM - 12:00 PM",
// //                                 style: const TextStyle(fontSize: 13, color: Colors.black),
// //                               ),
// //                               const SizedBox(height: 4),
// //                               Text(
// //                                 "Address – 8, Rosewood Villas, Nashik",
// //                                 style: const TextStyle(fontSize: 13, color: Colors.black),
// //                                 maxLines: 2,
// //                                 overflow: TextOverflow.ellipsis,
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                     const SizedBox(height: 8),
// //                   ],
// //                 ),
// //               ),
// //
// //
// //             SizedBox(height: 30),
// //
// //             // ✅ Timer Text
// //             Text(
// //               "01:15:42",
// //               style: TextStyle(
// //                 fontSize: 42,
// //                 fontWeight: FontWeight.bold,
// //                 color: Colors.black,
// //               ),
// //             ),
// //             SizedBox(height: 6),
// //             Text("Timer started at 10:05 AM", style: TextStyle(color: Colors.black54)),
// //             Text("Timer will continue until you punch out", style: TextStyle(color: Colors.black54, fontSize: 12)),
// //
// //             SizedBox(height: 30),
// //
// //             // ✅ Mid-Service Photo Card
// //             Container(
// //               width: 375,
// //               padding: EdgeInsets.all(15),
// //               decoration: BoxDecoration(
// //                 color: Color(0xFFFCFCFC),
// //                 borderRadius: BorderRadius.circular(15),
// //                 border: Border.all(color: Color(0xFFDBDBDB), width: 0.5),
// //                 boxShadow: [
// //                   BoxShadow(
// //                     blurRadius: 4,
// //                     color: Colors.black.withOpacity(0.05),
// //                     offset: Offset(0, 4),
// //                   )
// //                 ],
// //               ),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text("Mid - Service photo", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
// //
// //                   SizedBox(height: 8),
// //                   ElevatedButton.icon(
// //                     onPressed: (){},
// //                     icon: Icon(Icons.camera_alt, size: 18),
// //                     label: Text("Add Mid - Service Photo"),
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: Colors.white,
// //                       foregroundColor: Colors.black,
// //                       elevation: 1,
// //                       minimumSize: Size(double.infinity, 40),
// //                       alignment: Alignment.centerLeft,
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(10),
// //                         side: BorderSide(color: Color(0xFFDCDCDC), width: 0.8),
// //                       ),
// //                     ),
// //                   ),
// //
// //                   SizedBox(height: 16),
// //
// //                   Text("Elapsed Time : 1 hr 15 mins", style: TextStyle(fontSize: 13)),
// //                   Text("Estimated Time Left : 45 mins", style: TextStyle(fontSize: 13)),
// //                 ],
// //               ),
// //             ),
// //
// //             SizedBox(height: 230),
// //             Padding(
// //               padding:
// //               const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
// //               child: SizedBox(
// //                 width: double.infinity,
// //                 height: 44,
// //                 child: ElevatedButton(
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: HexColor('#004271'),
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(15),
// //                     ),
// //                   ),
// //                   onPressed: () {
// //                     uploading ? null : uploadMidProgress;
// //                     Navigator.push(context, MaterialPageRoute(builder: (context)=> PunchOutScreen()));
// //                   },
// //                   child: const Text(
// //                     "Punch Out Now",
// //                     style: TextStyle(
// //                       fontSize: 14,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
//
//
// import 'dart:async';
// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as p;
// import 'package:http_parser/http_parser.dart';
// import '../colors/colors.dart';
// import '../utils/custom_app_bar.dart';
// import '../dashboard/punch_out_screen.dart';
// import '../api_service/api_services.dart';
// import '../api_service/urls.dart';
//
//
// class TimerScreen extends StatefulWidget {
//   final String bookingId;
//   final String userId;
//   final String userName;
//   final String userImage;
//   final String serviceName;
//   final String address;
//   final String scheduleDate;
//   final String scheduleTime;
//   final String startTime;
//
//
//   const TimerScreen({
//     super.key,
//     required this.bookingId,
//     required this.userId,
//     required this.userImage,
//     required this.userName,
//     required this.serviceName,
//     required this.address,
//     required this.scheduleDate,
//     required this.scheduleTime,
//
//     required this.startTime,
//   });
//
//   @override
//   State<TimerScreen> createState() => _TimerScreenState();
// }
//
// class _TimerScreenState extends State<TimerScreen> {
//   File? midImage;
//   TextEditingController midNotesCtrl = TextEditingController();
//   bool uploading = false;
//
//   Duration elapsed = Duration.zero;
//   Timer? timer;
//
//   @override
//   void initState() {
//     super.initState();
//
//     DateTime start = DateTime.parse(widget.startTime);
//
//     timer = Timer.periodic(Duration(seconds: 1), (t) {
//       setState(() {
//         elapsed = DateTime.now().difference(start);
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }
//
//   String formatTime(Duration d) {
//     String two(int n) => n.toString().padLeft(2, '0');
//     return "${two(d.inHours)}:${two(d.inMinutes.remainder(60))}:${two(d.inSeconds.remainder(60))}";
//   }
//
//   Future<File?> compressImage(File file) async {
//     final dir = await getTemporaryDirectory();
//     final targetPath = p.join(dir.path, "${DateTime.now().millisecondsSinceEpoch}.jpg");
//
//     XFile? result = await FlutterImageCompress.compressAndGetFile(
//       file.absolute.path,
//       targetPath,
//       quality: 60,
//     );
//
//     return result == null ? null : File(result.path);
//   }
//
//   Future<void> pickMidImage() async {
//     final picked = await ImagePicker().pickImage(source: ImageSource.camera);
//
//     if (picked != null) {
//       File original = File(picked.path);
//       File? compressed = await compressImage(original);
//
//       setState(() {
//         midImage = compressed ?? original;
//       });
//     }
//   }
//
//   Future<void> uploadMidProgress() async {
//     if (midImage == null) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text("Please add mid-service photo 📸")));
//       return;
//     }
//
//     setState(() => uploading = true);
//
//     try {
//       print("📤 Preparing mid-progress upload...");
//       print("👤 Service Provider ID: ${widget.userId}");
//       print("📦 Booking ID: ${widget.bookingId}");
//       print("📝 Notes: ${midNotesCtrl.text}");
//       print("📸 Image Path: ${midImage!.path}");
//
//       FormData data = FormData.fromMap({
//         "serviceProvider": widget.userId,
//         "bookingId": widget.bookingId,
//         "midNotes": midNotesCtrl.text,
//         "midImage": await MultipartFile.fromFile(
//           midImage!.path,
//           filename: midImage!.path.split('/').last,
//           contentType: MediaType("image", "jpeg"), // ✅ fixed
//         ),
//       });
//
//       print("✅ FormData Prepared:");
//       data.fields.forEach((e) {
//         print("FIELD -> ${e.key}: ${e.value}");
//       });
//
//       for (var file in data.files) {
//         print("FILE -> ${file.key}: ${file.value.filename}");
//       }
//
//       final res = await ApiService.postMultipart(updateMidProgressUrl, data);
//
//       print("✅ API Response: ${res.data}");
//
//       if (res.data["success"] == true) {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text("Mid progress uploaded ✅")));
//
//         setState(() {
//           midImage = null;
//           midNotesCtrl.clear();
//         });
//       } else {
//         print("❌ Server returned error: ${res.data}");
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text("Server Error ❌")));
//       }
//
//     } catch (e) {
//       print("🚨 Upload Failed: $e");
//
//       if (e is DioException && e.response != null) {
//         print("❗ Server Error Response: ${e.response!.data}");
//       }
//
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text("Upload failed ❌")));
//     }
//
//     setState(() => uploading = false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: 'Service Timer'),
//       backgroundColor: kwhite,
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.all(8),
//               child: Column(
//                 children: [
//                   // ✅ Customer Details Box
//                   Container(
//                     width: double.infinity,
//                     margin: EdgeInsets.all(12),
//                     padding: EdgeInsets.all(15),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15),
//                       border: Border.all(color: HexColor('#e5e5e5'), width: 0.85),
//                       boxShadow: [
//                         BoxShadow(
//                           blurRadius: 4,
//                           color: Colors.black.withOpacity(0.05),
//                           offset: Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CircleAvatar(
//                           radius: 22,
//                           backgroundImage: widget.userImage.isNotEmpty
//                               ? NetworkImage(widget.userImage)
//                               : AssetImage('assets/images/user_img.png') as ImageProvider,
//                         ),
//
//                         SizedBox(width: 10),
//
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(widget.userName,
//                                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                               SizedBox(height: 4),
//                               Text("Service - ${widget.serviceName}", style: TextStyle(fontSize: 13)),
//                               SizedBox(height: 4),
//                               Text("Date & Time – ${widget.scheduleDate}, ${widget.scheduleTime}",
//                                 style: TextStyle(fontSize: 13),
//                               ),
//                               SizedBox(height: 4),
//                               Text("Address: ${widget.address}",
//                                   maxLines: 2, overflow: TextOverflow.ellipsis),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//
//                   SizedBox(height: 25),
//
//                   // ✅ Live Timer UI
//                   Text(
//                     formatTime(elapsed),
//                     style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 6),
//                   Text(
//                     "Timer started at ${TimeOfDay.fromDateTime(DateTime.parse(widget.startTime)).format(context)}",
//                     style: TextStyle(color: Colors.black54),
//                   ),
//                   Text("Timer is running until you Punch Out",
//                       style: TextStyle(color: Colors.black54, fontSize: 12)),
//
//                   SizedBox(height: 30),
//
//                   // ✅ Mid Service Card
//                   Container(
//                     width: double.infinity,
//                     padding: EdgeInsets.all(15),
//                     decoration: BoxDecoration(
//                       color: Color(0xFFFCFCFC),
//                       borderRadius: BorderRadius.circular(15),
//                       border: Border.all(color: Color(0xFFDBDBDB), width: 0.5),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Mid - Service Photo",
//                             style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
//
//                         SizedBox(height: 8),
//
//                         ElevatedButton.icon(
//                           onPressed: pickMidImage,
//                           icon: Icon(Icons.camera_alt),
//                           label: Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("Add Mid - Service Photo"),
//                             ],
//                           ),
//                           style: ElevatedButton.styleFrom(
//                             minimumSize: Size(500, 44),  // width = 310, height = 38
//                             backgroundColor: Colors.white,
//                             foregroundColor: Colors.black,
//                             elevation: 0,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               side: BorderSide(
//                                 color: Color(0xFFA9A9A9),
//                                 width: 0.5,
//                               ),
//                             ),
//                           ),
//                         ),
//
//                         if (midImage != null) ...[
//                           SizedBox(height: 10),
//                           Image.file(midImage!, height: 120)
//                         ],
//
//                         SizedBox(height: 10),
//
//                         Text("Elapsed Time : 1 hr 15 mins", style: TextStyle(fontSize: 13)),
//                         Text("Estimated Time Left : 45 mins", style: TextStyle(fontSize: 13)),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 20,
//               vertical: 18,
//             ),
//             child: SizedBox(
//               width: double.infinity,
//               height: 44,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: HexColor('#004271'),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                 ),
//                     onPressed: () async {
//                       timer?.cancel();
//                       await uploadMidProgress();
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (c) => PunchOutScreen()));
//                     },
//                 child: const Text(
//                   "Punch Out Now",
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../colors/colors.dart';
import '../utils/custom_app_bar.dart';
import '../dashboard/punch_out_screen.dart';
import '../api_service/api_services.dart';
import '../api_service/urls.dart';

class TimerScreen extends StatefulWidget {
  final String bookingId;
  final String userId;
  final String userName;
  final String userImage;
  final String serviceName;
  final String address;
  final String scheduleDate;
  final String scheduleTime;
  final String startTime;
  final int serviceId;
  // final String serviceName;


  const TimerScreen({
    super.key,
    required this.bookingId,
    required this.userId,
    required this.userImage,
    required this.userName,
    required this.serviceName,
    required this.address,
    required this.scheduleDate,
    required this.scheduleTime,
    required this.startTime,
    required this.serviceId,
    // required this.serviceName,
  });

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  File? midImage;
  TextEditingController midNotesCtrl = TextEditingController();
  bool uploading = false;

  Duration elapsed = Duration.zero;
  Timer? timer;
  Timer? apiTimer;

  String apiElapsedTime = "00:00";
  String apiRemainingTime = "00:00";
  String apiLimitTime = "00:00";

  @override
  void initState() {
    super.initState();

    // Start UI Timer
    DateTime start = DateTime.parse(widget.startTime);
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        elapsed = DateTime.now().difference(start);
      });
    });

    // Start Backend Timer (Every 5 seconds)
    apiTimer = Timer.periodic(Duration(seconds: 5), (t) {
      fetchTimerData();
    });

    // First API call
    fetchTimerData();
  }

  @override
  void dispose() {
    timer?.cancel();
    apiTimer?.cancel();
    super.dispose();
  }

  String formatTime(Duration d) {
    String two(int n) => n.toString().padLeft(2, '0');
    return "${two(d.inHours)}:${two(d.inMinutes.remainder(60))}:${two(d.inSeconds.remainder(60))}";
  }

  // Compress Image
  Future<File?> compressImage(File file) async {
    final dir = await getTemporaryDirectory();
    final targetPath = p.join(dir.path, "${DateTime.now().millisecondsSinceEpoch}.jpg");

    XFile? result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 60,
    );

    return result == null ? null : File(result.path);
  }

  // Pick Mid Image
  Future<void> pickMidImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.camera);

    if (picked != null) {
      File original = File(picked.path);
      File? compressed = await compressImage(original);

      setState(() {
        midImage = compressed ?? original;
      });
    }
  }

  // ⏳ FETCH TIMER API
  Future<void> fetchTimerData() async {
    try {
      FormData data = FormData.fromMap({
        "bookingId": widget.bookingId,
      });

      final res = await ApiService.postMultipart(GetTimerUrl, data);

      if (res.data["success"] == true) {
        final timerData = res.data["data"];

        setState(() {
          apiElapsedTime = timerData["elapsed_time"] ;
          apiRemainingTime = timerData["remaining_time"];
          apiLimitTime = timerData["limit_time"] ;
        });

        // If time is over
        if (apiRemainingTime == "00:00") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Time is over — Please Punch Out!")),
          );
        }
      }
    } catch (e) {
      print("Timer API Error: $e");
    }
  }

  // Upload Mid Progress
  Future<void> uploadMidProgress() async {
    if (midImage == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please add mid-service photo 📸")));
      return;
    }

    setState(() => uploading = true);

    try {
      FormData data = FormData.fromMap({
        "serviceProvider": widget.userId,
        "bookingId": widget.bookingId,
        "midNotes": midNotesCtrl.text,
        "midImage": await MultipartFile.fromFile(
          midImage!.path,
          filename: midImage!.path.split('/').last,
          // contentType: MediaType("image", "jpeg"),
        ),
      });

      final res = await ApiService.postMultipart(updateMidProgressUrl, data);

      if (res.data["success"] == true) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Mid progress uploaded ✅")));

        setState(() {
          midImage = null;
          midNotesCtrl.clear();
        });
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Server Error ❌")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Upload failed ❌")));
    }

    setState(() => uploading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Service Timer'),
      backgroundColor: kwhite,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  // CUSTOMER CARD
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: HexColor('#e5e5e5'), width: 0.85),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.05),
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundImage: widget.userImage.isNotEmpty
                              ? NetworkImage(widget.userImage)
                              : AssetImage('assets/images/user_img.png') as ImageProvider,
                        ),

                        SizedBox(width: 10),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.userName,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              SizedBox(height: 4),
                              Text("Service - ${widget.serviceName}", style: TextStyle(fontSize: 13)),
                              SizedBox(height: 4),
                              Text("Date & Time – ${widget.scheduleDate}, ${widget.scheduleTime}",
                                  style: TextStyle(fontSize: 13)),
                              SizedBox(height: 4),
                              Text("Address: ${widget.address}",
                                  maxLines: 2, overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 25),

                  // LIVE TIMER UI
                  Text(
                    formatTime(elapsed),
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Timer started at ${TimeOfDay.fromDateTime(DateTime.parse(widget.startTime)).format(context)}",
                    style: TextStyle(color: Colors.black54),
                  ),
                  Text("Timer is running until you Punch Out",
                      style: TextStyle(color: Colors.black54, fontSize: 12)),

                  SizedBox(height: 30),

                  // MID SERVICE CARD
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Color(0xFFFCFCFC),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Color(0xFFDBDBDB), width: 0.5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mid - Service Photo",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),

                        SizedBox(height: 8),

                        ElevatedButton.icon(
                          onPressed: pickMidImage,
                          icon: Icon(Icons.camera_alt),
                          label: Text("Add Mid - Service Photo"),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(500, 44),
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Color(0xFFA9A9A9),
                                width: 0.5,
                              ),
                            ),
                          ),
                        ),

                        if (midImage != null) ...[
                          SizedBox(height: 10),
                          Image.file(midImage!, height: 120)
                        ],

                        SizedBox(height: 10),

                        Text("Elapsed Time : $apiElapsedTime", style: TextStyle(fontSize: 13)),
                        Text("Estimated Time Left : $apiRemainingTime",
                            style: TextStyle(fontSize: 13)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // PUNCH OUT BUTTON
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
                onPressed: () async {
                  timer?.cancel();
                  apiTimer?.cancel();
                  await uploadMidProgress();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (c) => PunchOutScreen(
                        bookingId: widget.bookingId,
                        userName: widget.userName,
                        userImage: widget.userImage,
                        serviceName: widget.serviceName,
                        address: widget.address,
                        scheduleDate: widget.scheduleDate,
                        scheduleTime: widget.scheduleTime,
                        serviceId: widget.serviceId,


                      ),
                    ),
                  );

                },
                child: const Text(
                  "Continue Punch Out",
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


