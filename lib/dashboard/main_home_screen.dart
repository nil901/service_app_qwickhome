// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:service_app_qwickhome/dashboard/earnings.dart';
// import 'package:service_app_qwickhome/dashboard/schedule_screen.dart';
// import 'package:service_app_qwickhome/dashboard/settings.dart';
// import '../colors/colors.dart';
// import '../utils/enum.dart';
// import 'home.dart';
//
// class MainHomeScreen extends ConsumerWidget {
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final selectedTab = ref.watch(bottomTabProvider);
//
//     final Map<BottomTab, Widget> pages = {
//        BottomTab.home:  HomeScreen(),
//        BottomTab.schedule: ScheduleScreen(),
//        BottomTab.earnings: Earning_Screen(),
//        BottomTab.settings: Setting_Screen(),
//     };
//
//     double bottomPadding = MediaQuery.of(context).viewPadding.bottom;
//
//     return Scaffold(
//       backgroundColor: kwhite,
//       body: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(
//               bottom: 80, // 👈 Added safe space for bottom nav bar
//             ),
//             child: pages[selectedTab]!,
//           ),
//           Positioned(
//             left: 16,
//             right: 16,
//             bottom: 5,
//             child: SafeArea(
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(30),
//                 child: BottomNavigationBar(
//                   currentIndex: BottomTab.values.indexOf(selectedTab),
//                   onTap: (index) {
//                     ref.read(bottomTabProvider.notifier).state =
//                     BottomTab.values[index];
//                   },
//                   type: BottomNavigationBarType.fixed,
//                   backgroundColor:kscoundPrimaryColor,
//                   selectedItemColor: kprimary,
//                   unselectedItemColor: Colors.black87,
//                   showUnselectedLabels: true,
//                   selectedLabelStyle: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   unselectedLabelStyle: TextStyle(fontSize: 12),
//                   iconSize: 0,
//                   items: [
//                     _navItem("assets/images/home.png", "Home",
//                         selectedTab == BottomTab.home),
//                     _navItem("assets/images/schedule.png", "Schedule",
//                         selectedTab == BottomTab.schedule),
//                     _navItem("assets/images/earnings.png", "Earnings",
//                         selectedTab == BottomTab.earnings),
//                     _navItem("assets/images/setting.png", "Settings",
//                         selectedTab == BottomTab.settings),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   BottomNavigationBarItem _navItem(
//       String asset, String label, bool isSelected) {
//     return BottomNavigationBarItem(
//       icon: CircleAvatar(
//         radius: 18,
//         backgroundColor: isSelected ?kprimary : Colors.transparent,
//         child: Image.asset(
//           asset,
//           color: isSelected ? Colors.white : Colors.black,
//           height: 18,
//           width: 18,
//         ),
//       ),
//       label: label,
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:service_app_qwickhome/dashboard/earnings.dart';
import 'package:service_app_qwickhome/dashboard/schedule_screen.dart';
import 'package:service_app_qwickhome/dashboard/settings.dart';
import '../colors/colors.dart';
import '../utils/enum.dart';
import 'home.dart';

class MainHomeScreen extends ConsumerStatefulWidget {
  final BottomTab initialTab; // ✅ Added same as your QuickHome code

  const MainHomeScreen({required this.initialTab, Key? key}) : super(key: key);

  @override
  ConsumerState<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends ConsumerState<MainHomeScreen> {
  @override
  void initState() {
    super.initState();

    /// ✅ Set the initial tab when the widget is first built
    Future.microtask(() {
      ref.read(bottomTabProvider.notifier).state = widget.initialTab;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedTab = ref.watch(bottomTabProvider);

    final Map<BottomTab, Widget> pages = {
      BottomTab.home: HomeScreen(),
      BottomTab.schedule: ScheduleScreen(),
      BottomTab.earnings: Earning_Screen(),
      BottomTab.settings: SettingScreen(),
    };

    return Scaffold(
      backgroundColor: kwhite,
      body: Stack(
        children: [
          /// ✅ Prevent Page Content from going behind Bottom Nav Bar
          Padding(
            padding: const EdgeInsets.only(
              bottom: 80, // Safe space for navigation bar
            ),
            child: pages[selectedTab]!,
          ),

          /// ✅ Bottom Navigation Bar
          Positioned(
            left: 16,
            right: 16,
            bottom: 5,
            child: SafeArea(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BottomNavigationBar(
                  currentIndex: BottomTab.values.indexOf(selectedTab),
                  onTap: (index) {
                    ref.read(bottomTabProvider.notifier).state =
                    BottomTab.values[index];
                  },
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: kscoundPrimaryColor,
                  selectedItemColor: kprimary,
                  unselectedItemColor: Colors.black87,
                  showUnselectedLabels: true,
                  selectedLabelStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: const TextStyle(fontSize: 12),
                  iconSize: 0,
                  items: [
                    _navItem(
                      "assets/images/home.png",
                      "Home",
                      selectedTab == BottomTab.home,
                    ),
                    _navItem(
                      "assets/images/schedule.png",
                      "Schedule",
                      selectedTab == BottomTab.schedule,
                    ),
                    _navItem(
                      "assets/images/earnings.png",
                      "Earnings",
                      selectedTab == BottomTab.earnings,
                    ),
                    _navItem(
                      "assets/images/setting.png",
                      "Settings",
                      selectedTab == BottomTab.settings,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ✅ Custom Navigation Item
  BottomNavigationBarItem _navItem(
      String asset,
      String label,
      bool isSelected,
      ) {
    return BottomNavigationBarItem(
      icon: CircleAvatar(
        radius: 18,
        backgroundColor: isSelected ? kprimary : Colors.transparent,
        child: Image.asset(
          asset,
          color: isSelected ? Colors.white : Colors.black,
          height: 18,
          width: 18,
        ),
      ),
      label: label,
    );
  }
}