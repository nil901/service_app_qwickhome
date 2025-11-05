import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/notification_model.dart';
final notifactionProvider = StateProvider<List<NotifactionModel>>((ref) => []);