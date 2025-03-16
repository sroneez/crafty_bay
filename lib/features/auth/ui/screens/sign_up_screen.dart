import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/core/extentions/localization_extention.dart';
import 'package:crafty_bay/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:crafty_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _deliveryAddressTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = TextTheme.of(context);
    // final appLocalization = AppLocalizations.of(context);
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  AppLogo(),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    context.localization.registerYourAccount,
                    style: textTheme.bodyLarge,
                  ),
                  Text(
                    context.localization.getStartedWithYourDetails,
                    style: textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  TextFormField(
                    controller: _emailTEController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: context.localization.email,
                        hintStyle: textTheme.bodySmall
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _passwordTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: context.localization.password,
                        hintStyle: textTheme.bodySmall
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _firstNameTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: context.localization.firstName,
                        hintStyle: textTheme.bodySmall
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: _lastNameTEController,
                    decoration: InputDecoration(
                        hintText: context.localization.lastName,
                        hintStyle: textTheme.bodySmall
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: _phoneTEController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: context.localization.phone,
                        hintStyle: textTheme.bodySmall
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _deliveryAddressTEController,
                    maxLines: 3,
                    decoration: InputDecoration(
                        hintText: context.localization.deliveryAddress,
                        hintStyle: textTheme.bodySmall,
                      contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                    ),
                  ),

                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // throw Exception('My custom error');
                      Navigator.pushNamed(context, VerifyOtpScreen.name);
                    },
                    child: Text(context.localization.signUp),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "${context.localization.haveAnAccount}? ",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.grey),
                      children: [
                        TextSpan(
                            text: context.localization.signIn,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.themeColor),
                            recognizer: TapGestureRecognizer()..onTap = _onTapSignInButton
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
  void _onTapSignInButton(){
    Navigator.pop(context);
  }
  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _passwordTEController.dispose();
    _phoneTEController.dispose();
    _deliveryAddressTEController.dispose();
    super.dispose();
  }
}
