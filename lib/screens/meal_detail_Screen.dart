import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key, required this.meal, required this.onTapFavoriteIcon});

  final Meal meal;
  final void Function(Meal) onTapFavoriteIcon;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
        ),
        actions: [
          IconButton(
            onPressed: () {
              onTapFavoriteIcon(meal);
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
              height: 180,
              width: double.infinity,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Text(
                'Ingredients:',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            for (final ingredients in meal.ingredients)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                child: Text(
                  ' :  $ingredients',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Text(
                'STEPS:',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            for (final steps in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
                child: Text(
                  ':  $steps',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
