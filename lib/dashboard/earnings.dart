import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../colors/colors.dart';
import '../utils/custom_app_bar.dart';
import '../utils/size.dart';

class Earning_Screen extends StatefulWidget {
  @override
  State<Earning_Screen> createState() => _Earning_ScreenState();
}

class _Earning_ScreenState extends State<Earning_Screen> {
  final double currentEarning = 9000;

  final double todayEarning = 1000;

  final double weekEarning = 9000;

  final List<Map<String, String>> history = [
    {"date": "29 Sept", "service": "Laundry Pickup", "amount": "AED 500", "status": "Received"},
    {"date": "28 Sept", "service": "Pest Control", "amount": "AED 499", "status": "Received"},
    {"date": "28 Sept", "service": "Disinfection Services", "amount": "AED 799", "status": "Received"},
    {"date": "28 Sept", "service": "Kitchen Cleaning", "amount": "AED 499", "status": "Received"},
    {"date": "28 Sept", "service": "Laundry Pickup", "amount": "AED 499", "status": "Received"},
    {"date": "28 Sept", "service": "Laundry Pickup", "amount": "AED 500", "status": "Received"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Earnings'),
      backgroundColor: kwhite,
      body: Column(
        children: [
          SizedBox(height: 24),
          Text(
            "Current Earnings",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black87,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "AED ${currentEarning.toInt()}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: HexColor('#004271'),
            ),
          ),
          SizedBox(height: 23),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 44),
            child: SizedBox(
              width : 300,
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: HexColor('#004271'),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 0,
                ),
                onPressed: () {},
                child: Text(
                  "Withdraw Now",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "AED ${todayEarning.toInt()}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: HexColor('#004271')),
                  ),
                  Text("Today's Earning", style: TextStyle(fontSize: 13, color: Colors.grey[700])),
                ],
              ),
              SizedBox(width: 45),
              Column(
                children: [
                  Text(
                    "AED ${weekEarning.toInt()}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: HexColor('#004271')),
                  ),
                  Text("This Week's", style: TextStyle(fontSize: 13, color: Colors.grey[700])),
                ],
              ),
            ],
          ),
          h30,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            child: Row(
              children: [
                Text(
                  "History",
                  style: TextStyle(
                    color: HexColor('#FF1818'),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          h20,
          // Table Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(child: Text("Date", style: TextStyle(color: HexColor('#737373'), fontWeight: FontWeight.w500, fontSize: 14))),
                w30,
                Expanded(child: Text("Service", style: TextStyle(color:  HexColor('#737373'), fontWeight: FontWeight.w500, fontSize: 14))),
                w30,
                Expanded(child: Text("Amount", style: TextStyle(color:  HexColor('#737373'), fontWeight: FontWeight.w500, fontSize: 14))),
                w30,
                Expanded(child: Text("Status", style: TextStyle(color: HexColor('#737373'), fontWeight: FontWeight.w500, fontSize: 14))),
              ],
            ),
          ),
          Divider(
            color: HexColor('#e5e5e5'), // line ka color
            thickness: 0.25,            // line ki motai (border-width jaisa)
            indent: 20,                 // left se kitna gap (left: 20px)
            endIndent: 20,              // right se kitna gap (right alignment ke liye)
          ),
          Expanded(
            child: ListView.builder(
              itemCount: history.length,
              padding: EdgeInsets.symmetric(horizontal: 15),
              itemBuilder: (context, index) {
                final entry = history[index];
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: HexColor('#e5e5e5'), width: 0.6),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Text(entry['date']!, style: TextStyle(fontSize: 14))),
                     SizedBox(height: 45, width: 30,),
                      Expanded(child: Text(entry['service']!, style: TextStyle(fontSize: 14))),
                      w30,
                      Expanded(child: Text(entry['amount']!, style: TextStyle(fontSize: 14))),
                      w30,
                      Expanded(child: Text(
                        entry['status']!,
                        style: TextStyle(fontSize: 13, color: HexColor('#15B700'), fontWeight: FontWeight.w600),
                      )),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
