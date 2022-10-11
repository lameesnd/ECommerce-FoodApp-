import 'package:ecomm_food_app/pages/food/popular_food_detail.dart';
import 'package:ecomm_food_app/widgets/recommended_food_detail.dart';
import 'package:flutter/material.dart';
import 'package:ecomm_food_app/pages/home/main_food_page.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RecommendedFoodDetail(),
    );
  }
}
