import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    required this.signUpOrSignIn,
  });

  final String signUpOrSignIn;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align items to top
              children: [
                const Text(
                  '_____________',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    height: 1, // Tweak spacing
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  signUpOrSignIn,
                  style: const TextStyle(
                    fontSize: 15,
                    color: kLightGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  '_____________',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    height: 1,
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
