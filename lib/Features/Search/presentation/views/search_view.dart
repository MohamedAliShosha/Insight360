import 'package:flutter/material.dart';
import 'package:news_app/Features/Search/presentation/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchViewBody(),
    );
  }
}
