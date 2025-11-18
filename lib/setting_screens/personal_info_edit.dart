// import 'dart:io';
// import 'dart:ui';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:image_picker/image_picker.dart';
// import '../api_service/api_services.dart';
// import '../api_service/urls.dart';
// import '../models/edit_profile_model.dart';
// import '../prefs/app_preference.dart';
// import '../prefs/preferece_keys.dart';
// import '../utils/common_request_button.dart';
// import '../utils/custom_app_bar.dart';
// class EditProfileScreen extends StatefulWidget {
//   final String name;
//   final String bio;
//   final String email;
//   final String phone;
//   final String? altPhone;
//   final String address;
//   final String profileUrl;
//
//   const EditProfileScreen({
//     super.key,
//     required this.name,
//     required this.bio,
//     required this.email,
//     required this.phone,
//     required this.altPhone,
//     required this.address,
//     required this.profileUrl,
//   });
//
//   @override
//   State<EditProfileScreen> createState() => _EditProfileScreenState();
// }
//
//
// class _EditProfileScreenState extends State<EditProfileScreen> {
//   late TextEditingController firstName;
//   late TextEditingController lastName;
//   late TextEditingController email;
//   late TextEditingController bio;
//   late TextEditingController phone1;
//   late TextEditingController phone2;
//   late TextEditingController address1;
//
//   Map<String, bool> edited = {};
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Split full name
//     final nameParts = widget.name.split(" ");
//     String fName = nameParts.isNotEmpty ? nameParts.first : "";
//     String lName = nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "";
//
//     firstName = TextEditingController(text: fName);
//     lastName = TextEditingController(text: lName);
//     email = TextEditingController(text: widget.email);
//     bio = TextEditingController(text: widget.bio);
//     phone1 = TextEditingController(text: widget.phone);
//     phone2 = TextEditingController(text: widget.altPhone ?? "");
//     address1 = TextEditingController(text: widget.address);
//   }
//
//
//   void markEdited(String key) {
//     setState(() {
//       edited[key] = true;
//     });
//   }
//
//
//   // File? selectedImage;
//   //
//   // Future pickImage() async {
//   //   final img = await ImagePicker().pickImage(source: ImageSource.gallery);
//   //   if (img != null) {
//   //     setState(() {
//   //       selectedImage = File(img.path);
//   //     });
//   //   }
//   // }
//   //
//   //
//   // Future<void> submitProfileChange() async {
//   //   try {
//   //     final userId = AppPreference().getInt(PreferencesKey.userId);
//   //
//   //     final requestModel = ProfileChangeRequestModel(
//   //       serviceProviderId: userId.toString(),
//   //       reason: "kuchh nahi aise hi chnage karna hai",
//   //       name: "${firstName.text} ${lastName.text}",
//   //       email: email.text,
//   //       phone: phone1.text,
//   //       alternatePhone: phone2.text,
//   //       biography: bio.text,
//   //       address:
//   //       "${address1.text}, ${address2.text}, ${address3.text}, ${address4.text}",
//   //       profileImage: selectedImage,
//   //     );
//   //
//   //     // 🔵 Convert model → FormData
//   //     FormData formData = await requestModel.toFormData();
//   //
//   //     // 🔵 API Hit
//   //     final response = await ApiService.postMultipart(
//   //       "http://admin.qwikhom.ae/api/requestProfileChange",
//   //       formData,
//   //     );
//   //
//   //     final parsed = ProfileChangeResponse.fromJson(response.data);
//   //
//   //     // UI Messages
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(
//   //         content: Text(parsed.message),
//   //         backgroundColor: parsed.success ? Colors.green : Colors.orange,
//   //       ),
//   //     );
//   //
//   //   } catch (e) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(
//   //         content: Text("Error: $e"),
//   //         backgroundColor: Colors.red,
//   //       ),
//   //     );
//   //   }
//   // }
//
//
//   Widget buildField(String label, TextEditingController controller, String key) {
//     return Stack(
//       children: [
//         SizedBox(
//           height: 40,       // match design
//           child: TextField(
//             controller: controller,
//             onChanged: (_) => markEdited(key),
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//
//               // Background color
//               filled: true,
//               fillColor: Colors.grey.shade300,
//
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: BorderSide(
//                   color: HexColor('#C2C2C2'),
//                   width: 0.5,
//                 ),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: BorderSide(
//                   color: HexColor('#004271'),
//                   width: 0.5,
//                 ),
//               ),
//             ),
//             style: const TextStyle(fontSize: 14),
//           ),
//         ),
//         if (edited[key] == true)
//           Positioned(
//             right: 12,
//             top: 10,
//             child: Text(
//               "(Edited)",
//               style: TextStyle(
//                 color: Colors.grey.shade600,
//                 fontSize: 12,
//               ),
//             ),
//           ),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: CustomAppBar(title: 'Request Changes'),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container
//                     (
//                     height: 115,
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: HexColor('#C2C2C2'), width: 0.7),
//                       boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
//                     ),
//                     child: Row(
//                       children: [
//                         CircleAvatar(radius: 28, child: Icon(Icons.person, size: 32)),
//                         SizedBox(width: 12),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 15),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text( "${firstName.text} ${lastName.text}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
//                               SizedBox(height: 8),
//                               Text("Profile photo is managed by admin", style: TextStyle(fontSize: 12, color: Colors.grey)),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//
//                   SizedBox(height: 22),
//                   Container(
//                     height: 310,
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: HexColor('#C2C2C2'), width: 0.7),
//                       boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Basic Information", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                         SizedBox(height: 12,),
//                         buildField("First Name", firstName, "firstName"),
//                         SizedBox(height: 20),
//                         buildField("Last Name", lastName, "lastName"),
//                         SizedBox(height: 20),
//                         buildField("Email", email, "email"),
//                         SizedBox(height: 20),
//                         buildField("Bio", bio, "bio"),
//                       ],
//                     ),
//                   ),
//
//                   SizedBox(height: 24),
//
//                   Container(
//                     height: 175,
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: HexColor('#C2C2C2'), width: 0.7),
//                       boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Contact Information", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                         SizedBox(height: 20,),
//                         buildField("Phone 1", phone1, "phone1"),
//                         SizedBox(height: 20),
//                         buildField("Phone 2", phone2, "phone2"),
//                       ],
//                     ),
//                   ),
//
//                   SizedBox(height: 27),
//
//                   Container(
//                     height: 140,
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: HexColor('#C2C2C2'), width: 0.7),
//                       boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Address", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                         SizedBox(height: 20,),
//                         buildField("Address Line 1", address1, "add1"),
//                         SizedBox(height: 20),
//                         // buildField("City", address2, "add2"),
//                         // SizedBox(height: 20),
//                         // buildField("State", address3, "add3"),
//                         // SizedBox(height: 20),
//                         // buildField("Pincode", address4, "add4"),
//                       ],
//                     ),
//                   ),
//
//                   SizedBox(height: 20),
//                   Container(
//                     height: 94,
//                     // width: double.infinity,
//                     padding: EdgeInsets.only(left: 20, right: 12, top: 8, bottom: 12),
//                     decoration: BoxDecoration(
//                       color: Color(0xFFE6F7FF),
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: HexColor('#004271')),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         RichText(
//                           text: TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: "Note: ",
//                                 style: TextStyle(
//                                   color: HexColor('#C10000'),
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w600, // Bold/Medium
//                                 ),
//                               ),
//                               TextSpan(
//                                 text:
//                                 "Profile details cannot be edited directly. Any requested changes will be sent to the admin for review. Updates will be made only after approval; unapproved requests will not be reflected in your profile.",
//                                 style: TextStyle(
//                                   color: HexColor('#C10000'),
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400, // Normal
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
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
//                 onPressed: () {
//                   showDialog(
//                     context: context,
//                     barrierDismissible: true,
//                     builder: (context) => requestChangeDialog(context),
//                   );
//                 },
//
//                 child: const Text(
//                   "Request Changes",
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


import 'dart:io';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import '../api_service/api_services.dart';
import '../api_service/urls.dart';
import '../prefs/app_preference.dart';
import '../prefs/preferece_keys.dart';
import '../utils/custom_app_bar.dart';

class EditProfileScreen extends StatefulWidget {
  final String name;
  final String bio;
  final String email;
  final String phone;
  final String? altPhone;
  final String address;
  final String profileUrl;

  const EditProfileScreen({
    super.key,
    required this.name,
    required this.bio,
    required this.email,
    required this.phone,
    required this.altPhone,
    required this.address,
    required this.profileUrl,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  File? selectedImageFile;
  TextEditingController reasonController = TextEditingController();

  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController bio;
  late TextEditingController phone1;
  late TextEditingController phone2;
  late TextEditingController address1;

  Map<String, bool> edited = {};

  @override
  void initState() {
    super.initState();

    final nameParts = widget.name.split(" ");
    String fName = nameParts.isNotEmpty ? nameParts.first : "";
    String lName = nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "";

    firstName = TextEditingController(text: fName);
    lastName = TextEditingController(text: lName);
    email = TextEditingController(text: widget.email);
    bio = TextEditingController(text: widget.bio);
    phone1 = TextEditingController(text: widget.phone);
    phone2 = TextEditingController(text: widget.altPhone ?? "");
    address1 = TextEditingController(text: widget.address);
  }

  void markEdited(String key) {
    setState(() {
      edited[key] = true;
    });
  }

  Widget buildField(String label, TextEditingController controller, String key) {
    return Stack(
      children: [
        SizedBox(
          height: 40,
          child: TextField(
            controller: controller,
            onChanged: (_) => markEdited(key),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              filled: true,
              fillColor: Colors.grey.shade300,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: HexColor('#C2C2C2'), width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: HexColor('#004271'), width: 0.8),
              ),
            ),
            style: const TextStyle(fontSize: 14),
          ),
        ),

        if (edited[key] == true)
          Positioned(
            right: 12,
            top: 10,
            child: Text(
              "(Edited)",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            ),
          ),
      ],
    );
  }

  // 🔵 PICK IMAGE
  Future pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() => selectedImageFile = File(picked.path));
    }
  }

  // 🔵 SUBMIT REQUEST API
  Future<void> sendProfileChangeRequest() async {
    try {
      String fullName = "${firstName.text} ${lastName.text}".trim();

      FormData formData = FormData.fromMap({
        "serviceProviderId":
        AppPreference().getInt(PreferencesKey.userId).toString(),
        "reason": reasonController.text.trim(),
        "name": fullName,
        "email": email.text,
        "phone": phone1.text,
        "alternatePhone": phone2.text,
        "biography": bio.text,
        "address": address1.text,
      });

      if (selectedImageFile != null) {
        formData.files.add(
          MapEntry(
            "profileImage",
            await MultipartFile.fromFile(
              selectedImageFile!.path,
              filename: selectedImageFile!.path.split("/").last,
            ),
          ),
        );
      }

      final response =  await ApiService.requestProfileChangeAPI(formData);

      print("=== SUCCESS RESPONSE ===");
      print(response.data);

      if (response.data["success"] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.data["message"]),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.data["message"]),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print("=== ERROR ===");
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(

          content: Text("Error: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // 🔵 REQUEST DIALOG
  Widget requestChangeDialog() {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(18),
            width: 330,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Request Information Change",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                TextField(
                  controller: reasonController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: "Write the reason for change…",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          sendProfileChangeRequest();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: HexColor('#004271')),
                        child: const Text("Send Request",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Request Changes'),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [

                  // 🔵 PROFILE CARD
                  Container(
                    height: 120,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: HexColor('#C2C2C2')),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: pickImage,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: selectedImageFile != null
                                ? FileImage(selectedImageFile!)
                                : NetworkImage(widget.profileUrl)
                            as ImageProvider,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "${firstName.text} ${lastName.text}",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  // BASIC INFO
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: HexColor('#C2C2C2')),
                    ),
                    child: Column(
                      children: [
                        buildField("First Name", firstName, "firstName"),
                        const SizedBox(height: 18),
                        buildField("Last Name", lastName, "lastName"),
                        const SizedBox(height: 18),
                        buildField("Email", email, "email"),
                        const SizedBox(height: 18),
                        buildField("Bio", bio, "bio"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  // CONTACT INFO
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: HexColor('#C2C2C2')),
                    ),
                    child: Column(
                      children: [
                        buildField("Phone", phone1, "phone1"),
                        const SizedBox(height: 18),
                        buildField("Alternate Phone", phone2, "phone2"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  // ADDRESS
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: HexColor('#C2C2C2')),
                    ),
                    child: Column(
                      children: [
                        buildField("Address", address1, "address"),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => requestChangeDialog(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: HexColor('#004271'),
                ),
                child: const Text("Request Changes",
                    style: TextStyle(color: Colors.white, fontSize: 14)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
