import 'package:get/get.dart';
import '../data/api/api_client.dart';
import '../controllers/popular_product_controller.dart';
import '../data/repository/popular_product_repo.dart';


Future<void> init() async {
  //call Api client
  Get.lazyPut(() => ApiClient(appBaseUrl: 'https://www.example.com'));

  //repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}