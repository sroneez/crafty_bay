import 'package:crafty_bay/core/extentions/localization_extention.dart';
import 'package:crafty_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
                hintStyle: textTheme.bodySmall
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: _passwordTEController,
              decoration: InputDecoration(
                  hintText: context.localization.password,
                  hintStyle: textTheme.bodySmall
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(context.localization.signIn),
            ),
          ],
        ),
      ),
    ));
  }
}
