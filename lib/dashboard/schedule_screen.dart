import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../colors/colors.dart';
import '../utils/custom_app_bar.dart';
import 'manage_time.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final List<Map<String, dynamic>> days = [
    {"label": "Mon", "date": "06"},
    {"label": "Tue", "date": "07"},
    {"label": "Wed", "date": "08"},
    {"label": "Thu", "date": "09"},
    {"label": "Fri", "date": "10"},
    {"label": "Sat", "date": "11"},
  ];

  int selectedDayIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Schedule'),
      backgroundColor: kwhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ManageAvailabilityScreen()),
                );
              },
              child: Text(
                "Manage your availability",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: HexColor('#004271'),
                    fontSize: 16),
              ),
            ),
          ),
          SizedBox(height: 20),

          // Month label + background strip + day selector
          Container(
            height: 55,
            width: double.infinity,
            color: HexColor('#E4F9FF'),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: days.length + 1, // +1 for month label
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Oct",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  );
                } else {
                  int dayIndex = index - 1;
                  bool isSelected = selectedDayIndex == dayIndex;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDayIndex = dayIndex;
                      });
                    },
                    child: Container(
                      width: 55,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? HexColor('#004271')
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            days[dayIndex]["label"]!,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : Colors.grey[700],
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            days[dayIndex]["date"]!,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : Colors.grey[800],
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),

          SizedBox(height: 22),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "${days[selectedDayIndex]["label"]}, ${days[selectedDayIndex]["date"]} Oct 2025",
              style: TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87),
            ),
          ),
          SizedBox(height: 17),

          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                ScheduleCard(
                  img: "assets/images/user_img.png",
                  name: "Riya Sharma",
                  service: "Deep Wardrobe Assistance + Ironing",
                  time: "04 Oct 2025, 10:00 AM – 12:00 PM",
                  address: "3, Rosewood Villas, Nashik",
                  badge: "Upcoming",
                ),
                ScheduleCard(
                  img: "assets/images/user_img.png",
                  name: "Riya Sharma",
                  service: "Deep Wardrobe Assistance + Ironing",
                  time: "04 Oct 2025, 10:00 AM – 12:00 PM",
                  address: "3, Rosewood Villas, Nashik",
                  badge: "Upcoming",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//
// class ScheduleCard extends StatelessWidget {
//   final String img, name, service, time, address, badge;
//
//   const ScheduleCard({
//     required this.img,
//     required this.name,
//     required this.service,
//     required this.time,
//     required this.address,
//     required this.badge,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
//       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//         border: Border.all(color: HexColor('#e5e5e5'), width: 0.85),
//         boxShadow: [
//           BoxShadow(
//             blurRadius: 4,
//             color: Colors.black.withOpacity(0.04),
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CircleAvatar(
//                 radius: 20,
//                 backgroundImage: AssetImage(img),
//               ),
//               SizedBox(width: 12),
//               Expanded(
//                 child:
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(name,
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15.5,
//                             color: Colors.black)),
//                     SizedBox(height: 3),
//                     Text(
//                       "Service - $service",
//                       style: TextStyle(
//                         fontSize: 13.5,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black87,
//                       ),
//                     ),
//                     SizedBox(height: 4),
//                     // Date & Time without icon
//                     Text(
//                       "Date & Time – $time",
//                       style: TextStyle(fontSize: 13, color: Colors.black54),
//                     ),
//                     SizedBox(height: 4),
//                     // Address without icon
//                     Text(
//                       "Address – $address",
//                       style: TextStyle(fontSize: 13, color: Colors.black54),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ],
//                 ),
//
//               ),
//             ],
//           ),
//           SizedBox(height: 8),
//           Divider(color: Colors.grey[300], thickness: 1),
//           SizedBox(height: 6),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               GestureDetector(
//                 onTap: () {},
//                 child: Text(
//                   "View Details about the Service",
//                   style: TextStyle(
//                     color: HexColor('#004271'),
//                     fontWeight: FontWeight.w600,
//                     fontSize: 13,
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 107,
//                 height: 30,
//                 decoration: BoxDecoration(
//                   color: HexColor('#E4F9FF'),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 alignment: Alignment.center,
//                 child: Text(
//                   badge,
//                   style: TextStyle(
//                     color: HexColor('#098bd9'),
//                     fontWeight: FontWeight.bold,
//                     fontSize: 13.5,
//                   ),
//                 ),
//               ),
//
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
class ScheduleCard extends StatelessWidget {
  final String img, name, service, time, address, badge;

  const ScheduleCard({
    required this.img,
    required this.name,
    required this.service,
    required this.time,
    required this.address,
    required this.badge,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: HexColor('#e5e5e5'), width: 0.85),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.black.withOpacity(0.04),
            offset: Offset(0, 2),
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
                backgroundImage: AssetImage(img),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.5,
                          color: Colors.black),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Service - $service",
                      style: TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Date & Time – $time",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Address – $address",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Divider(color: Colors.grey[300], thickness: 1),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
              Container(
                width: 107,
                height: 30,
                decoration: BoxDecoration(
                  color: HexColor('#E4F9FF'),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  badge,
                  style: TextStyle(
                    color: HexColor('#098bd9'),
                    fontWeight: FontWeight.bold,
                    fontSize: 13.5,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
