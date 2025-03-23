import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categoryIcon,
    required this.iconName,
  });

  final Icon categoryIcon;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.symmetric(horizontal: 12),
          // height: 130,
          // width: 100,
          elevation: 0,
          child: categoryIcon,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          iconName,
          style: TextStyle(color: AppColors.themeColor, fontSize: 16),
        ),
      ],
    );
  }
}