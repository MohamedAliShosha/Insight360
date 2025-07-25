import 'package:flutter/material.dart';

class CustomButtonWithOutImage extends StatelessWidget {
  const CustomButtonWithOutImage(
      {super.key,
      this.onTap,
      required this.text,
      required this.textColor,
      required this.imagePath,
      required this.containerColor,
      this.leftPadding = 0,
      this.rightPadding = 0});

  final VoidCallback? onTap;
  final String text;
  final double leftPadding;
  final double rightPadding;
  final Color containerColor;
  final Color textColor;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
            color: containerColor,
          ),
          width: double.infinity,
          height: 60,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min, // Use min to fit the content
              mainAxisAlignment: MainAxisAlignment.center, // Center the content
              children: [
                Image.asset(
                  imagePath,
                  height: 20,
                  width: 20,
                ),
                const SizedBox(
                  width: 25,
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
