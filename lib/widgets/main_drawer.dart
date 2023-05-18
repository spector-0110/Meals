import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer(
      {super.key, required this.onSelectFilters, required this.onChangeMode,required this.currentMode});

  final void Function(String) onSelectFilters;
  final Function(bool) onChangeMode;
  final currentMode;

  // bool isLightMode = false;

  @override
  Widget build(context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.80)
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
          child: Row(children: [
            Icon(
              Icons.fastfood,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              'Cooking Up...',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.primary, fontSize: 20),
            ),
          ]),
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            size: 24,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          onTap: () {
            onSelectFilters('filters');
          },
          title: Text(
            'Filters',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary, fontSize: 20),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.restaurant,
            size: 24,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          onTap: () {
            onSelectFilters('Meals');
          },
          title: Text(
            'Meals',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary, fontSize: 20),
          ),
        ),
        Switch(
          value: currentMode,
          onChanged: (value) {
            onChangeMode(value);
          },
        )
      ]),
    );
  }
}
