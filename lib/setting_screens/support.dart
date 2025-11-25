import 'package:flutter/material.dart';
import 'package:service_app_qwickhome/utils/custom_app_bar.dart';
import '../api_service/api_services.dart';
import '../api_service/urls.dart';
import '../prefs/app_preference.dart';
import '../prefs/preferece_keys.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  bool isLoading = false;

  // Contact Section Data
  String contactLiveChatTitle = "";
  String contactLiveChatSubtitle = "";

  String contactEmailTitle = "";
  String contactEmailSubtitle = "";

  String contactPhoneTitle = "";
  String contactPhoneSubtitle = "";

  List<Map<String, String>> faqList = [];

  @override
  void initState() {
    super.initState();
    fetchSupportData();
  }

  Future<void> fetchSupportData() async {
    setState(() => isLoading = true);

    try {
      final response = await ApiService.postRequest(
        supportApi,
        {"serviceProviderId": AppPreference().getInt(PreferencesKey.userId)},
      );

      final data = response.data;

      contactLiveChatTitle = data["contact"]["livechat"]["title"];
      contactLiveChatSubtitle = data["contact"]["livechat"]["data"];

      contactEmailTitle = data["contact"]["email_support"]["title"];
      contactEmailSubtitle = data["contact"]["email_support"]["data"];

      contactPhoneTitle = data["contact"]["phone_support"]["title"];
      contactPhoneSubtitle = data["contact"]["phone_support"]["data"].toString();

      // FAQs
      faqList = [];
      final faqMap = data["Frequently Asked Questions (FAQs)"];
      faqMap.forEach((key, value) {
        faqList.add({
          "question": value["question"],
          "answer": value["answer"],
        });
      });

      setState(() => isLoading = false);
    } catch (e) {
      debugPrint("Support API Error: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Support'),

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CONTACT US SECTION
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contact Us',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),

                  _buildContactTile(
                    icon: Icons.chat_bubble_outline,
                    title: contactLiveChatTitle,
                    subtitle: contactLiveChatSubtitle,
                    onTap: () {},
                  ),
                  const SizedBox(height: 10),

                  _buildContactTile(
                    icon: Icons.email_outlined,
                    title: contactEmailTitle,
                    subtitle: contactEmailSubtitle,
                    onTap: () {},
                  ),
                  const SizedBox(height: 10),

                  _buildContactTile(
                    icon: Icons.phone_outlined,
                    title: contactPhoneTitle,
                    subtitle: contactPhoneSubtitle,
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // FAQ SECTION
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Frequently Asked Questions',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),

                  ...faqList.map((faq) => _FAQTile(
                    question: faq["question"]!,
                    answer: faq["answer"]!,
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: Colors.black54),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
        ],
      ),
    );
  }
}

class _FAQTile extends StatefulWidget {
  final String question;
  final String answer;

  const _FAQTile({required this.question, required this.answer});

  @override
  State<_FAQTile> createState() => _FAQTileState();
}

class _FAQTileState extends State<_FAQTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        childrenPadding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
        title: Text(
          widget.question,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        trailing: Icon(
          isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          color: Colors.black54,
        ),
        onExpansionChanged: (expanded) {
          setState(() => isExpanded = expanded);
        },
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.answer,
              style: const TextStyle(color: Colors.black54, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
