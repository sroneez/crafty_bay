import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/core/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/common/controller/slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({
    super.key,
  });

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  int _selectedSlider = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeSliderController>(builder: (controller) {
      return Visibility(
        visible: controller.getSliderInProgress == false,
        replacement: const SizedBox(
          height: 200,
          child: CenteredCircularProgressIndicator(),
        ),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  autoPlay: true,
                  height: 200.0,
                  viewportFraction: .95,
                  onPageChanged: (index, reason) {
                    _selectedSlider = index;
                    setState(() {});
                  }),
              items: controller.sliders.map((slider) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        image: DecorationImage(
                          image: NetworkImage(slider.photo_url),
                          fit: BoxFit.cover
                        ),
                      ),
                      child: Text(
                        slider.description,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < controller.sliders.length; i++)
                  Container(
                    margin: EdgeInsets.only(left: 4),
                    child: CircleAvatar(
                      radius: 6,
                      foregroundColor: Colors.blue,
                      backgroundColor:
                          _selectedSlider == i ? AppColors.themeColor : null,
                    ),
                  ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
