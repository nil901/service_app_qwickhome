import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../colors/colors.dart';
import '../utils/custom_app_bar.dart';
import '../utils/size.dart';

class Setting_Screen extends StatefulWidget {
  @override
  State<Setting_Screen> createState() => _Setting_ScreenState();
}

class _Setting_ScreenState extends State<Setting_Screen> {
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
            title: Text(
              "Hello, Welcome Back",
              style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
            ),
            subtitle: Row(
              children: [
                const Text(
                  "Prathamesh Rathod",
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(width: 6),
                const Icon(
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
              thickness: 0.5, // optional, line ka thickness
            ),
          ),

          SizedBox(height: 15),
          const SettingsOption(
            imagePath: 'assets/images/security.png',
            title: "Account & Security",
          ),
          SizedBox(height: 15),
          const SettingsOption(
            imagePath: 'assets/images/notification.png',
            title: "Notifications",
          ),
          SizedBox(height: 15),
          const SettingsOption(
            imagePath: 'assets/images/language.png',
            title: "Language & Region",
          ),
          SizedBox(height: 15),
          const SettingsOption(
            imagePath: 'assets/images/support.png',
            title: "Support",
          ),
          SizedBox(height: 15),
          const SettingsOption(
            imagePath: 'assets/images/aboutUs.png',
            title: "About Us",
          ),
          SizedBox(height: 15),
          const SettingsOption(
            imagePath: 'assets/images/logout.png',
            title: "Log out",
          ),
        ],
      ),
    );
  }
}

class SettingsOption extends StatelessWidget {
  final String imagePath;
  final String title;

  const SettingsOption({
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
      child: Container(
        width: double.infinity,
        height: 49,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: HexColor('#EAEAEA'), width: 0.25),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A000000), // #0000000D (10% opacity)
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: ListTile(
          leading: Image.asset(
            imagePath,
            width: 19,
            height: 18,
            fit: BoxFit.contain,
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          onTap: () {},
        ),
      ),
    );
  }
}
