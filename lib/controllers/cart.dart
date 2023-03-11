import 'package:get/get.dart';

import '../models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  void addToCart(Product product) {
    cartItems.add(product);
  }

  get totalPrice => cartItems.fold(0.0, (sum, item) => sum + item.price);
}
