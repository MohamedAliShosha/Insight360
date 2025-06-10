import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';

// The State widget for the CustomTextFormField
class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.isObscure = false,
    this.onSaved,
    this.onChanged,
    TextEditingController? controller,
  });

  final String hintText;
  final bool isObscure; // To hold an initial value for the password visibility
  final Function(String)? onChanged; // Callback function to handle text changes

  final FormFieldSetter<String>?
      onSaved; // Callback function to handle form submission

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

// The state object for the CustomTextFormField
class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isObscure; // will used to toggle the password visibility

  @override
  void initState() {
    super.initState();
    _isObscure = widget
        .isObscure; // if widget.isObscure is true, _isObscure will be true and vice versa now it has an initial value = false
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: widget.onSaved,
      validator: (data) {
        if (data!.isEmpty) {
          return 'This field is required'; // Check if the field is empty
        }
        return null;
      },
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
