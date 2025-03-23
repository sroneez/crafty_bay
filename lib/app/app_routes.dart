import 'package:crafty_bay/features/auth/ui/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/splash_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:crafty_bay/features/common/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes{
  static Route<dynamic>?  onGenerateRoute(RouteSettings settings){
    late Widget route;
    if(settings.name == SplashScreen.name){
      route = SplashScreen();
    }else if(settings.name == SignInScreen.name){
      route = SignInScreen();
    }else if(settings.name == SignUpScreen.name){
      route = const SignUpScreen();
    }else if(settings.name == VerifyOtpScreen.name){
      route = const VerifyOtpScreen();
    }else if(settings.name == MainBottomNavBarScreen.name){
      route = const MainBottomNavBarScreen();
    }
    return MaterialPageRoute(builder: (context){
      return route;
    });
  }
}