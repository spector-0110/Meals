import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/categoris_grid_items.dart';
import 'package:meals_app/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onTapFavoriteIcon});

  final void Function(Meal) onTapFavoriteIcon;
  void _selectCategory(BuildContext context, Category category) {
    final fiteredList = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (ctx) => MealScreen(
                title: category.title,
                meals: fiteredList,
                onTapFavoriteIcon: onTapFavoriteIcon,
              )),
    );
  }

  @override
  Widget build(context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      children: [
        //...availableCategories.map((category) => CategoriesGridItems(category: category)).toList(),
        for (final category in availableCategories)
          CategoriesGridItems(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              }),
      ],
    );
  }
}
