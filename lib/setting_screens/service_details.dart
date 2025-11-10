import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../utils/custom_app_bar.dart';

class ServiceDetailsScreen extends StatefulWidget {
  const ServiceDetailsScreen({super.key});

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Service Details'),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 107,
                    // width: double.infinity,
                    padding: EdgeInsets.only(left: 20, right: 12, top: 8, bottom: 12),
                    decoration: BoxDecoration(
                      color: Color(0xFFE6F7FF),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: HexColor('#004271')),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center, // ✅ center align
                          children: [
                            Image.asset('assets/images/alert.png', height: 20, width: 18),
                            SizedBox(width: 10),

                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Image.asset('assets/images/lock.png', height: 15, width: 12),
                            ),
                            SizedBox(width: 6),

                            Text(
                              "Information Protected",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 14),
                        Text(
                          "For security reasons, personal information cannot be edited directly. To update your information, "
                              "please request changes through our admin team.",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  /// ✅ Primary Service Section
                  _sectionCard(
                    title: "Primary Service",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _label("Service Category"),
                        _disabledField("Plumber"),

                        const SizedBox(height: 12),
                        _label("Service Description"),
                        _disabledField(
                          "Professional plumbing services for residential and commercial properties. Licensed and insured with 5+ years of experience.",
                          maxLines: 3,
                        ),

                        const SizedBox(height: 12),
                        _label("Years of Experience"),
                        _disabledField("5"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// ✅ Services Offered
                  _sectionCard(
                    title: "Services Offered",
                    showLock: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("All the services that you offer",
                            style: TextStyle(fontSize: 12, color: Colors.black54)),

                        SizedBox(height: 12),

                        Text("• Plumbing Repair"),
                        Text("• Pipe Installation"),
                        Text("• Bathroom Plumbing"),
                        Text("• Kitchen Plumbing"),
                        Text("• Water Heater Service"),
                        Text("• Leak Detection"),

                        SizedBox(height: 12),

                        Text("Edit services",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: 13)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
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

                },

                child: const Text(
                  "Request Changes",
                  style: TextStyle(
                    fontSize: 14,
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

  /// 📌 Card Section Widget
  Widget _sectionCard({required String title, required Widget child, bool showLock = false}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFDADADA), width: 0.7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              if (showLock) ...[
                const Spacer(),
                Image.asset('assets/images/lock.png', height: 25, width: 20),
              ]
            ],
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  /// 📌 Grey Disabled Box Style
  Widget _disabledField(String text, {int maxLines = 1}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 13, color: Colors.black87),
      ),
    );
  }

  Widget _label(String text) {
    return Text(text, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black54));
  }

  /// 📌 Request Change Dialog
  void _openRequestDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: const Text("Request Information Change", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Describe the changes you need. Our admin team will review within 24–48 hours.",
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),

                const SizedBox(height: 10),

                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: "Specify which service details you'd like to update...",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF7FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "Tip: Be specific. Example:\n“Please update my service description to include new services offered.”",
                    style: TextStyle(fontSize: 11, color: Colors.black87),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF004271)),
                child: const Text("Send Request"),
              ),
            ],
          ),
        );
      },
    );
  }
}
