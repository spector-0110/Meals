import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.label, required this.icon});

  final String label;
  final IconData icon;
  @override
  Widget build(context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.white,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
