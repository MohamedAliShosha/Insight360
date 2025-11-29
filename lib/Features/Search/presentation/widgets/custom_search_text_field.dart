import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/Search/presentation/manager/SearchCubit/search_cubit.dart';
import 'package:news_app/core/functions/build_error_snack_bar.dart';
import 'package:news_app/core/utils/constants.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({
    super.key,
  });
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      style: const TextStyle(
        color: ColorsManager.kWhiteColor,
      ),
      controller: _controller,
      cursorColor: ColorsManager.kWhiteColor,
      decoration: InputDecoration(
        hintText: 'Search by Category',
        suffixIcon: IconButton(
          onPressed: () {
            final value = _controller.text
                .trim(); // trim used to remove leading/trailing spaces
            if (value.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                buildErrorSnackBar('Please enter a search term'),
              );
              return;
            }
            context.read<SearchCubit>().getSearchedNews(
                apiKey: Constants.apiKey, category: value, country: 'us');
            _controller.clear(); // clear the text field after search
          },
          icon: const Icon(
            Icons.search,
            color: ColorsManager.kWhiteColor,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.kWhiteColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.kWhiteColor),
        ),
        border: const OutlineInputBorder(),
        labelText: 'Search',
        labelStyle: const TextStyle(
          color: ColorsManager.kWhiteColor,
        ),
      ),
    );
  }
}
