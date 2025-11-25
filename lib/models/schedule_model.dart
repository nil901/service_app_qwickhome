// class ScheduleModel {
//   final bool success;
//   final int statusCode;
//   final String message;
//   final ScheduleData data;
//
//   ScheduleModel({
//     required this.success,
//     required this.statusCode,
//     required this.message,
//     required this.data,
//   });
//
//   factory ScheduleModel.fromJson(Map<String, dynamic> json) {
//     return ScheduleModel(
//       success: json['success'] ?? false,
//       statusCode: json['status_code'] ?? 0,
//       message: json['message'] ?? '',
//       data: ScheduleData.fromJson(json['data']),
//     );
//   }
// }
//
// class ScheduleData {
//   final List<ScheduleDate> dates;
//   final List<TodayBooking> todaysAcceptedBookings;
//
//   ScheduleData({required this.dates, required this.todaysAcceptedBookings});
//
//   factory ScheduleData.fromJson(Map<String, dynamic> json) {
//     return ScheduleData(
//       dates: (json['dates'] as List)
//           .map((e) => ScheduleDate.fromJson(e))
//           .toList(),
//       todaysAcceptedBookings:
//       (json['todays_accepted_bookings'] as List)
//           .map((e) => TodayBooking.fromJson(e))
//           .toList(),
//     );
//   }
// }
//
// class ScheduleDate {
//   final int id;
//   final String date;
//   final String day;
//   final String month;
//   final String formatted;
//
//   ScheduleDate({
//     required this.id,
//     required this.date,
//     required this.day,
//     required this.month,
//     required this.formatted,
//   });
//
//   factory ScheduleDate.fromJson(Map<String, dynamic> json) {
//     return ScheduleDate(
//       id: json['id'] ?? 0,
//       date: json['date'] ?? '',
//       day: json['day'] ?? '',
//       month: json['month'] ?? '',
//       formatted: json['formatted'] ?? '',
//     );
//   }
// }
//
// class TodayBooking {
//   final int bookingId;
//   final String bookingReference;
//   final String scheduledDate;
//   final String preferredTime;
//   final String totalAmount;
//   final String currency;
//   final String bookingType;
//   final CustomerDetails customerDetails;
//   final ServiceDetails serviceDetails;
//
//   TodayBooking({
//     required this.bookingId,
//     required this.bookingReference,
//     required this.scheduledDate,
//     required this.preferredTime,
//     required this.totalAmount,
//     required this.currency,
//     required this.bookingType,
//     required this.customerDetails,
//     required this.serviceDetails,
//   });
//
//   factory TodayBooking.fromJson(Map<String, dynamic> json) {
//     return TodayBooking(
//       bookingId: json['booking_id'] ?? 0,
//       bookingReference: json['booking_reference'] ?? '',
//       scheduledDate: json['scheduled_date'] ?? '',
//       preferredTime: json['preferred_time'] ?? '',
//       totalAmount: json['total_amount'] ?? '',
//       currency: json['currency'] ?? '',
//       bookingType: json['booking_type'] ?? '',
//       customerDetails: CustomerDetails.fromJson(json['customer_details']),
//       serviceDetails: ServiceDetails.fromJson(json['service_details']),
//     );
//   }
// }
//
// class CustomerDetails {
//   final int id;
//   final String name;
//   final String email;
//   final String phone;
//   final String image;
//
//   CustomerDetails({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.phone,
//     required this.image,
//   });
//
//   factory CustomerDetails.fromJson(Map<String, dynamic> json) {
//     return CustomerDetails(
//       id: json['id'] ?? 0,
//       name: json['name'] ?? '',
//       email: json['email'] ?? '',
//       phone: json['phone'] ?? '',
//       image: json['image'] ?? '',
//     );
//   }
// }
//
// class ServiceDetails {
//   final int id;
//   final String name;
//   final String description;
//   final String image;
//
//   ServiceDetails({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.image,
//   });
//
//   factory ServiceDetails.fromJson(Map<String, dynamic> json) {
//     return ServiceDetails(
//       id: json['id'] ?? 0,
//       name: json['name'] ?? '',
//       description: json['description'] ?? '',
//       image: json['image'] ?? '',
//     );
//   }
// }
class ScheduleModel {
  final bool success;
  final int statusCode;
  final String message;
  final ScheduleData data;

  ScheduleModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      success: json['success'] ?? false,
      statusCode: json['status_code'] ?? 0,
      message: json['message'] ?? '',
      data: ScheduleData.fromJson(json['data']),
    );
  }
}

class ScheduleData {
  final List<ScheduleDate> dates;
  final List<TodayBooking> todaysAcceptedBookings;

  ScheduleData({required this.dates, required this.todaysAcceptedBookings});

  factory ScheduleData.fromJson(Map<String, dynamic> json) {
    return ScheduleData(
      dates: (json['dates'] as List)
          .map((e) => ScheduleDate.fromJson(e))
          .toList(),
      todaysAcceptedBookings:
      (json['todays_accepted_bookings'] as List)
          .map((e) => TodayBooking.fromJson(e))
          .toList(),
    );
  }
}

class ScheduleDate {
  final int id;
  final String date;
  final String day;
  final String month;
  final String formatted;

  ScheduleDate({
    required this.id,
    required this.date,
    required this.day,
    required this.month,
    required this.formatted,
  });

  factory ScheduleDate.fromJson(Map<String, dynamic> json) {
    return ScheduleDate(
      id: json['id'] ?? 0,
      date: json['date'] ?? '',
      day: json['day'] ?? '',
      month: json['month'] ?? '',
      formatted: json['formatted'] ?? '',
    );
  }
}

class TodayBooking {
  final int bookingId;
  final String bookingReference;
  final String scheduledDate;
  final String preferredTime;
  final String totalAmount;
  final String currency;
  final String bookingType;
  final CustomerDetails customerDetails;
  final ServiceDetails serviceDetails;

  TodayBooking({
    required this.bookingId,
    required this.bookingReference,
    required this.scheduledDate,
    required this.preferredTime,
    required this.totalAmount,
    required this.currency,
    required this.bookingType,
    required this.customerDetails,
    required this.serviceDetails,
  });

  factory TodayBooking.fromJson(Map<String, dynamic> json) {
    return TodayBooking(
      bookingId: json['booking_id'] ?? 0,
      bookingReference: json['booking_reference'] ?? '',
      scheduledDate: json['scheduled_date'] ?? '',
      preferredTime: json['preferred_time'] ?? '',
      totalAmount: json['total_amount'] ?? '',
      currency: json['currency'] ?? '',
      bookingType: json['booking_type'] ?? '',
      customerDetails: CustomerDetails.fromJson(json['customer_details']),
      serviceDetails: ServiceDetails.fromJson(json['service_details']),
    );
  }
}

class CustomerDetails {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final List<CustomerAddress> addresses;

  CustomerDetails({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.addresses,
  });

  factory CustomerDetails.fromJson(Map<String, dynamic> json) {
    return CustomerDetails(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      image: json['image'] ?? '',
      addresses: (json['addresses'] as List)
          .map((e) => CustomerAddress.fromJson(e))
          .toList(),
    );
  }
}

class CustomerAddress {
  final int id;
  final int userId;
  final String contactDetails;
  final String addressDetails;
  final String type;
  final bool isDefault;

  CustomerAddress({
    required this.id,
    required this.userId,
    required this.contactDetails,
    required this.addressDetails,
    required this.type,
    required this.isDefault,
  });

  factory CustomerAddress.fromJson(Map<String, dynamic> json) {
    return CustomerAddress(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      contactDetails: json['contact_details'] ?? '',
      addressDetails: json['address_details'] ?? '',
      type: json['type'] ?? '',
      isDefault: json['is_default'] ?? false,
    );
  }
}


class ServiceDetails {
  final int id;
  final String name;
  final String description;
  final String image;
  final String? priceOnetime;
  final String? priceWeekly;
  final String? priceMonthly;
  final String? priceYearly;

  ServiceDetails({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    this.priceOnetime,
    this.priceWeekly,
    this.priceMonthly,
    this.priceYearly,
  });

  factory ServiceDetails.fromJson(Map<String, dynamic> json) {
    return ServiceDetails(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      priceOnetime: json['price_onetime'],
      priceWeekly: json['price_weekly'],
      priceMonthly: json['price_monthly'],
      priceYearly: json['price_yearly'],
    );
  }
}