// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:service_app_qwickhome/auth/logout.dart';
// import '../colors/colors.dart';
// import '../utils/custom_app_bar.dart';
//
// class Setting_Screen extends ConsumerStatefulWidget {
//   const Setting_Screen({super.key});
//
//   @override
//   ConsumerState<Setting_Screen> createState() => _Setting_ScreenState();
// }
//
// class _Setting_ScreenState extends ConsumerState<Setting_Screen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: 'Settings'),
//       backgroundColor: kwhite,
//       body: Column(
//         children: [
//           const SizedBox(height: 26),
//           ListTile(
//             leading: const CircleAvatar(
//               child: Icon(Icons.person, size: 32),
//               radius: 26,
//             ),
//             title: const Text(
//               "Hello, Welcome Back",
//               style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black,
//               ),
//             ),
//             subtitle: Row(
//               children: const [
//                 Text(
//                   "Prathamesh Rathod",
//                   style: TextStyle(fontSize: 14),
//                 ),
//                 SizedBox(width: 6),
//                 Icon(
//                   Icons.edit,
//                   size: 18,
//                   color: Colors.black,
//                 ),
//               ],
//             ),
//           ),
//
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 26),
//             child: const Divider(
//               color: Colors.grey,
//               thickness: 0.5,
//             ),
//           ),
//           const SizedBox(height: 15),
//
//           // 🔹 Account & Security
//           SettingsOption(
//             imagePath: 'assets/images/security.png',
//             title: "Account & Security",
//             onTap: () {
//               debugPrint("Account & Security tapped");
//             },
//           ),
//           const SizedBox(height: 15),
//
//           // 🔹 Notifications
//           SettingsOption(
//             imagePath: 'assets/images/notification.png',
//             title: "Notifications",
//             onTap: () {
//               debugPrint("Notifications tapped");
//             },
//           ),
//           const SizedBox(height: 15),
//
//           // 🔹 Language
//           SettingsOption(
//             imagePath: 'assets/images/language.png',
//             title: "Language & Region",
//             onTap: () {
//               debugPrint("Language & Region tapped");
//             },
//           ),
//           const SizedBox(height: 15),
//
//           // 🔹 Support
//           SettingsOption(
//             imagePath: 'assets/images/support.png',
//             title: "Support",
//             onTap: () {
//               debugPrint("Support tapped");
//             },
//           ),
//           const SizedBox(height: 15),
//
//           // 🔹 About Us
//           SettingsOption(
//             imagePath: 'assets/images/aboutUs.png',
//             title: "About Us",
//             onTap: () {
//               debugPrint("About Us tapped");
//             },
//           ),
//           const SizedBox(height: 15),
//
//           // 🔹 Logout
//           SettingsOption(
//             imagePath: 'assets/images/logout.png',
//             title: "Log out",
//             onTap: () {
//               showDialog(
//                 context: context,
//                 barrierDismissible: false,
//                 builder: (context) => Center(
//                   child: Container(
//                     width: 290,
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 18, vertical: 22),
//                     decoration: BoxDecoration(
//                       color: HexColor('#E4F9FF'),
//                       borderRadius: BorderRadius.circular(15),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.5),
//                           offset: const Offset(0, 4),
//                           blurRadius: 4,
//                         ),
//                       ],
//                       border:
//                       Border.all(color: HexColor('#004271'), width: 1),
//                     ),
//                     child: Material(
//                       color: Colors.transparent,
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             "Log Out?",
//                             style: TextStyle(
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                           const SizedBox(height: 7),
//                           const Text(
//                             "Are you sure you want to log out of your account?",
//                             style: TextStyle(
//                               fontSize: 15,
//                               color: Colors.black54,
//                             ),
//                           ),
//                           const SizedBox(height: 22),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               ElevatedButton(
//                                 onPressed: () => Navigator.pop(context),
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.grey.shade300,
//                                   foregroundColor: Colors.black87,
//                                   elevation: 0,
//                                   minimumSize: const Size(95, 38),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                 ),
//                                 child: const Text("Cancel"),
//                               ),
//                               const SizedBox(width: 15),
//                               ElevatedButton(
//                                 onPressed: () async {
//                                   await Logout().logoutUser(context, ref);
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: const Color(0xFF003A64),
//                                   foregroundColor: Colors.white,
//                                   elevation: 0,
//                                   minimumSize: const Size(95, 38),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                 ),
//                                 child: const Text("Log Out"),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class SettingsOption extends StatelessWidget {
//   final String imagePath;
//   final String title;
//   final VoidCallback onTap;
//
//   const SettingsOption({
//     super.key,
//     required this.imagePath,
//     required this.title,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
//       child: InkWell(
//         onTap: onTap,
//         borderRadius: BorderRadius.circular(10),
//         child: Container(
//           width: double.infinity,
//           height: 49,
//           decoration: BoxDecoration(
//             color: Colors.white70,
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(color: HexColor('#EAEAEA'), width: 0.25),
//             boxShadow: const [
//               BoxShadow(
//                 color: Color(0x1A000000),
//                 offset: Offset(0, 4),
//                 blurRadius: 4,
//               ),
//             ],
//           ),
//           child: Row(
//             children: [
//               const SizedBox(width: 12),
//               Image.asset(
//                 imagePath,
//                 width: 19,
//                 height: 18,
//                 fit: BoxFit.contain,
//               ),
//               const SizedBox(width: 14),
//               Expanded(
//                 child: Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import '../colors/colors.dart';
import '../setting_screens/personal_info.dart';
import '../utils/custom_app_bar.dart';


class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Settings'),
      backgroundColor: kwhite,

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8),

            /// ✅ Profile Name Section
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage('assets/images/user_img.png'),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello, Welcome Back",
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                      Text("Prathamesh Rathod",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                    ],
                  )
                ],
              ),
            ),

            Divider(height: 1, color: Colors.grey[300]),

            /// ✅ Stats Row
            Container(
              padding: EdgeInsets.symmetric(vertical: 14),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _statBox("142", "Jobs Completed"),
                  _statBox("Sept 2025", "Member since"),
                ],
              ),
            ),

            SizedBox(height: 20),

            /// ✅ Menu Options With Separate onTap
            _menuTile(
              Icons.shield_outlined,
              "Personal Information",
              "Name, contact, Location",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => PersonalInfoScreen(),
                ));
              },
            ),

            _menuTile(
              Icons.business_center_outlined,
              "Service Details",
              "Service offered, area",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => PlaceholderScreen("Service Details"),
                ));
              },
            ),

            _menuTile(
              Icons.location_on_outlined,
              "Service Areas",
              "Manage service location",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => PlaceholderScreen("Service Areas"),
                ));
              },
            ),

            _menuTile(
              Icons.account_balance_outlined,
              "Payment & Banking",
              "Bank details, payment methods",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => PlaceholderScreen("Payment & Banking"),
                ));
              },
            ),

            _menuTile(
              Icons.lock_outline,
              "Account & Security",
              "Password, privacy, security",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => PlaceholderScreen("Account & Security"),
                ));
              },
            ),

            _menuTile(
              Icons.support_agent_outlined,
              "Support",
              "Help center, contact support",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => PlaceholderScreen("Support"),
                ));
              },
            ),

            _menuTile(
              Icons.info_outline,
              "About Us",
              "App info, terms & privacy",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => PlaceholderScreen("About Us"),
                ));
              },
            ),

            _menuTile(
              Icons.logout,
              "Log out",
              "Sign out of your account",
              isLogout: true,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text("Logout"),
                    content: Text("Are you sure you want to logout?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // TODO: Add logout logic
                        },
                        child: Text("Logout", style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );
              },
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// ✅ Stats Box Widget
  Widget _statBox(String title, String subtitle) {
    return Container(
      width: 170,
      height: 70,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFE5E5E5), width: 0.7),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          SizedBox(height: 3),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  /// ✅ Menu Tile Function with custom onTap
  Widget _menuTile(
      IconData icon,
      String title,
      String subtitle, {
        bool isLogout = false,
        required Function onTap,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () => onTap(),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 62,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(0xFFDBDBDB), width: 0.25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            leading: Icon(icon,
                color: isLogout ? Colors.red : Colors.black87),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: isLogout ? Colors.red : Colors.black,
              ),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
            trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
          ),
        ),
      ),
    );
  }
}

/// ✅ Placeholder Screen (remove later)
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: Text("$title Screen Coming Soon...")),
    );
  }
}
