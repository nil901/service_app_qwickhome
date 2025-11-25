class PunchInDetailModel {
  final bool success;
  final int statusCode;
  final String message;
  final PunchInData? data;

  PunchInDetailModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory PunchInDetailModel.fromJson(Map<String, dynamic> json) {
    return PunchInDetailModel(
      success: json['success'] ?? false,
      statusCode: json['status_code'] ?? 0,
      message: json['message'] ?? "",
      data: json['data'] != null ? PunchInData.fromJson(json['data']) : null,
    );
  }
}
class PunchInData {
  final int? bookingId;
  final String? bookingReference;
  final String? scheduledDate;
  final String? preferredTime;
  final String? status;
  final String? totalAmount;
  final String? currency;
  final String? bookingType;
  final String? customerNotes;

  final UserDetails? userDetails;
  final ServiceDetails? serviceDetails;
  final DefaultAddress? defaultAddress;

  PunchInData({
    this.bookingId,
    this.bookingReference,
    this.scheduledDate,
    this.preferredTime,
    this.status,
    this.totalAmount,
    this.currency,
    this.bookingType,
    this.customerNotes,
    this.userDetails,
    this.serviceDetails,
    this.defaultAddress,
  });

  factory PunchInData.fromJson(Map<String, dynamic> json) {
    return PunchInData(
      bookingId: json["booking_id"],
      bookingReference: json["booking_reference"],
      scheduledDate: json["scheduled_date"],
      preferredTime: json["preferred_time"],
      status: json["status"],
      totalAmount: json["total_amount"],
      currency: json["currency"],
      bookingType: json["booking_type"],
      customerNotes: json["customer_notes"],

      userDetails: json["user_details"] != null
          ? UserDetails.fromJson(json["user_details"])
          : null,

      serviceDetails: json["service_details"] != null
          ? ServiceDetails.fromJson(json["service_details"])
          : null,

      defaultAddress: json["default_address"] != null
          ? DefaultAddress.fromJson(json["default_address"])
          : null,
    );
  }
}
class UserDetails {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? image;

  UserDetails({this.id, this.name, this.email, this.phone, this.image});

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      id: json["id"],
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      phone: json["phone"] ?? "",
      image: json["image"] ?? "",
    );
  }
}
class ServiceDetails {
  final int? id;
  final String? name;
  final String? description;
  final String? image;

  ServiceDetails({this.id, this.name, this.description, this.image});

  factory ServiceDetails.fromJson(Map<String, dynamic> json) {
    return ServiceDetails(
      id: json["id"],
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      image: json["image"] ?? "",
    );
  }
}
class DefaultAddress {
  final int? id;
  final int? userId;
  final String? contactDetails;
  final String? addressDetails;
  final String? type;
  final bool? isDefault;
  final String? createdAt;
  final String? updatedAt;

  DefaultAddress({
    this.id,
    this.userId,
    this.contactDetails,
    this.addressDetails,
    this.type,
    this.isDefault,
    this.createdAt,
    this.updatedAt,
  });

  factory DefaultAddress.fromJson(Map<String, dynamic> json) {
    return DefaultAddress(
      id: json["id"],
      userId: json["user_id"],
      contactDetails: json["contact_details"],
      addressDetails: json["address_details"],
      type: json["type"],
      isDefault: json["is_default"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }
}
