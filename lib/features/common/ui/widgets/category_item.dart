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
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 70,
            width: 70,
            child: FittedBox(
              child: Icon(
                categoryIcon.icon,
                color: AppColors.themeColor,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            iconName,
            style: TextStyle(color: AppColors.themeColor, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
