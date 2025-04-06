import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';

class MediaReportRadioButton extends StatelessWidget {
  const MediaReportRadioButton({
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
          backgroundColor: kPrimaryBlue,
          child: CircleAvatar(
            radius: 10,
            backgroundColor: kWhite,
            child: _selectedUserType ==
                    "mediaReporter" // Check if the selected user type is "mediaReporter"
                ? Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kPrimaryBlue,
                    ),
                  )
                : null,
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          'Media Reporter',
          style: TextStyle(
            fontSize: 15,
            color: kPrimaryBlue,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
