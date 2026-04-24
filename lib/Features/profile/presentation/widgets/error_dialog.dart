import 'package:flutter/material.dart';
import 'custom_log_out_alert_dialog.dart';
import '../../../../core/utils/colors_manager.dart';

Future<bool?> showErrorDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => const CustomLogOutAlertDialog(
      logoutButtonColor: Colors.redAccent,
      cancelButtonColor: ColorsManager.kWhiteColor,
      contentTextColor: ColorsManager.kWhiteColor,
      titleTextColor: ColorsManager.kWhiteColor,
      dialogBackgroundColor: ColorsManager.kPrimaryBlue,
      logoutButtonText: 'Logout',
      cancelButtonText: 'Cancel',
      titleText: 'Confirm Logout',
      contentText: 'Are you sure you want to logout?',
    ),
  );
}
