class PunchInDetailModel {
  bool? success;
  int? statusCode;
  String? message;
  PunchInData? data;

  PunchInDetailModel({this.success, this.statusCode, this.message, this.data});

  factory PunchInDetailModel.fromJson(Map<String, dynamic> json) {
    return PunchInDetailModel(
      success: json['success'],
      statusCode: json['status_code'],
      message: json['message'],
      data: json['data'] != null ? PunchInData.fromJson(json['data']) : null,
    );
  }
}

class PunchInData {
  int? bookingId;
  String? bookingReference;
  String? scheduledDate;
  String? preferredTime;
  String? status;
  String? totalAmount;
  String? currency;
  String? bookingType;
  String? customerNotes;

  UserDetails? userDetails;
  ServiceDetails? serviceDetails;
  DefaultAddress? defaultAddress;

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
      userDetails: UserDetails.fromJson(json["user_details"]),
      serviceDetails: ServiceDetails.fromJson(json["service_details"]),
      defaultAddress: DefaultAddress.fromJson(json["default_address"]),
    );
  }
}

class UserDetails {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;

  UserDetails({this.id, this.name, this.email, this.phone, this.image});

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      image: json["image"],
    );
  }
}

class ServiceDetails {
  int? id;
  String? name;
  String? description;
  String? image;

  ServiceDetails({this.id, this.name, this.description, this.image});

  factory ServiceDetails.fromJson(Map<String, dynamic> json) {
    return ServiceDetails(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      image: json["image"],
    );
  }
}

class DefaultAddress {
  int? id;
  String? addressDetails;

  DefaultAddress({this.id, this.addressDetails});

  factory DefaultAddress.fromJson(Map<String, dynamic> json) {
    return DefaultAddress(
      id: json["id"],
      addressDetails: json["address_details"],
    );
  }
}
