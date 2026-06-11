import 'package:flutter/material.dart';
import '../../../core/constants/appSpacing.dart';
import '../../../core/constants/app_Colors.dart';
import '../../../core/constants/imageAssets.dart';
import '../AuthWidgets/authFooterRow.dart';
import '../AuthWidgets/authTextField.dart';
import '../AuthWidgets/customSocialLogo.dart';
import '../AuthWidgets/orDivider.dart';
import '../AuthWidgets/primaryAuthButton.dart';
import '../AuthWidgets/socialLoginButton.dart';
import '../signUpScreen/signUpScreen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _rememberMe = true;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBGColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.pagePadding,
            vertical: AppSpacing.gapLg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset(ImageAssets.appLogo),
                    const SizedBox(height: AppSpacing.gapLg),
                    Image.asset(ImageAssets.appName),
                    const SizedBox(height: AppSpacing.gapXl),
                  ],
                ),
              ),

              const Text(
                'Sign in',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: AppSpacing.gapLg),

              AuthTextField(
                hint: 'abc@email.com',
                image: ImageAssets.emailImage,
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: AppSpacing.gapMd),
              AuthTextField(
                hint: 'Your password',
                image: ImageAssets.lockImage,
                isPassword: true,
                controller: _passwordCtrl,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: AppSpacing.gapMd),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Transform.scale(
                        scale: 0.85,
                        child: Switch(
                          value: _rememberMe,
                          onChanged: (v) => setState(() => _rememberMe = v),
                          activeColor: AppColors.background,
                          activeTrackColor: AppColors.primaryColor,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text('Remember Me'),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text('Forgot Password?'),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.gapLg),

              PrimaryAuthButton(
                label: 'SIGN IN',
                onTap: () {
                  if (_passwordCtrl.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Password cannot be empty')),
                    );
                    return;
                  }


                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
              ),
              const SizedBox(height: AppSpacing.gapLg),

              const OrDivider(),
              const SizedBox(height: AppSpacing.gapLg),

              SocialLoginButton(
                logo: const SocialMediaLogo(logo: "google"),
                label: 'Login with Google',
                onTap: () {},
              ),
              const SizedBox(height: AppSpacing.gapSm),
              SocialLoginButton(
                logo: const SocialMediaLogo(logo: "facebook"),
                label: 'Login with Facebook',
                onTap: () {},
              ),
              const SizedBox(height: AppSpacing.gapXl),

              AuthFooterRow(
                baseText: "Don't have an account?",
                linkText: 'Sign up',
                onLinkTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
              ),
              const SizedBox(height: AppSpacing.gapMd),
            ],
          ),
        ),
      ),
    );
  }
}
