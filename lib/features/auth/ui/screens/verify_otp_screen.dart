import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/core/extentions/localization_extention.dart';
import 'package:crafty_bay/core/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/core/widgets/show_snack_bar_message.dart';
import 'package:crafty_bay/features/auth/data/models/sign_up_otp_model.dart';
import 'package:crafty_bay/features/auth/ui/controllers/sign_up_otp_controller.dart';
import 'package:crafty_bay/features/auth/ui/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});
  final String email;

  static const String name = '/verify-otp';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _verifyOtpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignUpOtpController _signUpOtpController = Get.find<SignUpOtpController>();

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
                  context.localization.enterYourOtpCode,
                  style: textTheme.bodyLarge,
                ),
                Text(
                  context.localization.enterAFourDigitOtpCode,
                  style: textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 32,
                ),
                PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: Colors.transparent,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 4,
                  obscureText: false,
                  obscuringCharacter: '*',
                  // obscuringWidget: const FlutterLogo(
                  //   size: 24,
                  // ),
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v!.length < 3) {
                      return "I'm from validator";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                  ),
                  cursorColor: Colors.black,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  controller: _verifyOtpTEController,
                  keyboardType: TextInputType.number,
                  boxShadows: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black12,
                      blurRadius: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                GetBuilder<SignUpOtpController>(
                  builder: (controller) {
                    return Visibility(
                      visible: _signUpOtpController.isLoading == false,
                      replacement: CenteredCircularProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: _onTapSignUpButton,
                        child: Text(context.localization.confirm),
                      ),
                    );
                  }
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
                          recognizer: TapGestureRecognizer()
                            ..onTap = _onTapSignUpButton),
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

  void _onTapSignUpButton() {
    if(_formKey.currentState!.validate()){
      _verifyOtp();
    }
  }

  Future<void> _verifyOtp() async{
    SignUpOtpModel signUpOtpModel = SignUpOtpModel(email: widget.email, otp: _verifyOtpTEController.text);
    bool isSuccess = await _signUpOtpController.signUpOtp(signUpOtpModel);
    if(isSuccess){
      showSnackBarMessage(context, 'Otp has been verified! Please login');
      Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (predicate)=> false);
    }else{
      showSnackBarMessage(context, _signUpOtpController.errorMessage!);
    }
  }

  @override
  void dispose() {
    _verifyOtpTEController.dispose();
    super.dispose();
  }
}
