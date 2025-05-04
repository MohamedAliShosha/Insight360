import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.isObscure = false,
    this.onChanged,
  });

  final String hintText;
  final bool isObscure; // To hold an initial value for the password visibility
  final Function(String)? onChanged; // Callback function to handle text changes

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscure; // will used to toggle the password visibility

  @override
  void initState() {
    super.initState();
    _isObscure = widget
        .isObscure; // if widget.isObscure is true, _isObscure will be true and vice versa now it has an initial value = false
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      obscureText: _isObscure,
      decoration: InputDecoration(
        suffixIcon: widget.isObscure // Check if the field is a password field
            ? IconButton(
                icon: Icon(
                  _isObscure
                      ? Icons.visibility_off
                      : Icons
                          .visibility, // If the field is a password field, toggle the password visibility
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              )
            : null,
        suffixIconColor: ColorsManager.kBlack,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: ColorsManager.kLightGrey,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorsManager.kLightGrey,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorsManager.kLightGrey,
          ),
        ),
      ),
    );
  }
}
