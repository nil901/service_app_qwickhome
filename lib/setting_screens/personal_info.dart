import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../utils/custom_app_bar.dart';

class PersonalInfoScreen extends StatefulWidget {
  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FFFFFF'),
      appBar: CustomAppBar(title: 'Personal Information'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔴 Info Protected Banner
            Container(
              height: 107,
             // width: double.infinity,
              padding: EdgeInsets.only(left: 20, right: 12, top: 8, bottom: 12),
              decoration: BoxDecoration(
                color: Color(0xFFE6F7FF),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xFFFFD1D1)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center, // ✅ center align
                    children: [
                      Image.asset('assets/images/alert.png', height: 20, width: 18),
                      SizedBox(width: 10),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Image.asset('assets/images/lock.png', height: 15, width: 12),
                      ),
                      SizedBox(width: 6),

                      Text(
                        "Information Protected",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14),
                  Text(
                 "For security reasons, personal information cannot be edited directly. To update your information, "
                     "please request changes through our admin team.",
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

            /// ✅ Profile Photo Section
            _sectionCard(
              title: "Profile Photo",
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/user_img.png'),
                  ),
                  SizedBox(height: 6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 12),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 4, left: 10, right: 0),
                        child: Text(
                          "Prathamesh Rathod ",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 4, left: 10, right: 0),
                        child: Text(
                          "Profile photo is managed by admin",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 12),

            /// ✅ Basic Information
            _sectionCard(
              title: "Basic Information",
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _infoRow("First Name", "Prathamesh"),
                      SizedBox(width: 80),
                      _infoRow("Last Name", "Rathod"),
                    ],
                  ),

                  _infoRow("Email Address", "rathodprathamesh23@gmail.com"),
                  _infoRow(
                    "Bio",
                    "Professional plumber with 5+ years of experience specializing in residential and commercial plumbing services.",
                    isMultiLine: true,
                  ),
                 SizedBox(height: 8),
                 Text('Brief description for your profile'),
                ],
              ),
            ),

            SizedBox(height: 12),

            /// ✅ Contact Information
            _sectionCard(
              title: "Contact Information",
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoRow("Phone Number", "9475964821"),
                  _infoRow("Alternate Phone Number", "9658742569"),
                ],
              ),
            ),

            SizedBox(height: 12),

            /// ✅ Address
            _sectionCard(
              title: "Address",
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoRow("Street Address", "135 main street"),
                  _infoRow("City", "Nashik"),
                  _infoRow("State", "Maharashtra"),
                  _infoRow("Pin code", "422002"),
                ],
              ),
            ),
            SizedBox(height: 20),

            /// ✅ Request Changes Button
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
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) => _requestChangeDialog(context),
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

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  /// Reusable Section Card
  Widget _sectionCard({required String title, required Widget child}) {
    return Container(
      //height: 115
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Image.asset('assets/images/lock.png', height: 25, width: 20),
            ],
          ),
          SizedBox(height: 8),
          child,
        ],
      ),
    );
  }

  /// Reusable Info Row
  Widget _infoRow(String label, String value, {bool isMultiLine = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 3),
          Text(
            value,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black54,),
            maxLines: isMultiLine ? 3 : 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _requestChangeDialog(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4), // ✅ Blur Background
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(18),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Request Information Change",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.close, size: 20),
                    ),
                  ],
                ),

                SizedBox(height: 8),

                Text(
                  "Describe the changes you need to your personal information. Our admin team will review and process your request within 24-48 hours.",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),

                SizedBox(height: 15),

                Text(
                  "What would you like to change?",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),

                SizedBox(height: 8),

                /// Textfield
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText:
                        "Please specify which information you’d like to update and provide the new details",
                    hintStyle: TextStyle(fontSize: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                SizedBox(height: 8),

                /// Tip Box
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFFE9F6FF),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFFB8D8F6)),
                  ),
                  child: Text(
                    "Tip :\nInclude specific details about what needs to be changed. For example: “Please update my phone number to 8569745823”",
                    style: TextStyle(fontSize: 11, color: Colors.black87),
                  ),
                ),

                SizedBox(height: 16),

                Row(
                  children: [
                    /// Cancel
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Color(0xFF004271)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Color(0xFF004271)),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),

                    /// Send Request
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // TODO: send request to backend
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF004271),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text("Send Request"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
