import 'package:ecomm_food_app/controllers/popular_product_controller.dart';
import 'package:ecomm_food_app/pages/food/popular_food_detail.dart';
import 'package:ecomm_food_app/routes/route_helper.dart';
import 'package:ecomm_food_app/widgets/recommended_food_detail.dart';
import 'package:flutter/material.dart';
import 'package:ecomm_food_app/pages/home/main_food_page.dart';
import 'package:get/get.dart';

import '/helper/dependencies.dart' as dep;
import 'controllers/recommended_product_controller.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // ensure that dependencies are loaded correctly
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MainFoodPage(),
      initialRoute: RouteHelper.getInitial(),
      getPages: RouteHelper.routes,
    );
  }
}
