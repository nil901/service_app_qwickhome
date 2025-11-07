// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
// import '../utils/custom_app_bar.dart';
// import 'availbale_time.dart';
//
// class ManageAvailabilityScreen extends StatefulWidget {
//   @override
//   State<ManageAvailabilityScreen> createState() =>
//       _ManageAvailabilityScreenState();
// }
//
// class _ManageAvailabilityScreenState extends State<ManageAvailabilityScreen> {
//   // Days with dates
//   final List<Map<String, String>> days = [
//     {"label": "Mon", "date": "06"},
//     {"label": "Tue", "date": "07"},
//     {"label": "Wed", "date": "08"},
//     {"label": "Thu", "date": "09"},
//     {"label": "Fri", "date": "10"},
//     {"label": "Sat", "date": "11"},
//   ];
//
//   int selectedDayIndex = 0;
//
//   List<String> timeSlots = [
//     "10:00 AM",
//     "11:00 AM",
//     "12:00 PM",
//     "01:00 PM",
//     "02:00 PM",
//     "03:00 PM",
//     "04:00 PM",
//     "05:00 PM",
//   ];
//
//   List<int> selectedTimeIndexes = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: CustomAppBar(title: 'Manage your Availability'),
//       body: Column(
//         children: [
//           const SizedBox(height: 20),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Text(
//               "Choose the days & time slots you're available for bookings. Update anytime to manage your schedule.",
//               style: TextStyle(fontSize: 14, color: Colors.grey[700]),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           const SizedBox(height: 21),
//           Container(
//             height: 55,
//             width: double.infinity,
//             color: HexColor('#E4F9FF'),
//             child: ListView.separated(
//               scrollDirection: Axis.horizontal,
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               itemCount: days.length + 1,
//               separatorBuilder: (_, __) => const SizedBox(width: 10),
//               itemBuilder: (context, index) {
//                 if (index == 0) {
//                   return Center(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       child: Text(
//                         "Oct",
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                           fontSize: 15,
//                         ),
//                       ),
//                     ),
//                   );
//                 } else {
//                   int dayIndex = index - 1;
//                   bool isSelected = selectedDayIndex == dayIndex;
//
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedDayIndex = dayIndex;
//                       });
//                     },
//                     child: Container(
//                       width: 55,
//                       decoration: BoxDecoration(
//                         color: isSelected
//                             ? HexColor('#004271')
//                             : Colors.transparent,
//                         borderRadius: BorderRadius.circular(0),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             days[dayIndex]["label"]!,
//                             style: TextStyle(
//                               color: isSelected
//                                   ? Colors.white
//                                   : Colors.grey[700],
//                               fontWeight: FontWeight.w600,
//                               fontSize: 15,
//                             ),
//                           ),
//                           const SizedBox(height: 2),
//                           Text(
//                             days[dayIndex]["date"]!,
//                             style: TextStyle(
//                               color: isSelected
//                                   ? Colors.white
//                                   : Colors.grey[800],
//                               fontWeight: FontWeight.bold,
//                               fontSize: 15,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ),
//
//           const SizedBox(height: 45),
//
//           Padding(
//             padding: const EdgeInsets.only(left: 30, bottom: 10),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'Choose a time slot',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black87,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 17),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 6),
//             child: Wrap(
//               spacing: 22,
//               runSpacing: 16,
//               children: List.generate(timeSlots.length, (index) {
//                 bool isSelected = selectedTimeIndexes.contains(index);
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       if (isSelected) {
//                         selectedTimeIndexes.remove(index);
//                       } else {
//                         selectedTimeIndexes.add(index);
//                       }
//                     });
//                   },
//                   child: Container(
//                     width: 108,
//                     height: 46,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       color: isSelected
//                           ? HexColor('#E4F9FF')
//                           : Colors.white,
//                       borderRadius: BorderRadius.circular(15),
//                       border: Border.all(color: HexColor('#004271'), width: 1),
//                     ),
//                     child: Text(
//                       timeSlots[index],
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color:
//                         isSelected ? Colors.black : HexColor('#004271'),
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 );
//               }),
//             ),
//           ),
//
//           const Spacer(),
//
//           // Done button
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
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => AvailabilityScreen()),
//                   );
//                 },
//                 child: const Text(
//                   "Done",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../utils/custom_app_bar.dart';
import 'availbale_time.dart';
import '../api_service/api_services.dart';
import '../api_service/urls.dart';
import '../prefs/app_preference.dart';
import '../prefs/preferece_keys.dart';

class ManageAvailabilityScreen extends StatefulWidget {
  @override
  State<ManageAvailabilityScreen> createState() =>
      _ManageAvailabilityScreenState();
}

class _ManageAvailabilityScreenState extends State<ManageAvailabilityScreen> {
  bool isLoading = false;
  String datesTitle = "";
  String timesTitle = "";

  List<dynamic> dates = [];
  List<dynamic> times = [];

  int selectedDayIndex = 0;
  List<int> selectedTimeIndexes = [];

  @override
  void initState() {
    super.initState();
    fetchAvailabilityOptions();
  }

  Future<void> fetchAvailabilityOptions() async {
    setState(() => isLoading = true);
    try {
      final response = await ApiService.postRequest(
        geTimeandDateOptions,
        {
          "serviceProvider": AppPreference().getInt(PreferencesKey.userId),
        },
      );

      if (response.data["success"] == true) {
        final data = response.data["data"];
        setState(() {
          datesTitle = data["dates_title"] ?? "";
          timesTitle = data["times_title"] ?? "";
          dates = data["dates"];
          times = data["times"];
        });
      }
    } catch (e) {
      debugPrint("API Error: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  /// ✅ POST API call: Set selected availability
  Future<void> submitAvailability() async {
    if (dates.isEmpty || selectedTimeIndexes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select date and at least one time slot."),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final selectedDate = dates[selectedDayIndex]["date"];
    final selectedTimes = selectedTimeIndexes
        .map((i) => times[i]["time"].toString())
        .toList();

    setState(() => isLoading = true);
    try {
      final response = await ApiService.postRequest(
        ServiceProviderAvailability,
        {
          "serviceProvider": AppPreference().getInt(PreferencesKey.userId),
          "date": selectedDate,
          "times": selectedTimes,
        },
      );

      if (response.data["success"] == true) {
        final msg = response.data["message"] ?? "Availability set successfully";
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(msg),
            backgroundColor: Colors.green,
          ),
        );

        // Optional: Navigate after success
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AvailabilityScreen(
              selectedDate: selectedDate,
              selectedTimes: selectedTimes,
            ),
          ),
        );

      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.data["message"] ?? "Something went wrong"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      debugPrint("Submit API Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Failed to submit availability"),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Manage your Availability'),
      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(
          color: Color(0xFF004271),
        ),
      )
          : dates.isEmpty
          ? const Center(
        child: Text(
          "No data available!",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          // Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              datesTitle,
              style:
              TextStyle(fontSize: 14, color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 21),

          // Dates list horizontal
          Container(
            height: 55,
            width: double.infinity,
            color: HexColor('#E4F9FF'),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: dates.length + 1,
              separatorBuilder: (_, __) =>
              const SizedBox(width: 10),
              itemBuilder: (context, index) {
                if (index == 0) {
                  String firstMonth = dates.isNotEmpty
                      ? dates.first["formatted"]
                      .toString()
                      .split(" ")
                      .first
                      : "";
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0),
                      child: Text(
                        firstMonth,
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
                  bool isSelected =
                      selectedDayIndex == dayIndex;
                  final day = dates[dayIndex];

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
                      ),
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Text(
                            day["day"].toString().substring(0, 3),
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
                            day["date"]
                                .toString()
                                .split("-")
                                .last,
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

          const SizedBox(height: 40),

          // Time slot title + underline
          Padding(
            padding: const EdgeInsets.only(
                left: 30, right: 30, bottom: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                timesTitle,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: HexColor('#004271'),
                  decoration: TextDecoration.underline,
                  decorationColor: HexColor('#004271'),
                  decorationThickness: 2,
                ),
              ),
            ),
          ),

          const SizedBox(height: 17),

          // Time slot grid
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Wrap(
                spacing: 22,
                runSpacing: 16,
                children: List.generate(times.length, (index) {
                  bool isSelected =
                  selectedTimeIndexes.contains(index);
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
                        border: Border.all(
                            color: HexColor('#004271'), width: 1),
                      ),
                      child: Text(
                        times[index]["formatted"].toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? Colors.black
                              : HexColor('#004271'),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

          // Done button
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 18),
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
                onPressed: submitAvailability, // ✅ API call
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
