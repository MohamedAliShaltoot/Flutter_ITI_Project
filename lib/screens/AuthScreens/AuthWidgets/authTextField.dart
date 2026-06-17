import 'package:flutter/material.dart';
import '../../../core/constants/appSpacing.dart';
import '../../../core/constants/app_Colors.dart';
import '../../../core/constants/imageAssets.dart';

class AuthTextField extends StatefulWidget {
  final String hint;
  //final IconData leadingIcon;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? image;
  final String? Function(String?)? validator;

  const AuthTextField({
    super.key,
    required this.hint,
   // required this.leadingIcon,
    this.isPassword = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.image,
    this.validator,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool _obscure = true;
  bool _hasFocus = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (f) => setState(() => _hasFocus = f),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        height: AppSpacing.fieldHeight,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(AppSpacing.fieldRadius),
          border: Border.all(
            color: _hasFocus ? AppColors.primaryColor : AppColors.fieldBorder,
            width: _hasFocus ? 1.5 : 1.0,
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),

            Image.asset(widget.image ?? "",width: 16,height: 16),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: widget.controller,
                obscureText: widget.isPassword && _obscure,
                keyboardType: widget.keyboardType,
                textInputAction: widget.textInputAction,
                validator: widget.validator,
                decoration: InputDecoration(
                  hintText: widget.hint,
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            if (widget.isPassword) ...[
              GestureDetector(
                onTap: () => setState(() => _obscure = !_obscure),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Icon(
                    _obscure
                        ? Icons.remove_red_eye_outlined
                        : Icons.visibility_off_outlined,
                    size: 18,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ] else
              const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
