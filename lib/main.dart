import 'package:flutter/material.dart';
import 'package:news_app/Features/splash/presentation/views/splash_view.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashView(),
      ),
    );
  }
}

void main() {
  runApp(const NewsApp());
}
