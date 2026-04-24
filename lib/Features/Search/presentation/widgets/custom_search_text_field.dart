import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/SearchCubit/search_cubit.dart';
import '../../../../core/functions/snack_bar_function.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/colors_manager.dart';

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
          hintText: 'Search by Category',
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 2, top: 2, bottom: 2),
            child: InkWell(
              onTap: () {
                final value = _controller.text
                    .trim(); // trim used to remove leading/trailing spaces
                if (value.isEmpty) {
                  showCustomSnackBar(
                    context: context,
                    message: 'Please enter a search term',
                    backgroundColor: ColorsManager.kPrimaryColor,
                    duration: const Duration(seconds: 3),
                    textColor: ColorsManager.kPrimaryBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    isCentered: true,
                  );
                  return;
                }
                context.read<SearchCubit>().getSearchedNews(
                    apiKey: Constants.apiKey, category: value, country: 'us');
                _controller.clear(); // clear the text field after search
              },
              child: CircleAvatar(
                backgroundColor: ColorsManager.kGreyColor.withOpacity(0.2),
                child: const Icon(
                  Icons.search,
                  color: ColorsManager.kWhiteColor,
                ),
              ),
            ),
          ),
        ));
  }
}
