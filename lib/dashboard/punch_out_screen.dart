import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:service_app_qwickhome/dashboard/service_details_screen.dart';
import '../colors/colors.dart';
import '../utils/custom_app_bar.dart';
import '../utils/size.dart';
import '../api_service/api_services.dart';
import '../api_service/urls.dart';
import '../prefs/app_preference.dart';
import '../prefs/preferece_keys.dart';

class PunchOutScreen extends StatefulWidget {
  final String bookingId;
  final String userName;
  final String userImage;
  final String serviceName;
  final String address;
  final String scheduleDate;
  final String scheduleTime;
  final int serviceId;


  const PunchOutScreen({
    super.key,
    required this.bookingId,
    required this.userName,
    required this.userImage,
    required this.serviceName,
    required this.address,
    required this.scheduleDate,
    required this.scheduleTime,
    required this.serviceId,

  });

  @override
  State<PunchOutScreen> createState() => _PunchOutScreenState();
}

class _PunchOutScreenState extends State<PunchOutScreen> {
  File? completeImage;
  TextEditingController completeNotes = TextEditingController();
  bool loading = false;

  Future pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.camera);
    if (picked == null) return;

    setState(() {
      completeImage = File(picked.path);
    });
  }

  Future<File?> compressImage(File file) async {
    final dir = await getTemporaryDirectory();
    final target = '${dir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

    final result = await FlutterImageCompress.compressAndGetFile(
      file.path,
      target,
      quality: 70,
    );

    return result == null ? null : File(result.path);
  }

  Future punchOut() async {
    if (completeImage == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please upload completion photo")));
      return;
    }

    setState(() => loading = true);

    try {
      // Compress Image
      File? compressed = await compressImage(completeImage!);

      MultipartFile imageFile = await MultipartFile.fromFile(
        compressed!.path,
        filename: p.basename(compressed.path),
       // contentType: MediaType("image", "jpeg"), // 🔥 FIXED
      );

      FormData body = FormData.fromMap({
        "serviceProvider": AppPreference().getInt(PreferencesKey.userId).toString(),
        "bookingId": widget.bookingId,
        "completionNotes": completeNotes.text,
        "completionImage": imageFile, // 🔥 FIXED
      });

      print("---- Punch Out FormData ----");
      body.fields.forEach((e) => print("${e.key}: ${e.value}"));
      print("Image: ${compressed.path}");

      final res = await ApiService.postMultipart(punchOutUrl, body);

      print("PunchOut Response: ${res.data}");

      if (res.data["success"] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Punched Out Successfully ✓")),
        );
        Navigator.popUntil(context, (route) => route.isFirst);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Server Error: ${res.data["message"]}")),
        );
      }
    } catch (e) {
      print("PunchOut Error: $e");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Something went wrong: $e")));
    }

    setState(() => loading = false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Punch Out'),
      backgroundColor: kwhite,

      body: loading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // ====================== CUSTOMER CARD ======================
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: widget.userImage.isNotEmpty
                            ? NetworkImage(widget.userImage)
                            : const AssetImage('assets/images/user_img.png') as ImageProvider,
                      ),
                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.userName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.5),
                            ),
                            const SizedBox(height: 3),

                            Text(
                              "Service - ${widget.serviceName}",
                              style: const TextStyle(
                                  fontSize: 13.5, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 4),

                            Text(
                              "Date & Time – ${widget.scheduleDate}, ${widget.scheduleTime}",
                              style: const TextStyle(fontSize: 13),
                            ),
                            const SizedBox(height: 4),

                            Text(
                              "Address – ${widget.address}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 13),
                            ),
                            h20,
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ServicesDetailsScreen(
                                      serviceId: widget.serviceId,
                                      name: widget.serviceName,
                                    ),
                                  ),
                                );
                              },
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
                ),

                const SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Confirm your arrival time',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),

                const SizedBox(height: 8),

                // ====================== IMAGE + NOTES CARD ======================
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                    width: double.infinity,
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
                        const Text('10:05 AM',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),

                        Text(
                          "Address – ${widget.address}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 13),
                        ),

                        const SizedBox(height: 16),

                        const Text(
                          'Take a photo at customer location',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        const SizedBox(height: 8),

                        ElevatedButton.icon(
                          icon: const Icon(Icons.photo_camera),
                          label: const Text('Capture a photo to end the service'),
                          onPressed: pickImage,
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

                        if (completeImage != null) ...[
                          const SizedBox(height: 10),
                          Image.file(
                            completeImage!,
                            height: 90,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ],

                        const SizedBox(height: 12),

                        const Text(
                          'Add notes (optional)',
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                        const SizedBox(height: 10),

                        TextField(
                          controller: completeNotes,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            hintText: 'E.g, work completed, customer satisfied...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              const BorderSide(color: Color(0xFFDBDBDB), width: 0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 80), // space before button
              ],
            ),
          ),
        ),
      ),

      // ====================== BOTTOM BUTTON ======================
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SizedBox(
            height: 48,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: HexColor('#004271'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: punchOut,
              child: const Text(
                "Confirm Punch Out Now",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
