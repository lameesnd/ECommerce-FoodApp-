import 'package:ecomm_food_app/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = []; //private

  List<dynamic> get popularProductList => _popularProductList; // can be called from ui

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = []; //re-initialize not to have repeated data
      // _popularProductList.addAll(); // we should create a model before
      update(); //like setState to update the ui
    } else {}
  }
}
