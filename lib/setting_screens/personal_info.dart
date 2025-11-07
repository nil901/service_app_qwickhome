import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PersonalInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FFFFFF'),
      appBar: AppBar(
        backgroundColor: Color(0xFFE6F7FF),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Personal Information",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🔴 Info Protected Banner
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFFFFF3F3),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xFFFFD1D1)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline, color: Colors.red),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Information Protected\n"
                          "For security reasons, personal information cannot be edited directly. "
                          "To update your information, please request changes through our admin team.",
                      style: TextStyle(fontSize: 12, color: Colors.black87, height: 1.3),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            /// ✅ Profile Photo Section
            _sectionCard(
              title: "Profile Photo",
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage("https://randomuser.me/api/portraits/women/47.jpg"),
                  ),
                  SizedBox(height: 6),
                  Text("Samiksha Raka",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),

                  Text("Profile photo is managed by admin",
                      style: TextStyle(fontSize: 12, color: Colors.black54)),
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
                  _infoRow("First Name", "Samiksha"),
                  _infoRow("Last Name", "Raka"),
                  _infoRow("Email Address", "samiksha@123"),
                  _infoRow("Bio",
                      "Professional plumber with 5+ years of experience specializing in residential and commercial plumbing services.",
                      isMultiLine: true),
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
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
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
              Text(title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              Icon(Icons.lock_outline, size: 18, color: Colors.grey),
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
          Text(label,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black54)),
          SizedBox(height: 3),
          Text(
            value,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
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
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.close, size: 20),
                    )
                  ],
                ),

                SizedBox(height: 8),

                Text(
                  "Describe the changes you need to your personal information. Our admin team will review and process your request within 24-48 hours.",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),

                SizedBox(height: 15),

                Text("What would you like to change?",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),

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
                        child: Text("Cancel",
                            style: TextStyle(color: Color(0xFF004271))),
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
