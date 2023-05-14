import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/categoris_grid_items.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealScreen(title: "some meals", meals: [])));
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('select categories'),
      ),
      body: GridView(
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
                  _selectCategory(context);
                }),
        ],
      ),
    );
  }
}
