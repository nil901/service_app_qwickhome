import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/notification_model.dart';
import '../models/service_details_model.dart';
final notificationProvider = StateProvider<List<NotifactionModel>>((ref) => []);
final serviceDetailsProvider = StateProvider<ServiceDetailsModel?>((ref) => null);