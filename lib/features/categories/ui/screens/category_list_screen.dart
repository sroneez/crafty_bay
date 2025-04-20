import 'package:crafty_bay/features/common/controller/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay/features/common/ui/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  static const String name = '/category-list-screen';

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<MainBottomNavBarController>().moveToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavBarController>().moveToHome();
            },

            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text('Categories'),
        ),
        body: GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 16, crossAxisSpacing: 8),
            itemBuilder: (index, context) {
              return CategoryItem(
                  categoryIcon: Icon(Icons.computer), iconName: 'computer');
            }),
      ),
    );
  }
}
