import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../colors/colors.dart';
import '../utils/custom_app_bar.dart';
import '../utils/size.dart';

class PunchOutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Punch Out'),
      backgroundColor: kwhite,
      body: Padding(
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
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text('Confirm your arrival time', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                width: double.infinity,
                height: 290,
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Color(0xFFFCFCFC), // background
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xFFDBDBDB), width: 0.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '10:05 AM',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),

                    Text(
                      'Address: B, Rosewood Villas, Nashik',
                      style: TextStyle(fontSize: 13, color: Colors.black54),
                    ),

                    SizedBox(height: 16),

                    Text(
                      'Take a photo at customer location',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),

                    SizedBox(height: 8),

                    ElevatedButton.icon(
                      icon: Icon(Icons.photo_camera),
                      label: Text('Capture a photo to start the service'),
                      onPressed: () {
                        // TODO: Add photo logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        elevation: 2,
                        minimumSize: Size(double.infinity, 44),
                        alignment: Alignment.centerLeft,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.black12),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    Text('Add notes (optional)',
                        style: TextStyle(fontSize: 14, color: Colors.black54)),
                    SizedBox(height: 12),
                    SizedBox(
                      width: 350,
                      height: 38,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          hintText: 'E.g, reached location, started setup....',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),  // 10px radius
                            borderSide: BorderSide(
                              color: Color(0xFFDBDBDB), // Light border
                              width: 0.5, // 0.5px border
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xFFDBDBDB),
                              width: 0.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xFF004271), // Focus color
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            Spacer(),
            // Punch in button
            SizedBox(
              width: double.infinity,
              child:
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
                     // Navigator.push(context, MaterialPageRoute(builder: (context)=> TimerScreen()));
                    },
                    child: const Text(
                      "Punch In Out",
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
          ],
        ),
      ),
    );
  }
}
