import 'package:flutter/material.dart';

import '../utils/custom_app_bar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'About Us'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// ✅ Our Mission Section
            _sectionCard(
              title: "Our Mission",
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "We're dedicated to empowering service professionals and making quality services accessible to everyone. "
                        "Our platform connects skilled workers with customers who need their expertise, creating opportunities and building trust in communities.",
                    style: TextStyle(fontSize: 13, height: 1.4),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Whether you're a plumber, electrician, carpenter, or any other service professional, "
                        "we provide the tools and support you need to grow your business and serve your customers better.",
                    style: TextStyle(fontSize: 13, height: 1.4),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            /// ✅ Key Features Section
            _sectionCard(
              title: "Key Features",
              child: Column(
                children: [
                  _featureTile("Easy Booking Management", "Manage all your appointments in one place"),
                  _featureTile("Secure Payments", "Get paid quickly and securely"),
                  _featureTile("Customer Reviews", "Build your reputation and attract more customers"),
                  _featureTile("24/7 Support", "We're here anytime you need help"),
                ],
              ),
            ),

            const SizedBox(height: 18),

            /// ✅ Legal & Policies Section
            _sectionCard(
              title: "Legal & Policies",
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  _legalLink("Terms of service"),
                  SizedBox(height: 8),
                  _legalLink("Privacy Policy"),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  /// 📦 Section Card Reusable
  static Widget _sectionCard({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFDADADA), width: 0.7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }

  /// ✅ Feature Row with Checkbox Icon
  static Widget _featureTile(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_box, size: 25, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.black54)),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// ⚖️ Legal Links Widget
  static Widget _legalLink(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: Color(0xFF007AFF),
        decoration: TextDecoration.underline,
      ),
    );
  }
}
