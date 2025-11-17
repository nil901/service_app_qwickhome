import 'dart:io';
import 'package:dio/dio.dart';



class ProfileChangeResponse {
  final bool success;
  final int statusCode;
  final String message;

  ProfileChangeResponse({
    required this.success,
    required this.statusCode,
    required this.message,
  });

  factory ProfileChangeResponse.fromJson(Map<String, dynamic> json) {
    return ProfileChangeResponse(
      success: json["success"] ?? false,
      statusCode: json["status_code"] ?? 0,
      message: json["message"] ?? "",
    );
  }
}

class ProfileChangeRequestModel {
  final String serviceProviderId;
  final String reason;
  final String name;
  final String email;
  final String phone;
  final String alternatePhone;
  final String biography;
  final String address;
  final File? profileImage;

  ProfileChangeRequestModel({
    required this.serviceProviderId,
    required this.reason,
    required this.name,
    required this.email,
    required this.phone,
    required this.alternatePhone,
    required this.biography,
    required this.address,
    this.profileImage,
  });

  /// Convert Request → FormData
  Future<FormData> toFormData() async {
    return FormData.fromMap({
      "serviceProviderId": serviceProviderId,
      "reason": reason,
      "name": name,
      "email": email,
      "phone": phone,
      "alternatePhone": alternatePhone,
      "biography": biography,
      "address": address,

      if (profileImage != null)
        "profileImage": await MultipartFile.fromFile(
          profileImage!.path,
          filename: "profile.jpg",
        ),
    });
  }
}
