import 'package:flutter/material.dart';

import 'package:news_app/core/utils/colors_manager.dart';

class VistitorRadioButton extends StatelessWidget {
  const VistitorRadioButton({
    super.key,
    required String? selectedUserType,
  }) : _selectedUserType = selectedUserType;

  final String? _selectedUserType;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: ColorsManager.kPrimaryBlue,
          child: CircleAvatar(
            radius: 10,
            backgroundColor: ColorsManager.kWhite,
            child: _selectedUserType == "visitor"
                ? Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorsManager.kPrimaryBlue,
                    ),
                  )
                : null,
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          'Visitor',
          style: TextStyle(
            fontSize: 15,
            color: ColorsManager.kPrimaryBlue,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
