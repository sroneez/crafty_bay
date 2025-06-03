import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/products/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductListScreen.name,
            arguments: 'Electronics');
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 70,
              width: 70,
              child: FittedBox(
                child: Icon(
                  Icons.computer,
                  color: AppColors.themeColor,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'computer',
              style: TextStyle(color: AppColors.themeColor, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
