import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _selectPage(index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  final List<Meal> favoriteMeals = [];
  void onTapFavoriteIcon(meal) {
    if (favoriteMeals.contains(meal)) {
      setState(() {
        favoriteMeals.remove(meal);
      });
      _showInfoMessage("Meal removed from favorite");
    } else {
      setState(() {
        favoriteMeals.add(meal);
      });
      _showInfoMessage("Meal added to favorite");
    }
  }

  @override
  Widget build(context) {
    Widget activePage = CategoriesScreen(
      onTapFavoriteIcon: onTapFavoriteIcon,
    );
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      activePage = MealScreen(
        meals: favoriteMeals,
        onTapFavoriteIcon: onTapFavoriteIcon,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favortie'),
        ],
      ),
    );
  }
}
