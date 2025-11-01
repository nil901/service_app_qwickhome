import 'package:dio/dio.dart';
import 'package:service_app_qwickhome/Models/homeModel.dart';

class HomeService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://admin.qwikhom.ae/api", // 👈 Only base URL rakho
      connectTimeout: Duration(seconds: 15),
      receiveTimeout: Duration(seconds: 15),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        // "Authorization": "Bearer YOUR_TOKEN_HERE", // Agar token ho to add karo
      },
    ),
  );

  Future<homeModel?> getHomeData() async {
    try {
      final response = await _dio.get("/ServiceProviderMyBookings"); // 👈 yaha endpoint do

      if (response.statusCode == 200) {
        return homeModel.fromJson(response.data);
      } else {
        print("❌ Home API Failed: ${response.statusCode}");
        return null;
      }
    } on DioException catch (e) {
      print("⚠️ Dio Error: ${e.message}");
      return null;
    } catch (e) {
      print("⚠️ Unknown Error: $e");
      return null;
    }
  }
}
