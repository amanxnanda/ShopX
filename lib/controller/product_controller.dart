import 'package:get/get.dart';
import 'package:shopx/api/api_response.dart';
import 'package:shopx/models/product_model.dart';
import 'package:shopx/services/remote_service.dart';

class ProductController extends GetxController {
  var productList = List<Product>().obs;

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    isLoading(true);
    ApiResponse apiResponse = await RemoteServices.fetchProducts();

    if (!apiResponse.error) {
      productList.value = productFromJson(apiResponse.data);
      isLoading(false);
    } else {
      Get.snackbar('Error', apiResponse.errorMessage);
    }
  }
}
