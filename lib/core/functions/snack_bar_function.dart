import 'package:flutter/material.dart';
import '../utils/colors_manager.dart';

/// Shows a customizable snack bar
///
/// [context] - The build context
/// [message] - The message to display (required)
/// [backgroundColor] - Background color of the snack bar (defaults to kPrimaryBlue)
/// [textColor] - Color of the text (defaults to Colors.white)
/// [duration] - Duration the snack bar is shown (defaults to 2 seconds)
/// [behavior] - Behavior of the snack bar (defaults to SnackBarBehavior.floating)
/// [textAlign] - Alignment of the text (defaults to TextAlign.center)
/// [fontWeight] - Weight of the font (defaults to FontWeight.normal)
/// [fontSize] - Size of the font (defaults to null, which uses default size)
/// [isCentered] - Whether to center the content (defaults to true)
void showCustomSnackBar({
  required BuildContext context,
  required String message,
  Color? backgroundColor,
  Color? textColor,
  Duration? duration,
  SnackBarBehavior? behavior,
  TextAlign? textAlign,
  FontWeight? fontWeight,
  double? fontSize,
  bool isCentered = true,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: isCentered
          ? Center(
              child: Text(
                message,
                textAlign: textAlign ?? TextAlign.center,
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontWeight: fontWeight ?? FontWeight.normal,
                  fontSize: fontSize,
                ),
              ),
            )
          : Text(
              message,
              textAlign: textAlign ?? TextAlign.start,
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontWeight: fontWeight ?? FontWeight.normal,
                fontSize: fontSize,
              ),
            ),
      backgroundColor: backgroundColor ?? ColorsManager.kPrimaryBlue,
      behavior: behavior ?? SnackBarBehavior.floating,
      duration: duration ?? const Duration(seconds: 2),
    ),
  );
}
