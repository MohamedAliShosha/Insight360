import 'package:flutter/material.dart';
import 'package:news_app/Features/Home/data/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(right: 16), // To make spaces between the cards
      child: Container(
        height: 85,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
              image: AssetImage(
                'Assets/Images/science.avif',
              ),
              fit: BoxFit.fill),
        ),
        child: Center(
          child: Text(
            categoryModel.categoryName,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
