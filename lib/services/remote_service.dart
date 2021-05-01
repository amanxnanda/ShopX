import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shopx/api/api_response.dart';
import 'package:shopx/controller/product_controller.dart';

class RemoteServices {
  final productController = Get.find<ProductController>();

  static http.Client client = http.Client();

  static Future<ApiResponse> fetchProducts() async {
    try {
      http.Response response = await client.get(
        Uri.parse(
          'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline',
        ),
      );

      if (response.statusCode == 200) {
        return ApiResponse(data: response.body);
      } else {
        return ApiResponse(
            error: true, errorMessage: response.statusCode.toString());
      }
    } on SocketException {
      return ApiResponse(error: true, errorMessage: 'no internet connection');
    } catch (e) {
      print(e.toString());
      return ApiResponse(error: true, errorMessage: e.toString());
    }
  }
}
