import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';

Widget buildInfoRow(IconData icon, String label, String value) {
  return Row(
    children: [
      Icon(icon, color: ColorsManager.kPrimaryBlue),
      const SizedBox(width: 15),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: ColorsManager.kPrimaryBlue,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: ColorsManager.kPrimaryBlue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
