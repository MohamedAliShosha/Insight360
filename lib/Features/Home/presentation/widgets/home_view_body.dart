import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/Features/Home/presentation/widgets/news_item.dart';

import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: ColorsManager.kPrimaryBlue,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () => GoRouter.of(context).push(AppRouter.kSearchView),
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () => GoRouter.of(context).push(AppRouter.kProfileView),
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
        body: Column(
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
