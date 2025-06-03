import 'package:crafty_bay/core/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/common/controller/category_controller.dart';
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
  final CategoryController _categoryController = Get.find<CategoryController>();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _categoryController.initialLoad();
    super.initState();
  }

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
        body: GetBuilder<CategoryController>(
            builder: (controller) {
              if (controller.isInitialLoading){
              return CenteredCircularProgressIndicator();
              }
              return Visibility(
                visible: controller.isInitialLoading==false,
                child: GridView.builder(
                controller: _scrollController,
                itemCount: _categoryController.categoryList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 16, crossAxisSpacing: 8)
                ,
                itemBuilder: (index, context) {
                return FittedBox(child: CategoryItem(),);
                }),
              );
            }
        ),
      ),
    );
  }
}
