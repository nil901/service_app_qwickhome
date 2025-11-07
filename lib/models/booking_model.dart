class MyBooking {
  bool? success;
  int? statusCode;
  String? message;
  List<Data>? data;

  MyBooking({this.success, this.statusCode, this.message, this.data});

  MyBooking.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['status_code'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? bookingId;
  String? bookingReference;
  String? scheduledDate;
  String? preferredTime;
  String? totalPrice;
  String? currency;
  String? status;
  String? bookingType;
  dynamic customerNotes;
  UserDetails? userDetails;
  ServiceDetails? serviceDetails;
  DefaultAddress? defaultAddress;

  Data({
    this.bookingId,
    this.bookingReference,
    this.scheduledDate,
    this.preferredTime,
    this.totalPrice,
    this.currency,
    this.status,
    this.bookingType,
    this.customerNotes,
    this.userDetails,
    this.serviceDetails,
    this.defaultAddress,
  });

  Data.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    bookingReference = json['booking_reference'];
    scheduledDate = json['scheduled_date'];
    preferredTime = json['preferred_time'];
    totalPrice = json['total_price'];
    currency = json['currency'];
    status = json['status'];
    bookingType = json['booking_type'];
    customerNotes = json['customer_notes'];
    userDetails = json['user_details'] != null
        ? UserDetails.fromJson(json['user_details'])
        : null;
    serviceDetails = json['service_details'] != null
        ? ServiceDetails.fromJson(json['service_details'])
        : null;
    defaultAddress = json['default_address'] != null
        ? DefaultAddress.fromJson(json['default_address'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['booking_id'] = bookingId;
    data['booking_reference'] = bookingReference;
    data['scheduled_date'] = scheduledDate;
    data['preferred_time'] = preferredTime;
    data['total_price'] = totalPrice;
    data['currency'] = currency;
    data['status'] = status;
    data['booking_type'] = bookingType;
    data['customer_notes'] = customerNotes;
    if (userDetails != null) {
      data['user_details'] = userDetails!.toJson();
    }
    if (serviceDetails != null) {
      data['service_details'] = serviceDetails!.toJson();
    }
    if (defaultAddress != null) {
      data['default_address'] = defaultAddress!.toJson();
    }
    return data;
  }
}

class UserDetails {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;

  UserDetails({this.id, this.name, this.email, this.phone, this.image});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    return data;
  }
}

class ServiceDetails {
  int? id;
  String? name;
  String? description;
  String? image;
  dynamic priceOnetime;
  dynamic priceWeekly;
  dynamic priceMonthly;
  dynamic priceYearly;

  ServiceDetails({
    this.id,
    this.name,
    this.description,
    this.image,
    this.priceOnetime,
    this.priceWeekly,
    this.priceMonthly,
    this.priceYearly,
  });

  ServiceDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    priceOnetime = json['price_onetime'];
    priceWeekly = json['price_weekly'];
    priceMonthly = json['price_monthly'];
    priceYearly = json['price_yearly'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['price_onetime'] = priceOnetime;
    data['price_weekly'] = priceWeekly;
    data['price_monthly'] = priceMonthly;
    data['price_yearly'] = priceYearly;
    return data;
  }
}

class DefaultAddress {
  int? id;
  String? fullAddress;
  String? contactName;
  String? contactPhone;
  String? addressDetails;

  DefaultAddress({
    this.id,
    this.fullAddress,
    this.contactName,
    this.contactPhone,
    this.addressDetails,
  });

  DefaultAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullAddress = json['full_address'];
    contactName = json['contact_name'];
    contactPhone = json['contact_phone'];
    addressDetails = json['address_details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['full_address'] = fullAddress;
    data['contact_name'] = contactName;
    data['contact_phone'] = contactPhone;
    data['address_details'] = addressDetails;
    return data;
  }
}
