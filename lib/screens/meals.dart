import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealScreen extends StatelessWidget {
  MealScreen({super.key, required this.meals, required this.title});

  String title;
  final List<Meal> meals;

  @override
  Widget build(context) {
    Widget content = Center(
      child: Column(
        children: [
          Text("Uh oh... nothing here!",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground)),
          const SizedBox(
            height: 20,
          ),
          Text("Try other  Categories",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground)),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length, // important so that flutter gets to know the length of the list
          itemBuilder: (ctx, index) => Text(meals[index].title));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
