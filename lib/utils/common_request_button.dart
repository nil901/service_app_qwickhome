import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget requestChangeDialog(BuildContext context) {
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
          padding: EdgeInsets.all(18),
          width: 330,
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
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: HexColor('#004271'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("Send Request", style: TextStyle(color: HexColor('#FFFFFF'))),
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