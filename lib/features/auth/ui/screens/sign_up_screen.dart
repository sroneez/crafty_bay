import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/core/extentions/localization_extention.dart';
import 'package:crafty_bay/core/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/core/widgets/show_snack_bar_message.dart';
import 'package:crafty_bay/features/auth/data/models/sign_up_model.dart';
import 'package:crafty_bay/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:crafty_bay/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:crafty_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

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
  final TextEditingController _deliveryAddressTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignUpController signUpController = Get.find<SignUpController>();

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
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  style: TextStyle(fontSize: 14),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? value) {
                    String email = value ?? '';
                    if (!(EmailValidator.validate(email))) {
                      return 'Enter your email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: context.localization.email,
                      hintStyle: textTheme.bodySmall),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _passwordTEController,
                  style: TextStyle(fontSize: 14),
                  textInputAction: TextInputAction.next,
                  validator: (String? value) {
                    if ((value?.isEmpty ?? true) || value!.length < 6) {
                      return 'Enter a password more then 6 letters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: context.localization.password,
                      hintStyle: textTheme.bodySmall),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _firstNameTEController,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(fontSize: 14),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your first name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: context.localization.firstName,
                      hintStyle: textTheme.bodySmall),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  style: TextStyle(fontSize: 14),
                  controller: _lastNameTEController,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your last name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: context.localization.lastName,
                      hintStyle: textTheme.bodySmall),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  style: TextStyle(fontSize: 14),
                  controller: _phoneTEController,
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    String phoneNumber = value ?? '';
                    RegExp regExp = RegExp(r'^(?:\+?88|0088)?01[15-9]\d{8}$');
                    if (regExp.hasMatch(phoneNumber) == false) {
                      return 'Enter your Phone number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: context.localization.phone,
                      hintStyle: textTheme.bodySmall),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _deliveryAddressTEController,
                  maxLines: 3,
                  style: TextStyle(fontSize: 14),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter delivery address';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: context.localization.deliveryAddress,
                    hintStyle: textTheme.bodySmall,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                GetBuilder<SignUpController>(builder: (controller) {
                  return Visibility(
                    visible: signUpController.signUpInProgress == false,
                    replacement: CenteredCircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: () {
                        _onTapSignUpButton();
                      },
                      child: Text(context.localization.signUp),
                    ),
                  );
                }),
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
                          recognizer: TapGestureRecognizer()
                            ..onTap = _onTapSignInButton),
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

  Future<void> _onTapSignUpButton() async{
    if (_formKey.currentState!.validate()) {
      SignUpModel signUpModel = SignUpModel(
        email: _emailTEController.text.trim(),
        firstName: _firstNameTEController.text.trim(),
        lastName: _lastNameTEController.text.trim(),
        password: _passwordTEController.text,
        phone: _phoneTEController.text.trim(),
        deliveryAddress: _deliveryAddressTEController.text.trim(),
      );
      final isSuccess = await  signUpController.signUp(signUpModel);
      if(isSuccess){
        showSnackBarMessage(context, 'Account created successfully');
        Navigator.pushNamed(context, VerifyOtpScreen.name,arguments: _emailTEController.text.trim());
      }else{
        showSnackBarMessage(context, signUpController.errorMessage!);
      }
    }
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
