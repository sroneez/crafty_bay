import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/core/extentions/localization_extention.dart';
import 'package:crafty_bay/core/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/core/widgets/show_snack_bar_message.dart';
import 'package:crafty_bay/features/auth/data/sign_in_model.dart';
import 'package:crafty_bay/features/auth/ui/controllers/sign_in_controller.dart';
import 'package:crafty_bay/features/auth/ui/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:crafty_bay/features/common/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignInController _signInController = Get.find<SignInController>();

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
                  style: TextStyle(fontSize: 14),
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
                  decoration: InputDecoration(
                      hintText: context.localization.password,
                      hintStyle: textTheme.bodySmall),
                ),
                const SizedBox(
                  height: 24,
                ),
                GetBuilder<SignInController>(
                  builder: (controller) {
                    return Visibility(
                      visible: _signInController.isLoading == false,
                      replacement: CenteredCircularProgressIndicator(),
                      child: ElevatedButton(
                        onPressed:_onTapSignInButton,
                        child: Text(context.localization.signIn),
                      ),
                    );
                  }
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
                          recognizer: TapGestureRecognizer()
                            ..onTap = _onTapSignupButton),
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

  void _onTapSignInButton() {
    if(_formKey.currentState!.validate()){
      _signIn();
    }
  }

  Future<void> _signIn() async {
    SignInModel signInModel =
        SignInModel(email: _emailTEController.text.trim(), password: _passwordTEController.text);
    final bool isSuccess = await _signInController.signIn(signInModel);
    if (isSuccess) {
      Navigator.pushNamedAndRemoveUntil(
          context, MainBottomNavBarScreen.name, (predicate) => false);
    }else{
      showSnackBarMessage(context, _signInController.errorMessage!, true);
    }
  }
  void _onTapSignupButton(){
    Navigator.pushNamed(context, SignUpScreen.name);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
