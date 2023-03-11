import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/controllers/shopping.dart';

import '../controllers/cart.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var shoppingController = Get.put(ShoppingController());
    var cartController = Get.put(CartController());

    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: shoppingController.products.length,
                  itemBuilder: (_, index) {
                    return Card(
                      margin: const EdgeInsets.all(5.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      shoppingController.products[index].name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      shoppingController
                                          .products[index].description,
                                    ),
                                  ],
                                ),
                                Text(
                                  "\$${shoppingController.products[index].price}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            FilledButton(
                              onPressed: () {
                                cartController.addToCart(
                                  shoppingController.products[index],
                                );
                              },
                              child: const Text("Add to Cart"),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => Text(
                "Total: \$${cartController.totalPrice}",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.shopping_bag_outlined),
        onPressed: () {},
        label: GetX<CartController>(builder: (controller) {
          return Text('${controller.cartItems.length}');
        }),
      ),
    );
  }
}
