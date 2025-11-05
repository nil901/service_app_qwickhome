import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:service_app_qwickhome/auth/logout.dart';
import '../colors/colors.dart';
import '../utils/custom_app_bar.dart';

class Setting_Screen extends ConsumerStatefulWidget {
  const Setting_Screen({super.key});

  @override
  ConsumerState<Setting_Screen> createState() => _Setting_ScreenState();
}

class _Setting_ScreenState extends ConsumerState<Setting_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Settings'),
      backgroundColor: kwhite,
      body: Column(
        children: [
          const SizedBox(height: 26),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person, size: 32),
              radius: 26,
            ),
            title: const Text(
              "Hello, Welcome Back",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            subtitle: Row(
              children: const [
                Text(
                  "Prathamesh Rathod",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(width: 6),
                Icon(
                  Icons.edit,
                  size: 18,
                  color: Colors.black,
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: const Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
          ),
          const SizedBox(height: 15),

          // 🔹 Account & Security
          SettingsOption(
            imagePath: 'assets/images/security.png',
            title: "Account & Security",
            onTap: () {
              debugPrint("Account & Security tapped");
            },
          ),
          const SizedBox(height: 15),

          // 🔹 Notifications
          SettingsOption(
            imagePath: 'assets/images/notification.png',
            title: "Notifications",
            onTap: () {
              debugPrint("Notifications tapped");
            },
          ),
          const SizedBox(height: 15),

          // 🔹 Language
          SettingsOption(
            imagePath: 'assets/images/language.png',
            title: "Language & Region",
            onTap: () {
              debugPrint("Language & Region tapped");
            },
          ),
          const SizedBox(height: 15),

          // 🔹 Support
          SettingsOption(
            imagePath: 'assets/images/support.png',
            title: "Support",
            onTap: () {
              debugPrint("Support tapped");
            },
          ),
          const SizedBox(height: 15),

          // 🔹 About Us
          SettingsOption(
            imagePath: 'assets/images/aboutUs.png',
            title: "About Us",
            onTap: () {
              debugPrint("About Us tapped");
            },
          ),
          const SizedBox(height: 15),

          // 🔹 Logout
          SettingsOption(
            imagePath: 'assets/images/logout.png',
            title: "Log out",
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
        ],
      ),
    );
  }
}

class SettingsOption extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  const SettingsOption({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: double.infinity,
          height: 49,
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: HexColor('#EAEAEA'), width: 0.25),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1A000000),
                offset: Offset(0, 4),
                blurRadius: 4,
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 12),
              Image.asset(
                imagePath,
                width: 19,
                height: 18,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
