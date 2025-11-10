import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:service_app_qwickhome/api_service/api_services.dart';
import 'package:service_app_qwickhome/api_service/providers.dart';
import 'package:service_app_qwickhome/api_service/urls.dart';
import 'package:service_app_qwickhome/colors/colors.dart';
import 'package:service_app_qwickhome/dashboard/main_home_screen.dart';
import 'package:service_app_qwickhome/prefs/app_preference.dart';
import 'package:service_app_qwickhome/prefs/preferece_keys.dart';
import 'package:service_app_qwickhome/utils/enum.dart';
import '../models/service_details_model.dart';

class ServicesDetailsScreen extends ConsumerStatefulWidget {
  const ServicesDetailsScreen({
    super.key,
    required this.serviceId,
    required this.name,
  });
  final int serviceId;
  final String name;

  @override
  ConsumerState<ServicesDetailsScreen> createState() =>
      _ServicesDetailsScreenState();
}

class _ServicesDetailsScreenState extends ConsumerState<ServicesDetailsScreen> {
  bool isEnglish = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ServiceDetailsAPi(ref);
    });
  }

  Future<void> ServiceDetailsAPi(WidgetRef ref) async {
    ref.read(serviceDetailsProvider.notifier).state = null;
    try {
      final response = await ApiService.postRequest(viewService, {
        "service": widget.serviceId,
        "type": "",
        "user": AppPreference().getInt(PreferencesKey.userId),
      });

      if (response.data['success'] == true) {
        final details = ServiceDetailsModel.fromJson(response.data);
        ref.read(serviceDetailsProvider.notifier).state = details;
      }
    } catch (e) {
      print("Error fetching service details: $e");
    }
  }

  @override
  // void dispose() {
  //   Future.microtask(() {
  //     ref.invalidate(serviceDetailsProvider);
  //     ref.invalidate(selectedPlanProvider);
  //     ref.invalidate(selectedMaterialProvider);
  //     ref.invalidate(cardClickStateProvider);
  //     ref.invalidate(cleanerCountProvider);
  //   });
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    final serviceDetails = ref.watch(serviceDetailsProvider);
    final service = serviceDetails?.data?.service;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFE4F9FF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder:
                    (context) => MainHomeScreen(initialTab: BottomTab.home),
              ),
            );
          },
        ),
        title: Text(
          widget.name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
      ),
      body:
      service == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🖼️ Image
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage('${service.imageUrl}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // 🧾 Title & Details
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${service.name}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${service.description}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          RatingStarsComman(
                            rating: service.averageRating ?? 0,
                            size: 16,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '(${service.totalReviews ?? 0} reviews)',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      // Text(
                      //   'AED ${service.subscriptionPlans?.firstWhere((e) => e.frequencyType == "onetime")?.pricePerTime ?? ''}',
                      //   style: const TextStyle(
                      //     fontSize: 18,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                    ],
                  ),
                ),

                const SizedBox(height: 22),
                const Divider(thickness: 0.9),

                // 📄 About
                _sectionTitle('About the service'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    '${service.description}',
                    style: const TextStyle(fontSize: 13.5, height: 1.5),
                  ),
                ),

                const SizedBox(height: 18),
                Divider(thickness: 0.9, color: Colors.grey[300]),

                // _sectionTitle('Select requirements'),

                // ServiceOptions(
                //   plans: service.subscriptionPlans!,
                //   onPlanSelected: () {},
                // ),
                // const Divider(thickness: 0.3),

                // const CleanerCountSelector(),
                // const Divider(thickness: 0.3),

                // MaterialOptions(material: service),
                Divider(),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: service.processes?.length ?? 0,
                  itemBuilder: (context, index) {
                    final step = service.processes![index];
                    final isImageLeft = index % 2 == 1;
                    return _timelineStep(
                      stepNum: index + 1,
                      isImageLeft: isImageLeft,
                      imagePath: step.imageUrl ?? '',
                      title: step.title ?? '',
                      description: step.description ?? '',
                      isLast: index == service.processes!.length - 1,
                    );
                  },
                ),

                const SizedBox(height: 18),
                Divider(thickness: 0.9, color: Colors.grey[300]),

                _sectionTitle("What's Included?"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final text in service.whatsInclude ?? [])
                        _includedText(text),
                    ],
                  ),
                ),

                const SizedBox(height: 18),
                Divider(thickness: 0.9, color: Colors.grey[300]),

                _sectionTitle('What We Need From You'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: service.requirements?.length ?? 0,
                      itemBuilder: (context, index) {
                        final req = service.requirements![index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: neededCard(
                            icon: Image.network(
                              req.imageUrl ?? '',
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (context, error, stackTrace) =>
                                  Image.asset(
                                    'assets/images/logo.png',
                                    height: 50,
                                    width: 50,
                                    color: kgrey,
                                  ),
                            ),
                            text: req.title ?? '',
                          ),
                        );
                      },
                    ),
                  ),
                ),

               // const SizedBox(height: 20),
                // _sectionTitle('Frequently asked questions'),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16),
                //   child: FaqComman(faqData: service.faq),
                // ),
                const SizedBox(height: 80),
              ],
            ),
          ),

          // ✅ SINGLE DONE BUTTON
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                        MainHomeScreen(initialTab: BottomTab.home),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff004271),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Got it',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
      ),
    );
  }

  static Widget _timelineStep({
    required int stepNum,
    required bool isImageLeft,
    required String imagePath,
    required String title,
    required String description,
    bool isLast = false,
  }) {
    final img = ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        imagePath,
        height: 120,
        width: 130,
        fit: BoxFit.cover,
        errorBuilder:
            (context, error, stackTrace) => Container(
          height: 120,
          width: 130,
          color: Colors.grey[200],
          child: const Icon(Icons.image_not_supported, color: Colors.grey),
        ),
      ),
    );

    final circle = Column(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            color: Color(0xff004271),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            '$stepNum',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        if (!isLast) Container(width: 3, height: 90, color: Colors.grey[300]),
      ],
    );

    final txt = Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(description, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: isImageLeft ? [img, circle, txt] : [txt, circle, img],
      ),
    );
  }

  static Widget neededCard({required Widget icon, required String text}) {
    return Container(
      width: 110,
      height: 140,
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.grey[300]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.10),
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: const EdgeInsets.only(top: 14), child: icon),
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, height: 1.2),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _includedText(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Text('• $text', style: const TextStyle(fontSize: 15.5)),
  );
}



class RatingStarsComman extends StatelessWidget {
  final double rating; // e.g. 3.5
  final double size;

  const RatingStarsComman({super.key, required this.rating, this.size = 15});

  @override
  Widget build(BuildContext context) {
    const starColor = Color(0xFFFFD700);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final starIndex = index + 1;
        if (rating >= starIndex) {
          return Icon(Icons.star, color: HexColor("#6F6F6F"), size: size);
        } else if (rating > index && rating < starIndex) {
          return Icon(Icons.star_half, color: HexColor("#6F6F6F"), size: size);
        } else {
          return Icon(
            Icons.star_border,
            color: HexColor("#6F6F6F"),
            size: size,
          );
        }
      }),
    );
  }
}