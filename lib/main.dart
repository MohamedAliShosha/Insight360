import 'package:flutter/material.dart';

import 'core/utils/app_router.dart';
import 'core/utils/theme.dart';
import 'initializer.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) {
        return HeroControllerScope.none(child: child!);
      },
      theme: getAppTheme(),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router, //
    );
  }
}

void main() async {
  await AppInitializer.initialize();
  runApp(const NewsApp());
}
