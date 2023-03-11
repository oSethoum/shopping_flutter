import 'package:get/get.dart';
import '../models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    _fetchProducts();
  }

  void _fetchProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    var productsResult = [
      Product(
        id: 1,
        name: "Product One",
        image: "abc",
        description: "Product One description",
        price: 12,
      ),
      Product(
        id: 2,
        name: "Product Two",
        description: "Product Two description",
        image: "abc",
        price: 12,
      ),
    ];

    products.value = productsResult;
  }
}
