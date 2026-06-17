import 'package:flutter/material.dart';
import '../../../core/constants/appSpacing.dart';
import '../../../core/constants/app_Colors.dart';
import '../../../core/constants/imageAssets.dart';
import '../AuthWidgets/authFooterRow.dart';
import '../AuthWidgets/authTextField.dart';
import '../AuthWidgets/customSocialLogo.dart';
import '../AuthWidgets/orDivider.dart';
import '../../../core/sharedWidgets/primaryButton.dart';
import '../AuthWidgets/socialLoginButton.dart';
import '../signInScreen/signInScreen.dart';

// class SignUpScreen extends StatefulWidget {
//
//
//   const SignUpScreen({super.key});
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   final _nameCtrl      = TextEditingController();
//   final _emailCtrl     = TextEditingController();
//   final _passwordCtrl  = TextEditingController();
//   final _confirmCtrl   = TextEditingController();
//
//   @override
//   void dispose() {
//     _nameCtrl.dispose();
//     _emailCtrl.dispose();
//     _passwordCtrl.dispose();
//     _confirmCtrl.dispose();
//     super.dispose();
//   }
//   String? _validateEmail(String? value) {
//     if (value == null || value.trim().isEmpty) return 'Email is required';
//     final emailRegex = RegExp(r'^[\w.+-]+@[\w-]+\.[a-zA-Z]{2,}$');
//     if (!emailRegex.hasMatch(value.trim())) return 'Enter a valid email';
//     return null;
//   }
//
//   String? _validatePassword(String? value) {
//     if (value == null || value.isEmpty) return 'Password is required';
//     if (value.length < 6) return 'Password must be at least 6 characters';
//     return null;
//   }
//   String? _validateName(String? value) {
//     if (value == null || value.isEmpty) return 'Name is required';
//     return null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.appBGColor,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(
//             horizontal: AppSpacing.pagePadding,
//             vertical: AppSpacing.gapLg,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               GestureDetector(
//                 onTap: (){},
//                 child: Container(
//                   width: 36,
//                   height: 36,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: AppColors.fieldBorder),
//                   ),
//                   child: const Icon(
//                     Icons.arrow_back_ios_new_rounded,
//                     size: 16,
//                     color: AppColors.textPrimary,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: AppSpacing.gapLg),
//               const Text('Sign up', style: TextStyle(fontSize: 24,fontWeight:FontWeight.w600 )),
//               const SizedBox(height: AppSpacing.gapLg),
//
//               AuthTextField(
//                 hint: 'Full name',
//                image: ImageAssets.profileImage,
//                 controller: _nameCtrl,
//                 keyboardType: TextInputType.name,
//                 validator: _validateName,
//               ),
//               const SizedBox(height: AppSpacing.gapMd),
//               AuthTextField(
//                 hint: 'example@email.com',
//                image: ImageAssets.emailImage,
//                 controller: _emailCtrl,
//                 keyboardType: TextInputType.emailAddress,
//                 validator: _validateEmail,
//               ),
//               const SizedBox(height: AppSpacing.gapMd),
//               AuthTextField(
//                 hint: 'Your password',
//                 image: ImageAssets.lockImage,
//                 isPassword: true,
//                 controller: _passwordCtrl,
//                 textInputAction: TextInputAction.done,
//                 validator: _validatePassword,
//               ),
//               const SizedBox(height: AppSpacing.gapMd),
//               AuthTextField(
//                 hint: 'Confirm password',
//                 image: ImageAssets.lockImage,
//                 isPassword: true,
//                 controller: _confirmCtrl,
//                 textInputAction: TextInputAction.done,
//                 validator: _validatePassword,
//               ),
//               const SizedBox(height: AppSpacing.gapXl),
//
//
//               PrimaryButton(label: 'SIGN UP', onTap: () {
//                 if (_passwordCtrl.text != _confirmCtrl.text) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Passwords do not match')),
//                   );
//                   return;
//                 }
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => SignInScreen()),
//                 );
//               }
//
//               ),
//               const SizedBox(height: AppSpacing.gapLg),
//
//               const OrDivider(),
//               const SizedBox(height: AppSpacing.gapLg),
//
//
//               SocialLoginButton(
//                 logo: const SocialMediaLogo(logo:"google"),
//                 label: 'Login with Google',
//                 onTap: () {},
//               ),
//               const SizedBox(height: AppSpacing.gapSm),
//               SocialLoginButton(
//                 logo: const SocialMediaLogo(logo:"facebook"),
//                 label: 'Login with Facebook',
//                 onTap: () {},
//               ),
//               const SizedBox(height: AppSpacing.gapXl),
//               AuthFooterRow(
//                 baseText: 'Already have an account?',
//                 linkText: 'Signin',
//                 onLinkTap: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => SignInScreen()),
//                   );
//                 },
//               ),
//               const SizedBox(height: AppSpacing.gapMd),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// lib/screens/AuthScreens/signUpScreen/signUpScreen.dart

import 'package:flutter/material.dart';
import 'package:tickety/core/localDataSource/sharedPreferencesManager.dart';
import 'package:tickety/core/routes/app_routes.dart';
import '../../../core/constants/appSpacing.dart';
import '../../../core/constants/app_Colors.dart';
import '../../../core/constants/imageAssets.dart';
import '../AuthWidgets/authFooterRow.dart';
import '../AuthWidgets/authTextField.dart';
import '../AuthWidgets/customSocialLogo.dart';
import '../AuthWidgets/orDivider.dart';
import '../../../core/sharedWidgets/primaryButton.dart';
import '../AuthWidgets/socialLoginButton.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey     = GlobalKey<FormState>();
  final _nameCtrl    = TextEditingController();
  final _emailCtrl   = TextEditingController();
  final _passwordCtrl  = TextEditingController();
  final _confirmCtrl   = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }


  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) return 'Full name is required';
    if (value.trim().length < 2) return 'Name is too short';
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Email is required';
    final emailRegex = RegExp(r'^[\w.+-]+@[\w-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value.trim())) return 'Enter a valid email';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 6) return 'Password must be at least 6 characters';
    return null;
  }


  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) return 'Please confirm your password';
    if (value != _passwordCtrl.text) return 'Passwords do not match';
    return null;
  }

  Future<void> _onSignUp() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final user = StoredUser(
        id:    'local_${_emailCtrl.text.trim().hashCode.abs()}',
        name:  _nameCtrl.text.trim(),
        email: _emailCtrl.text.trim(),
        avatarUrl: null,
        phone: null,
      );

      await SharedPreferencesManager.instance.registerLocally(
        user: user,
        password: _passwordCtrl.text,
      );

      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed: ${e.toString()}')),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.maybePop(context),
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

                const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: AppSpacing.gapLg),

                AuthTextField(
                  hint: 'Full name',
                  image: ImageAssets.profileImage,
                  controller: _nameCtrl,
                  keyboardType: TextInputType.name,
                  validator: _validateName,
                ),
                const SizedBox(height: AppSpacing.gapMd),

                AuthTextField(
                  hint: 'example@email.com',
                  image: ImageAssets.emailImage,
                  controller: _emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateEmail,
                ),
                const SizedBox(height: AppSpacing.gapMd),

                AuthTextField(
                  hint: 'Your password',
                  image: ImageAssets.lockImage,
                  isPassword: true,
                  controller: _passwordCtrl,
                  validator: _validatePassword,
                ),
                const SizedBox(height: AppSpacing.gapMd),

                AuthTextField(
                  hint: 'Confirm password',
                  image: ImageAssets.lockImage,
                  isPassword: true,
                  controller: _confirmCtrl,
                  textInputAction: TextInputAction.done,
                  validator: _validateConfirmPassword,
                ),
                const SizedBox(height: AppSpacing.gapXl),

                PrimaryButton(
                  label: 'SIGN UP',
                  isLoading: _isLoading,
                  onTap: _onSignUp,
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
                  baseText: 'Already have an account?',
                  linkText: 'Sign in',
                  onLinkTap: () => Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.signInScreen,
                  ),
                ),
                const SizedBox(height: AppSpacing.gapMd),
              ],
            ),
          ),
        ),
      ),
    );
  }
}