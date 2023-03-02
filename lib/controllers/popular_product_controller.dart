import 'package:ecomm_food_app/data/repository/popular_product_repo.dart';
import 'package:ecomm_food_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecomm_food_app/models/products_model.dart';

import '../models/cart_model.dart';
import 'cart_controller.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = []; //private

  List<dynamic> get popularProductList =>
      _popularProductList; // can be called from ui

  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  int _quantity = 0;

  int get quantity => _quantity;

  int _inCartItems = 0;

  int get inCartItems => _inCartItems + _quantity;

  late CartController _cart;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = []; //re-initialize not to have repeated data
      _popularProductList.addAll(ProductModel.fromJson(response.body).products);
      _isLoaded = true;
      update(); //like setState to update the ui
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar('item count', "You reached the minimum amount",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      if(_inCartItems>0){
        _quantity=-_inCartItems;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar('item count', "You reached the maximum amount");
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(Products product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exists = false;
    exists = cart.existInCart(product);
    //check if exists items then add to global storage counter
    if (exists) {
      _inCartItems = _cart.getQuantity(product);
    }
    print('quantity in the cart is: ' + _inCartItems.toString());
  }

  void addItem(Products product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      print('key: ' +
          value.id.toString() +
          ' quantity' +
          value.quantity.toString());
    });
    update();
  }

  int get totalItems{
    return _cart.totalItems;
  }

  List<CartModel> get getItems{
    return _cart.getItems;
  }
}
