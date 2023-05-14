import 'package:flutter/material.dart';

class Category {
  const Category({ this.color = Colors.orange, required this.id, required this.title });
  final Color color;
  final String id;
  final String title;
}
