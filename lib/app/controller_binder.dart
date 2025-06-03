import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:crafty_bay/features/auth/ui/controllers/auth_controller.dart';
import 'package:crafty_bay/features/auth/ui/controllers/sign_in_controller.dart';
import 'package:crafty_bay/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:crafty_bay/features/auth/ui/controllers/sign_up_otp_controller.dart';
import 'package:crafty_bay/features/common/controller/category_controller.dart';
import 'package:crafty_bay/features/common/controller/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay/features/common/controller/slider_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(NetworkCaller());
    Get.put(MainBottomNavBarController());
    Get.put(CategoryController());
    Get.put(HomeSliderController());
    Get.put(SignUpController());
    Get.put(SignUpOtpController());
    Get.put(SignInController());
    Get.put(CategoryController());
  }

}