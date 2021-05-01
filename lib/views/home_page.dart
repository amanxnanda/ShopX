import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shopx/controller/product_controller.dart';
import 'package:shopx/views/product_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(
            Icons.shopping_cart_rounded,
            color: Colors.black,
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Spacer(flex: 1),
              const Text(
                'ShopX',
                style: TextStyle(fontSize: 50),
              ),
              Spacer(flex: 3),
              const Icon(
                Icons.person,
                color: Colors.black,
                size: 50,
              ),
              const Icon(
                Icons.filter_alt_outlined,
                color: Colors.black,
                size: 50,
              ),
            ],
          ),
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              return StaggeredGridView.countBuilder(
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 2,
                itemCount: productController.productList.length,
                itemBuilder: (c, i) {
                  return ProductTile(
                    product: productController.productList[i],
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              );
            }),
          ),
        ],
      ),
    );
  }
}
