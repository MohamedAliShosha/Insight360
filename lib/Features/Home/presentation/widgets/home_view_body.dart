import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/Features/Home/presentation/widgets/news_item.dart';

import 'package:news_app/core/utils/app_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: 
        
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kNewsDetailsView);
                        },
                        child: const NewsItem()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
