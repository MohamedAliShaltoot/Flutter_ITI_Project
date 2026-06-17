import 'package:flutter/material.dart';
import '../../../core/constants/appSpacing.dart';
import '../../../core/constants/app_Colors.dart';
import '../../../core/constants/imageAssets.dart';
import '../../../core/localDataSource/sharedPreferencesManager.dart';
import '../../../core/routes/app_routes.dart';
import '../AuthWidgets/authFooterRow.dart';
import '../AuthWidgets/authTextField.dart';
import '../AuthWidgets/customSocialLogo.dart';
import '../AuthWidgets/orDivider.dart';
import '../../../core/sharedWidgets/primaryButton.dart';
import '../AuthWidgets/socialLoginButton.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _rememberMe = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _restoreRememberMe();
  }

  // remember me so prefill fields again
  Future<void> _restoreRememberMe() async {
    final prefs = SharedPreferencesManager.instance;
    final remember = await prefs.rememberMe;
    if (!remember) return;

    final email    = await prefs.savedEmail;
    final password = await prefs.savedPassword;

    if (!mounted) return;
    setState(() {
      _rememberMe = remember;
      if (email != null)    _emailCtrl.text    = email;
      if (password != null) _passwordCtrl.text = password;
    });
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

  Future<void> _onSignIn() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {

      final user = await SharedPreferencesManager.instance.verifyLocalLogin(
        email:    _emailCtrl.text.trim(),
        password: _passwordCtrl.text,
      );

      if (user == null) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Incorrect email or password')),
        );
        return;
      }

      await SharedPreferencesManager.instance.saveLoginSession(
        user: user,
        rememberMe: _rememberMe,
        email: _emailCtrl.text.trim(),
        password: _passwordCtrl.text,
      );

      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);

    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign in failed: ${e.toString()}')),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

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
          child: Form(
            key: _formKey,
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
                  textInputAction: TextInputAction.done,
                  validator: _validatePassword,
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
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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

                PrimaryButton(
                  label: 'SIGN IN',
                  isLoading: _isLoading,
                  onTap: _onSignIn,
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
                  onLinkTap: () =>
                      Navigator.pushReplacementNamed(context, AppRoutes.signUpScreen),
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
