import 'package:flutter/material.dart';
import 'custom_search_text_field.dart';
import 'searched_result_list_view.dart';
import '../../../../core/utils/colors_manager.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.kPrimaryBlue,
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, top: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomSearchTextField(),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Search Results',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Expanded(
              child: SearchedResultListView(),
            ),
          ],
        ),
      ),
    );
  }
}
