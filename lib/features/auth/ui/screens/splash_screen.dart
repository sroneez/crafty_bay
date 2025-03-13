import 'package:crafty_bay/app/app_config.dart';
import 'package:crafty_bay/app/assets_path.dart';
import 'package:crafty_bay/features/auth/ui/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name ='/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }
  
  Future<void> _moveToNextScreen()async{
     await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, SignInScreen.name);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              SvgPicture.asset(AssetsPath.logoSvg, width: 120,),
              Spacer(),
              CircularProgressIndicator(),
              const SizedBox(height:8),
              Text('${AppLocalizations.of(context)!.version} ${AppConfig.currentAppVersion}'),
              
            ],
          ),
        ),
      ),
    );
  }
  
}
