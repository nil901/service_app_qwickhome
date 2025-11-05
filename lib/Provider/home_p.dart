import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:service_app_qwickhome/API%20Services/home_services.dart';
import 'package:service_app_qwickhome/Models/homeModel.dart';

final homeProvider = FutureProvider<homeModel?>((ref) async {
  return await HomeService().getHomeData();
});
