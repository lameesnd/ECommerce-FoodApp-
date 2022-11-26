import 'package:get/get.dart';
// import 'package:ecomm_food_app/data/repository/recommended_product_repo.dart';
import 'package:ecomm_food_app/models/products_model.dart';

import '../data/repository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList = []; //private

  List<dynamic> get recommendedProductList =>
      _recommendedProductList; // can be called from ui

  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      // print("get popular");
      _recommendedProductList = []; //re-initialize not to have repeated data
      _recommendedProductList.addAll(ProductModel.fromJson(response.body).products);
      _isLoaded = true;
      //print(_popularProductList);
      update(); //like setState to update the ui
    } else {}
  }
}
