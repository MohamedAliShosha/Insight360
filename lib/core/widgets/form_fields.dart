import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

/// Reusable email text form field with validation
class EmailFormField extends StatelessWidget {
  const EmailFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      hintText: hintText ?? 'Enter your Email',
      labelText: labelText ?? 'Email',
      keyboardType: TextInputType.emailAddress,
      validator: (data) {
        if (data == null || data.isEmpty) {
          return 'This field is required';
        }
        if (!EmailValidator.validate(data)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }
}

/// Reusable password text form field
class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      hintText: hintText ?? 'Enter your password',
      labelText: labelText ?? 'Password',
      isObscureText: true,
    );
  }
}

/// Reusable text form field with custom validator
class ValidatedTextFormField extends StatelessWidget {
  const ValidatedTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.hintText,
    this.labelText,
  });

  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final String? hintText;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      hintText: hintText ?? '',
      labelText: labelText ?? '',
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}

/// Reusable name form field with validation
class NameFormField extends StatelessWidget {
  const NameFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return ValidatedTextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      validator: (data) {
        if (data == null || data.isEmpty) {
          return 'This field is required';
        }
        if (data.length < 3) {
          return 'Name must be at least 3 characters';
        }
        return null;
      },
      labelText: labelText ?? 'Name',
      hintText: hintText ?? 'Enter your name',
    );
  }
}

/// Reusable phone number form field
class PhoneFormField extends StatelessWidget {
  const PhoneFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return ValidatedTextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      validator: (data) {
        if (data == null || data.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      labelText: labelText ?? 'Phone Number',
      hintText: hintText ?? 'Enter your phone number',
    );
  }
}
