import 'package:crafty_bay/features/auth/ui/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes{
  static Route<dynamic>?  onGenerateRoute(RouteSettings settings){
    late Widget route;
    if(settings.name == SplashScreen.name){
      route = SplashScreen();
    }else if(settings.name == SignInScreen.name){
      route = SignInScreen();
    }
    return MaterialPageRoute(builder: (context){
      return route;
    });
  }
}