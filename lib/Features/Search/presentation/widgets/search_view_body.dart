import 'package:flutter/material.dart';
import 'package:news_app/Features/Search/presentation/widgets/custom_search_text_field.dart';
import 'package:news_app/Features/Search/presentation/widgets/search_result_list_view.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.kPrimaryBlue,
        body: Padding(
          padding: EdgeInsets.only(right: 20, left: 20, top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomSearchTextField(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Search Results',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: SearchResultListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
