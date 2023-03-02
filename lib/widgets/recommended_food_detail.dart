import 'package:ecomm_food_app/controllers/popular_product_controller.dart';
import 'package:ecomm_food_app/controllers/recommended_product_controller.dart';
import 'package:ecomm_food_app/utils/colors.dart';
import 'package:ecomm_food_app/utils/dimensions.dart';
import 'package:ecomm_food_app/widgets/app_icon.dart';
import 'package:ecomm_food_app/widgets/big_text.dart';
import 'package:ecomm_food_app/widgets/small_text.dart';
import 'package:ecomm_food_app/widgets/expandable_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/cart_controller.dart';
import '../pages/cart/cart_page.dart';
import '../routes/route_helper.dart';
import '../utils/app_constants.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;

  const RecommendedFoodDetail({Key? key, required this.pageId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];

    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              // hide back button
              toolbarHeight: 70,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (() => Get.toNamed(RouteHelper.getInitial())),
                      child: AppIcon(icon: Icons.clear)),
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => CartPage());
                          },
                          child: AppIcon(
                            icon: Icons.shopping_cart_outlined,
                          ),
                        ),
                        Get.find<PopularProductController>().totalItems >= 1
                            ? Positioned(
                                right: 0,
                                top: 0,
                                child: AppIcon(
                                  icon: Icons.circle,
                                  size: 20,
                                  iconColor: Colors.transparent,
                                  backgroundColor: AppColors.mainColor,
                                ),
                              )
                            : Container(),
                        Get.find<PopularProductController>().totalItems >= 1
                            ? Positioned(
                                right: 5,
                                top: 3,
                                child: SmallText(
                                  text: Get.find<PopularProductController>()
                                      .totalItems
                                      .toString(),
                                  size: 12,
                                  color: Colors.white,
                                ),
                              )
                            : Container()
                      ],
                    );
                  })
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(30),
                //space between the bottom and upper part
                child: Container(
                  child: Center(
                      child: BigText(
                    text: product.name!,
                    size: Dimensions.font26,
                  )),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius20),
                          topRight: Radius.circular(Dimensions.radius20))),
                ),
              ),
              pinned: true,
              // when it's scrolled it keeps a space, doesn't overflow 3a kil l page (fixed)
              backgroundColor: AppColors.yellowColor,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  AppConstants.BASE_URL +
                      AppConstants.UPLOADS_URI +
                      product.img!,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.width20, right: Dimensions.width20),
                    child: ExpandableTextWidget(
                      text: product.description!,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (controller) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: Dimensions.width20 * 2.5,
                    right: Dimensions.width20 * 2.5,
                    top: Dimensions.height10,
                    bottom: Dimensions.height10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.setQuantity(false);
                        },
                        child: AppIcon(
                          icon: Icons.remove,
                          backgroundColor: AppColors.mainColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.iconSize24,
                        ),
                      ),
                      BigText(
                        text:
                            "\$${product.price!} X  ${controller.inCartItems}",
                        color: AppColors.mainBlackColor,
                        size: Dimensions.font26,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.setQuantity(true);
                        },
                        child: AppIcon(
                          icon: Icons.add,
                          backgroundColor: AppColors.mainColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.iconSize24,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: Dimensions.bottomHeightBar,
                  padding: EdgeInsets.only(
                      top: Dimensions.height30,
                      bottom: Dimensions.height30,
                      left: Dimensions.width30,
                      right: Dimensions.width30),
                  decoration: BoxDecoration(
                      color: AppColors.buttonBackgroundColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius20 * 2),
                          topRight: Radius.circular(Dimensions.radius20 * 2))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //quantity
                      Container(
                        padding: EdgeInsets.only(
                            top: Dimensions.height20,
                            bottom: Dimensions.height20,
                            left: Dimensions.width30,
                            right: Dimensions.width30),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            color: Colors.white),
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.mainColor,
                        ),
                      ),
                      //add to cart
                      GestureDetector(
                        onTap: () {
                          controller.addItem(product);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              top: Dimensions.height20,
                              bottom: Dimensions.height20,
                              left: Dimensions.width20,
                              right: Dimensions.width20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                              color: AppColors.mainColor),
                          child: BigText(
                            text: "\$ ${product.price!} | Add to cart",
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
