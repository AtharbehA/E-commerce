import 'package:elibrary/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/product_details/clothes_info.dart';
import '../widgets/product_details/image_sliders.dart';

class ProductDetailsScreen extends StatelessWidget {

  final Welcome productModels;
  const ProductDetailsScreen({
    Key? key,
    required this.productModels})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(
                imageUrl: productModels.image,
              ),
              ClothesInfo(
                title: productModels.title,
                productID: productModels.id,
                rate: productModels.rating.rate,
                description: productModels.description,
                productModels: productModels,
              ),
              // SizeList(),
              // AddCart(),
            ],
          ),
        ),
      ),
    );
  }
}
