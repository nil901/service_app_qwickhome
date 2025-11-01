import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../utils/custom_app_bar.dart';

class AvailabilityScreen extends StatelessWidget {
  final List<String> dates = [
    'Mon\n06',
    'Tue\n07',
    'Wed\n08',
    'Thu\n09',
    'Fri\n10',
    'Sat\n11',
  ];
  final int selectedDateIndex = 0; // first date selected

  final List<String> times = ['10:00 AM', '11:00 AM', '12:00 PM', '01:00 PM'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Here’s When You’re Available'),
      body: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Selector Row with "Oct"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    'Oct',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: SizedBox(
                      height: 55, // design height
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: dates.length,
                        separatorBuilder: (_, __) => SizedBox(width: 10),
                        itemBuilder: (context, i) {
                          final isSelected = i == selectedDateIndex;
                          return Container(
                            width: 46, // design width
                            height: 55, // design height
                            decoration: BoxDecoration(
                              color: isSelected ? Color(0xFF004271) : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                              left: i == 0 ? 0 : 4, // left spacing between items
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  dates[i].split('\n')[0], // day
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : Colors.black87,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  dates[i].split('\n')[1], // date
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : Colors.black54,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Time Slots Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Time Slots You've Set",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF222222),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Time Slots Buttons
            // Padding(
            //   padding: const EdgeInsets.only(left: 16.0),
            //   child: Wrap(
            //     spacing: 16,
            //     runSpacing: 16,
            //     children: times
            //         .map(
            //           (time) => Container(
            //         width: 120,
            //         child: ElevatedButton(
            //           onPressed: () {},
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor: Color(0xFFEEF6FB),
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(12),
            //               side: BorderSide(color: Color(0xFF2378D5)),
            //             ),
            //           ),
            //           child: Text(
            //             time,
            //             style: TextStyle(
            //               color: Color(0xFF2378D5),
            //               fontWeight: FontWeight.w600,
            //               fontSize: 16,
            //             ),
            //           ),
            //         ),
            //       ),
            //     )
            //         .toList(),
            //   ),
            // ),

            // Time Slots Buttons
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: times.map(
                      (time) => Container(
                    width: 108, // design width
                    height: 46, // design height
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: HexColor('#E4F9FF'), // background
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // rounded corners
                          side: BorderSide(
                            color: HexColor('#004271'), // border color
                            width: 1, // border width
                          ),
                        ),
                        elevation: 0, // flat design
                        padding: EdgeInsets.zero, // perfect sizing
                      ),
                      child: Text(
                        time,
                        style: TextStyle(
                          color: HexColor('#004271'), // text color
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ).toList(),
              ),
            ),


            Spacer(),

            // Done Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor('#004271'),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AvailabilityScreen (),
                      ),
                    );
                  },

                  child: Text(
                    "Done",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
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
