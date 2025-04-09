import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/products/widget/increment_decrement_counter_widget.dart';
import 'package:crafty_bay/features/products/widget/product_image_carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  static const String name = '/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                ProductImageCarouselSlider(),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nike 320 2025 New Edition',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          IncrementDecrementCounterWidget(
                            onChange: (int value) {
                              print(value);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.themeColor.withAlpha(40),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Price',style: TextStyle(fontSize: 18),),
                    Text(
                      '\$1000',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.themeColor
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Add to Cart'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
