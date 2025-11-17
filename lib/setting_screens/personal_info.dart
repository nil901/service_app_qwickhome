// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:service_app_qwickhome/setting_screens/personal_info_edit.dart';
// import '../utils/custom_app_bar.dart';
//
// class PersonalInfoScreen extends StatefulWidget {
//   @override
//   State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
// }
//
// class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: HexColor('#FFFFFF'),
//       appBar: CustomAppBar(title: 'Personal Information'),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Info Protected Banner
//                   Container(
//                     height: 107,
//                    // width: double.infinity,
//                     padding: EdgeInsets.only(left: 20, right: 12, top: 8, bottom: 12),
//                     decoration: BoxDecoration(
//                       color: Color(0xFFE6F7FF),
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: HexColor('#004271')),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 4),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.center, // ✅ center align
//                           children: [
//                             Image.asset('assets/images/alert.png', height: 20, width: 18),
//                             SizedBox(width: 10),
//
//                             Padding(
//                               padding: const EdgeInsets.only(bottom: 5.0),
//                               child: Image.asset('assets/images/lock.png', height: 15, width: 12),
//                             ),
//                             SizedBox(width: 6),
//
//                             Text(
//                               "Information Protected",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.normal,
//                                 color: Colors.black87,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 14),
//                         Text(
//                        "For security reasons, personal information cannot be edited directly. To update your information, "
//                            "please request changes through our admin team.",
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.black87,
//                             height: 1.3,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   SizedBox(height: 16),
//
//                   /// ✅ Profile Photo Section
//                   _sectionCard(
//                     title: "Profile Photo",
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CircleAvatar(
//                           radius: 30,
//                           backgroundImage: AssetImage('assets/images/user_img.png'),
//                         ),
//                         SizedBox(height: 6),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(width: 12),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 8.0, bottom: 4, left: 10, right: 0),
//                               child: Text(
//                                 "Prathamesh Rathod ",
//                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//                               ),
//                             ),
//                             SizedBox(height: 4),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 0, bottom: 4, left: 10, right: 0),
//                               child: Text(
//                                 "Profile photo is managed by admin",
//                                 style: TextStyle(fontSize: 14, color: Colors.black54),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   SizedBox(height: 12),
//
//                   /// ✅ Basic Information
//                   _sectionCard(
//                     title: "Basic Information",
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             _infoRow("First Name", "Prathamesh"),
//                             SizedBox(width: 80),
//                             _infoRow("Last Name", "Rathod"),
//                           ],
//                         ),
//
//                         _infoRow("Email Address", "rathodprathamesh23@gmail.com"),
//                         _infoRow(
//                           "Bio",
//                           "Professional plumber with 5+ years of experience specializing in residential and commercial plumbing services.",
//                           isMultiLine: true,
//                         ),
//                        SizedBox(height: 8),
//                        Text('Brief description for your profile',
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.black54,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   SizedBox(height: 12),
//
//                   /// ✅ Contact Information
//                   _sectionCard(
//                     title: "Contact Information",
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         _infoRow("Phone Number", "9475964821"),
//                         _infoRow("Alternate Phone Number", "9658742569"),
//                       ],
//                     ),
//                   ),
//
//                   SizedBox(height: 12),
//                   /// ✅ Address
//                   _sectionCard(
//                     title: "Address",
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         _infoRow("Street Address", "135 main street"),
//                         Row(
//                           children: [
//                             _infoRow("City", "Nashik"),
//                             SizedBox(width: 80),
//                             _infoRow("State", "Maharashtra"),
//                           ],
//                         ),
//                         _infoRow("Pin code", "422002"),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             )
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
//                   // showDialog(
//                   //   context: context,
//                   //   barrierDismissible: true,
//                   //   builder: (context) => _requestChangeDialog(context),
//                   // );
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=> RequestChangesScreen()));
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
//
//     );
//   }
//
//   /// Reusable Section Card
//   Widget _sectionCard({required String title, required Widget child}) {
//     return Container(
//       //height: 115
//       width: double.infinity,
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Color(0xFFDADADA), width: 0.7),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 8.0, right: 4.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 Image.asset('assets/images/lock.png', height: 25, width: 20),
//               ],
//             ),
//           ),
//           SizedBox(height: 8),
//           child,
//         ],
//       ),
//     );
//   }
//
//   /// Reusable Info Row
//   Widget _infoRow(String label, String value, {bool isMultiLine = false}) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10,left: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.bold,
//               color: HexColor('#353535'),
//             ),
//           ),
//           SizedBox(height: 3),
//           Text(
//             value,
//             style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black54,),
//             maxLines: isMultiLine ? 3 : 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:service_app_qwickhome/prefs/app_preference.dart';
import 'package:service_app_qwickhome/setting_screens/personal_info_edit.dart';
import '../api_service/api_services.dart';
import '../api_service/urls.dart';
import '../prefs/preferece_keys.dart';
import '../utils/custom_app_bar.dart';

class PersonalInfoScreen extends StatefulWidget {
  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  bool isLoading = false;

  //API dynamic values
  String protectedText = "";
  String profileUrl = "";
  String name = "";
  String bio = "";
  String email = "";
  String phone = "";
  String? altPhone = "";
  String address = "";

  @override
  void initState() {
    super.initState();
    fetchPersonalInfo();
  }

  // 🔵 API CALL
  Future<void> fetchPersonalInfo() async {
    setState(() => isLoading = true);

    try {
      final response = await ApiService.postRequest(
        get_personal_info,
        {"serviceProviderId": AppPreference().getInt(PreferencesKey.userId)},
        // isFormData: true,
      );

      final list = response.data["data"];

      protectedText = list[0]["data"] ?? "";
      profileUrl = list[1]["data"] ?? "";
      name = list[2]["data"]["name"] ?? "";
      bio = list[2]["data"]["biography"] ?? "";
      email = list[2]["data"]["email"] ?? "";
      phone = list[3]["data"]["phone"] ?? "";
      altPhone = list[3]["data"]["alternatePhone"];
      address = list[4]["data"] ?? "";

      setState(() => isLoading = false);
    } catch (e) {
      debugPrint("API Error: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FFFFFF'),
      appBar: CustomAppBar(title: 'Personal Information'),

      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 🔵 Info Protected Banner
                          Container(
                            height: 107,
                            padding: EdgeInsets.only(
                              left: 20,
                              right: 12,
                              top: 8,
                              bottom: 12,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFE6F7FF),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: HexColor('#004271')),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/alert.png',
                                      height: 20,
                                      width: 18,
                                    ),
                                    SizedBox(width: 10),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 5.0,
                                      ),
                                      child: Image.asset(
                                        'assets/images/lock.png',
                                        height: 15,
                                        width: 12,
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      "Information Protected",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 14),
                                Text(
                                  protectedText,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black87,
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 16),

                          // 🔵 Profile Photo Section
                          _sectionCard(
                            title: "Profile Photo",
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage:  profileUrl.isNotEmpty? NetworkImage(profileUrl)
                                      : AssetImage('assets/images/user_img.png'),

                                ),
                                SizedBox(height: 6),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 12),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 8.0,
                                        bottom: 4,
                                        left: 10,
                                      ),
                                      child: Text(
                                        name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                        bottom: 4,
                                      ),
                                      child: Text(
                                        "Profile photo is managed by admin",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 12),

                          // 🔵 Basic Information
                          _sectionCard(
                            title: "Basic Information",
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _infoRow("Name", name),
                                _infoRow("Email Address", email),
                                _infoRow("Bio", bio, isMultiLine: true),
                                SizedBox(height: 8),
                                Text(
                                  'Brief description for your profile',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 12),

                          // 🔵 Contact Info
                          _sectionCard(
                            title: "Contact Information",
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _infoRow("Phone Number", phone),
                                _infoRow(
                                  "Alternate Phone Number",
                                  altPhone ?? "—",
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 12),

                          // 🔵 Address
                          _sectionCard(
                            title: "Address",
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [_infoRow("Address", address)],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // 🔵 Bottom Button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
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
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => EditProfileScreen(
                                    name: name,
                                    bio: bio,
                                    email: email,
                                    phone: phone,
                                    altPhone: altPhone,
                                    address: address,
                                    profileUrl: profileUrl,
                                  ),
                            ),
                          );
                        },
                        child: const Text(
                          "Request Changes",
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

  // 🔵 Section Card Widget
  Widget _sectionCard({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFDADADA), width: 0.7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Image.asset('assets/images/lock.png', height: 25, width: 20),
              ],
            ),
          ),
          SizedBox(height: 8),
          child,
        ],
      ),
    );
  }

  // 🔵 Info Row Widget
  Widget _infoRow(String label, String value, {bool isMultiLine = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: HexColor('#353535'),
            ),
          ),
          SizedBox(height: 3),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
            maxLines: isMultiLine ? 3 : 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
