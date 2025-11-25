import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';
import '../auth/logout.dart';
import '../colors/colors.dart';
import '../setting_screens/about_us.dart';
import '../setting_screens/account&Security.dart';
import '../setting_screens/payment_screen.dart';
import '../setting_screens/personal_info.dart';
import '../setting_screens/service_area.dart';
import '../setting_screens/service_details.dart';
import '../setting_screens/support.dart';
import '../utils/custom_app_bar.dart';


class SettingScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

            _menuTile(
              iconWidget: Image.asset(
                "assets/images/profile_icon.png",
                height: 22,
                width: 22,
              ),
              title: "Personal Information",
              subtitle: "Name, contact, Location",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => PersonalInfoScreen(),
                ));
              },
            ),


            _menuTile(
              iconWidget: Image.asset(
                "assets/images/service_details.png",
                height: 19,
                width: 24,
              ),
              title: "Service Details",
              subtitle: "Service offered, area",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => ServiceScreen(),
                ));
              },
            ),


            _menuTile(
              iconWidget: Image.asset(
                "assets/images/location_icon.png",
                height: 25,
                width: 19,
              ),
             title:  "Service Areas",
              subtitle: "Manage service location",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ServiceAreasScreen(),
                  ),
                );
              },
            ),

            _menuTile(
              iconWidget: Image.asset(
                "assets/images/payment_banking.png",
                height: 20,
                width: 27,
              ),
             title:  "Payment & Banking",
              subtitle: "Bank details, payment methods",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => PaymentBankingScreen(),
                ));
              },
            ),

            _menuTile(
              iconWidget: Image.asset(
                "assets/images/account&sec_icon.png",
                height: 19,
                width: 24,
              ),
              title: "Account & Security",
              subtitle: "Password, privacy, security",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) =>AccountSecurityScreen(),
                ));
              },
            ),

            _menuTile(
              iconWidget: Image.asset(
                "assets/images/supportt.png",
                height: 21,
                width: 21,
              ),
              title: "Support",
              subtitle: "Help center, contact support",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => SupportScreen(),
                ));
              },
            ),

            _menuTile(
              iconWidget: Image.asset(
                "assets/images/about_icon.png",
                height: 26,
                width: 26,
              ),
              title: "About Us",
              subtitle: "App info, terms & privacy",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) =>  AboutUsScreen(),
                ));
              },
            ),

            _menuTile(
              iconWidget: Image.asset(
                "assets/images/logout.png",
                height: 20,
                width: 20,
              ),
              title: "Log out",
              subtitle: "Sign out of your account",
              // onTap: () {
              //   showDialog(
              //     context: context,
              //     builder: (_) => AlertDialog(
              //       title: Text("Logout"),
              //       content: Text("Are you sure you want to logout?"),
              //       actions: [
              //         TextButton(
              //           onPressed: () => Navigator.pop(context),
              //           child: Text("Cancel"),
              //         ),
              //         TextButton(
              //           onPressed: () {
              //             Navigator.pop(context);
              //             // TODO: Add logout logic
              //           },
              //           child: Text("Logout"),
              //         ),
              //       ],
              //     ),
              //   );
              // },
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => Center(
                    child: Container(
                      width: 290,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 22),
                      decoration: BoxDecoration(
                        color: HexColor('#E4F9FF'),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(0, 4),
                            blurRadius: 4,
                          ),
                        ],
                        border:
                        Border.all(color: HexColor('#004271'), width: 1),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Log Out?",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 7),
                            const Text(
                              "Are you sure you want to log out of your account?",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 22),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey.shade300,
                                    foregroundColor: Colors.black87,
                                    elevation: 0,
                                    minimumSize: const Size(95, 38),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Text("Cancel"),
                                ),
                                const SizedBox(width: 15),
                                ElevatedButton(
                                  onPressed: () async {
                                    await Logout().logoutUser(context, ref);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF003A64),
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    minimumSize: const Size(95, 38),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Text("Log Out"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
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


  Widget _menuTile({
    required Widget iconWidget,
    required String title,
    required String subtitle,
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
            leading: iconWidget,
            title: Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black,
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
