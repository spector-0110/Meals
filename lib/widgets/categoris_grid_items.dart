import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoriesGridItems extends StatelessWidget {
  CategoriesGridItems({super.key, required this.category});
  Category category;

  @override
  Widget build(context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          category.color.withOpacity(.55),
          category.color.withOpacity(.95),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Text(
        category.title,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
    );
  }
}
