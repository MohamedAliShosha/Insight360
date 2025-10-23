import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      this.onTap,
      required this.buttonTitle,
      this.isLoading = false,
      required this.textColor,
      required this.containerColor,
      this.leftPadding = 0,
      this.rightPadding = 0});

  final VoidCallback? onTap;
  final String buttonTitle;
  final double leftPadding;
  final double rightPadding;
  final Color containerColor;
  final Color textColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
      child: IgnorePointer(
        ignoring: isLoading == true,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
            color: containerColor,
          ),
          width: double.infinity,
          height: 60,
          child: GestureDetector(
            onTap: onTap,
            child: Center(
              child: isLoading
                  ? const CircularProgressIndicator(
                      color: ColorsManager.kWhiteColor,
                    )
                  : Text(
                      buttonTitle,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
