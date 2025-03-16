import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/core/extentions/localization_extention.dart';
import 'package:crafty_bay/features/auth/ui/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = TextTheme.of(context);
    // final appLocalization = AppLocalizations.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 80),
              AppLogo(),
              const SizedBox(
                height: 8,
              ),
              Text(
                context.localization.welcomeBack,
                style: textTheme.bodyLarge,
              ),
              Text(
                context.localization.yourEmailAndPassword,
                style: textTheme.bodySmall,
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                controller: _emailTEController,
                decoration: InputDecoration(
                    hintText: context.localization.email,
                    hintStyle: textTheme.bodySmall),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _passwordTEController,
                decoration: InputDecoration(
                    hintText: context.localization.password,
                    hintStyle: textTheme.bodySmall),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {
                  // throw Exception('My custom error');
                },
                child: Text(context.localization.signIn),
              ),
              const SizedBox(
                height: 16,
              ),
              RichText(
                text: TextSpan(
                    text: "${context.localization.doNotHaveAnAccount}? ",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.grey),
                    children: [
                      TextSpan(
                        text: context.localization.signUp,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.themeColor),
                        recognizer: TapGestureRecognizer()..onTap = _onTapSignUpButton
                      ),
                    ],
                   ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
