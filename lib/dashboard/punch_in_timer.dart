import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:service_app_qwickhome/dashboard/punch_out_screen.dart';

import '../colors/colors.dart';
import '../utils/custom_app_bar.dart';
import '../utils/size.dart';

class TimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Timer'),
      backgroundColor: kwhite,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
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
                          child: Image.asset('assets/images/user_img.png'),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Riya Sharma",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.5,
                                    color: Colors.black),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                "Service - Deep Wardrobe Assistance + Ironing",
                                style: const TextStyle(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Date & Time – 04 Oct 2025, 10:00 AM - 12:00 PM",
                                style: const TextStyle(fontSize: 13, color: Colors.black),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Address – 8, Rosewood Villas, Nashik",
                                style: const TextStyle(fontSize: 13, color: Colors.black),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
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


            SizedBox(height: 30),

            // ✅ Timer Text
            Text(
              "01:15:42",
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 6),
            Text("Timer started at 10:05 AM", style: TextStyle(color: Colors.black54)),
            Text("Timer will continue until you punch out", style: TextStyle(color: Colors.black54, fontSize: 12)),

            SizedBox(height: 30),

            // ✅ Mid-Service Photo Card
            Container(
              width: 375,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xFFFCFCFC),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Color(0xFFDBDBDB), width: 0.5),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.05),
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Mid - Service photo", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),

                  SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: (){},
                    icon: Icon(Icons.camera_alt, size: 18),
                    label: Text("Add Mid - Service Photo"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      elevation: 1,
                      minimumSize: Size(double.infinity, 40),
                      alignment: Alignment.centerLeft,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Color(0xFFDCDCDC), width: 0.8),
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  Text("Elapsed Time : 1 hr 15 mins", style: TextStyle(fontSize: 13)),
                  Text("Estimated Time Left : 45 mins", style: TextStyle(fontSize: 13)),
                ],
              ),
            ),

            SizedBox(height: 230),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> PunchOutScreen()));
                  },
                  child: const Text(
                    "Punch Out Now",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
