import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: ThemeData(
        colorSchemeSeed: AppColors.themeColor,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          bodySmall: TextStyle(fontSize: 16, color: Colors.grey),
        ),
          inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.themeColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.themeColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.themeColor),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.themeColor),
      ),
    ),
        elevatedButtonTheme:ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              fixedSize: Size.fromWidth(double.maxFinite),
              backgroundColor: AppColors.themeColor,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white
        )
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale('en'),
      supportedLocales: [
        Locale('en'), // English
        Locale('bn'), // bengali
      ],
    );
  }
}
