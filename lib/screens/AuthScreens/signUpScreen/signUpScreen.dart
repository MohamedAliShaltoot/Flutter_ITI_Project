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
import '../signInScreen/signInScreen.dart';

class SignUpScreen extends StatefulWidget {


  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameCtrl      = TextEditingController();
  final _emailCtrl     = TextEditingController();
  final _passwordCtrl  = TextEditingController();
  final _confirmCtrl   = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmCtrl.dispose();
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
              GestureDetector(
                onTap: (){},
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.fieldBorder),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 16,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.gapLg),
              const Text('Sign up', style: TextStyle(fontSize: 24,fontWeight:FontWeight.w600 )),
              const SizedBox(height: AppSpacing.gapLg),

              AuthTextField(
                hint: 'Full name',
               image: ImageAssets.profileImage,
                controller: _nameCtrl,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: AppSpacing.gapMd),
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
              ),
              const SizedBox(height: AppSpacing.gapMd),
              AuthTextField(
                hint: 'Confirm password',
                image: ImageAssets.lockImage,
                isPassword: true,
                controller: _confirmCtrl,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: AppSpacing.gapXl),


              PrimaryButton(label: 'SIGN UP', onTap: () {
                if (_passwordCtrl.text != _confirmCtrl.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Passwords do not match')),
                  );
                  return;
                }
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
              }

              ),
              const SizedBox(height: AppSpacing.gapLg),

              const OrDivider(),
              const SizedBox(height: AppSpacing.gapLg),


              SocialLoginButton(
                logo: const SocialMediaLogo(logo:"google"),
                label: 'Login with Google',
                onTap: () {},
              ),
              const SizedBox(height: AppSpacing.gapSm),
              SocialLoginButton(
                logo: const SocialMediaLogo(logo:"facebook"),
                label: 'Login with Facebook',
                onTap: () {},
              ),
              const SizedBox(height: AppSpacing.gapXl),
              AuthFooterRow(
                baseText: 'Already have an account?',
                linkText: 'Signin',
                onLinkTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
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