import 'package:crafty_bay/app/assets_path.dart';
import 'package:crafty_bay/features/common/controller/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay/features/home/ui/widgets/app_bar_action_button.dart';
import 'package:crafty_bay/features/common/ui/widgets/category_item.dart';
import 'package:crafty_bay/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:crafty_bay/features/home/ui/widgets/product_card.dart';
import 'package:crafty_bay/features/home/ui/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildSearchTextField(),
              const SizedBox(
                height: 24,
              ),
              HomeCarouselSlider(),
              const SizedBox(
                height: 16,
              ),
              SectionHeader(
                title: 'Categories',
                onTap: () {
                  Get.find<MainBottomNavBarController>().moveToCategory();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              _buildCategorySection(),
              const SizedBox(
                height: 16,
              ),
              SectionHeader(
                title: 'Popular',
                onTap: () {},
              ),
              const SizedBox(
                height: 16,
              ),
              _buildProductSection(),
              const SizedBox(
                height: 24,
              ),
              SectionHeader(
                title: 'New',
                onTap: () {},
              ),
              const SizedBox(
                height: 16,
              ),
              _buildProductSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ProductCard(),
          ProductCard(),
          ProductCard(),
          ProductCard(),
          ProductCard(),
          ProductCard(),
        ],
      ),
    );
  }

  Widget _buildCategorySection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryItem(
            categoryIcon: Icon(
              Icons.computer,
            ),
            iconName: 'Computer',
          ),
          CategoryItem(
            categoryIcon: Icon(
              Icons.computer,
            ),
            iconName: 'Computer',
          ),
          CategoryItem(
            categoryIcon: Icon(
              Icons.computer,
            ),
            iconName: 'Computer',
          ),
          CategoryItem(
            categoryIcon: Icon(
              Icons.computer,
            ),
            iconName: 'Computer',
          ),
          CategoryItem(
            categoryIcon: Icon(
              Icons.computer,
            ),
            iconName: 'Computer',
          ),
          CategoryItem(
            categoryIcon: Icon(
              Icons.computer,
            ),
            iconName: 'Computer',
          ),
        ],
      ),
    );
  }

  Widget _buildSearchTextField() {
    return TextField(
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        hintText: 'Search',
        hintStyle: TextStyle(fontSize: 14),
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.logoNavSvg),
      actions: [
        AppBarActionButton(
          onTap: () {},
          icon: Icons.person,
        ),
        AppBarActionButton(
          onTap: () {},
          icon: Icons.call,
        ),
        AppBarActionButton(
          onTap: () {},
          icon: Icons.notifications,
        ),
      ],
    );
  }
}
