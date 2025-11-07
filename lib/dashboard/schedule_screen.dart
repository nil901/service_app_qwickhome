import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:service_app_qwickhome/dashboard/punch_in.dart';
import 'package:service_app_qwickhome/utils/size.dart';
import '../colors/colors.dart';
import '../utils/custom_app_bar.dart';
import 'manage_time.dart';
import '../models/schedule_model.dart';
import '../api_service/api_services.dart';
import '../api_service/urls.dart';
import '../prefs/app_preference.dart';
import '../prefs/preferece_keys.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  ScheduleModel? scheduleData;
  int selectedDayIndex = 0;
  bool isLoading = false;


  @override
  void initState() {
    super.initState();
    String today = DateTime.now().toIso8601String().split('T')[0];
    fetchSchedule(date: today);
  }

  Future<void> fetchSchedule({required String date}) async {
    setState(() => isLoading = true);

    try {
      final response = await ApiService.postRequest(schedule, {
        "serviceProvider": AppPreference().getInt(PreferencesKey.userId),
        "date": date,
      });

      setState(() {
        scheduleData = ScheduleModel.fromJson(response.data);
        isLoading = false;
      });
    } catch (e) {
      debugPrint("API Error: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Schedule'),
      backgroundColor: kwhite,
      body: scheduleData == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManageAvailabilityScreen(),
                  ),
                );
              },
              child: Row(
                children: [
                  Icon(
                    Icons.add_circle_outline,
                    color: HexColor('#004271'),
                    size: 22,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "Add your availability",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      decorationColor: HexColor('#004271'),
                      fontWeight: FontWeight.w500,
                      color: HexColor('#004271'),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // 🔹 Month label + background strip + day selector
          Container(
            height: 70,
            width: double.infinity,
            color: HexColor('#E4F9FF'),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: scheduleData!.data.dates.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                if (index == 0) {
                  // Month label dynamically from first date
                  String month =
                      scheduleData!.data.dates[0].month;
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0),
                      child: Text(
                        month,
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
                  final date = scheduleData!.data.dates[dayIndex];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDayIndex = dayIndex;
                      });
                      fetchSchedule(date: date.date);
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
                            date.day,
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
                            date.date.split("-").last,
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

          const SizedBox(height: 22),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              scheduleData!
                  .data.dates[selectedDayIndex].formatted,
              style: const TextStyle(
                fontSize: 16.5,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 17),

          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator(
              color: Color(0xFF004271),
            ))
            : scheduleData!.data.todaysAcceptedBookings.isEmpty
                ? Center(
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                Image.asset(
                  'assets/images/no_data_found.png',
                  height: 140,
                  width: 180,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 12),
                const Text(
                  "No Data found!",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                            ],
                          ),
                          ) : Expanded(
              child: ListView.builder(
                //physics:NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: scheduleData!
                    .data.todaysAcceptedBookings.length,
                itemBuilder: (context, index) {
                  final booking = scheduleData!
                      .data.todaysAcceptedBookings[index];
                  return ScheduleCard(
                    img: booking.customerDetails.image,
                    name: booking.customerDetails.name,
                    service: booking.serviceDetails.name,
                    time:
                    "${booking.scheduledDate}, ${booking.preferredTime}",
                    address: booking.customerDetails.email,
                    badge: booking.bookingType.toUpperCase(),
                  );
                },
              ),
            ),
          ),
         SizedBox(height: 100),
        ],
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String img, name, service, time, address, badge;

  const ScheduleCard({
    required this.img,
    required this.name,
    required this.service,
    required this.time,
    required this.address,
    //required this.status,
    required this.badge,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
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
                backgroundImage: NetworkImage(img),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.5,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "Service - $service",
                      style: const TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Date & Time – $time",
                      style: const TextStyle(fontSize: 13, color: Colors.black),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Address – $address",
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
          Divider(color: Colors.grey[300], thickness: 1),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 136,
                height: 35,
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
                    fontSize: 12,
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PunchInScreen()));
                },
                child: Container(
                  width: 136,
                  height: 35,
                  decoration: BoxDecoration(
                    color: HexColor('#004271'),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Punch In right now",
                    style: TextStyle(
                      color: HexColor('#FFFFFF'),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
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



