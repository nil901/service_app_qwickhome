import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../utils/custom_app_bar.dart';
import 'availbale_time.dart';

class ManageAvailabilityScreen extends StatefulWidget {
  @override
  State<ManageAvailabilityScreen> createState() =>
      _ManageAvailabilityScreenState();
}

class _ManageAvailabilityScreenState extends State<ManageAvailabilityScreen> {
  // Days with dates
  final List<Map<String, String>> days = [
    {"label": "Mon", "date": "06"},
    {"label": "Tue", "date": "07"},
    {"label": "Wed", "date": "08"},
    {"label": "Thu", "date": "09"},
    {"label": "Fri", "date": "10"},
    {"label": "Sat", "date": "11"},
  ];

  int selectedDayIndex = 0;

  List<String> timeSlots = [
    "10:00 AM",
    "11:00 AM",
    "12:00 PM",
    "01:00 PM",
    "02:00 PM",
    "03:00 PM",
    "04:00 PM",
    "05:00 PM",
  ];

  List<int> selectedTimeIndexes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Manage your Availability'),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Choose the days & time slots you're available for bookings. Update anytime to manage your schedule.",
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 21),
          Container(
            height: 55,
            width: double.infinity,
            color: HexColor('#E4F9FF'),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: days.length + 1,
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
                        borderRadius: BorderRadius.circular(0),
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

          const SizedBox(height: 45),

          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Choose a time slot',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          SizedBox(height: 17),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Wrap(
              spacing: 22,
              runSpacing: 16,
              children: List.generate(timeSlots.length, (index) {
                bool isSelected = selectedTimeIndexes.contains(index);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedTimeIndexes.remove(index);
                      } else {
                        selectedTimeIndexes.add(index);
                      }
                    });
                  },
                  child: Container(
                    width: 108,
                    height: 46,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? HexColor('#E4F9FF')
                          : Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: HexColor('#004271'), width: 1),
                    ),
                    child: Text(
                      timeSlots[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:
                        isSelected ? Colors.black : HexColor('#004271'),
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          const Spacer(),

          // Done button
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AvailabilityScreen()),
                  );
                },
                child: const Text(
                  "Done",
                  style: TextStyle(
                    fontSize: 18,
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
}
