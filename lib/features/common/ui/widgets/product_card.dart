import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/assets_path.dart';
import 'package:crafty_bay/features/products/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailsScreen.name);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        height: 210,
        width: 150,
        color: AppColors.themeColor.withOpacity(.2),
        child: Column(children: [
          Container(
            height: 140,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              image: DecorationImage(
                  image: AssetImage(AssetsPath.shoePng),
                  fit: BoxFit.scaleDown),
            ),
          ),
          Text(
            'Nike mk47 sports edition limited shoe',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$100',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: AppColors.themeColor),
              ),
              Wrap(
                children: [
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Text(
                    '3.3',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Card(
                color: AppColors.themeColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                child: Icon(
                  Icons.favorite,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}