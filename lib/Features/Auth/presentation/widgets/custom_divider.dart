import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align items to top
              children: [
                Text(
                  '_____________',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    height: 1, // Tweak spacing
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  'Or sign in with',
                  style: TextStyle(
                    fontSize: 15,
                    color: kLightGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 8),
                Text(
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
