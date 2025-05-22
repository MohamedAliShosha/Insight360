import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (String value) {
        if (value.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please enter a search term.')),
          );
          return;
        }
      },
      cursorColor: ColorsManager.kWhite,
      decoration: InputDecoration(
        hintText: 'Search by Category',
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: ColorsManager.kWhite,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.kWhite),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.kWhite),
        ),
        border: const OutlineInputBorder(),
        labelText: 'Search',
        labelStyle: const TextStyle(
          color: ColorsManager.kWhite,
        ),
      ),
    );
  }
}
