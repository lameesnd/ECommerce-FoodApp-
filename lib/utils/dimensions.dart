import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.63; //height/320
  static double pageViewContainer = screenHeight / 3.83; //height/220 = 844/220
  static double textViewContainer = screenHeight / 7.03; //height/120

  //dynamic height - padding and margin
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.2;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenWidth / 28.13;
  static double height45 = screenHeight / 18.75;

  //dynamic width - padding and margin
  static double width10 = screenWidth / 84.4;
  static double width15 = screenWidth / 56.2;
  static double width20 = screenWidth / 42.2;
  static double width30 = screenWidth / 28.13;
  static double width45 = screenWidth / 18.75;

  //font
  static double font12 = screenHeight / 70.3;
  static double font16 = screenHeight / 52.75;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;

  //radius
  static double radius15 = screenHeight / 56.2;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

//icon size
  static double iconSize24 = screenHeight / 35.16;
  static double iconSize16 = screenHeight / 52.75;

//list view size
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContSize = screenWidth / 3.9;

  //popular food
  static double popularFoodImgSize = screenHeight / 3.41;

  //bottom height
  static double bottomHeightBar = screenHeight / 7.03;
}
