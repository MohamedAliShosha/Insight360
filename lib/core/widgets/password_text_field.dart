import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/app_text_form_field.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.passwordController,
    required this.labelText,
    required this.hintText,
  });

  final TextEditingController passwordController;

  final String labelText;
  final String hintText;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      isObscureText: obscureText,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: obscureText
            ? const Icon(
                Icons.visibility_off,
                color: ColorsManager.kPrimaryBlue,
              )
            : const Icon(
                Icons.visibility,
                color: ColorsManager.kPrimaryBlue,
              ),
      ),
      keyboardType: TextInputType.visiblePassword,
      validator: (data) {
        if (data == null || data.isEmpty) {
          return 'This field is required';
        }
        if (data.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
      controller: widget.passwordController,
      labelText: widget.labelText,
      hintText: widget.hintText,
    );
  }
}
