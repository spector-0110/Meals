import 'package:flutter/material.dart';

class FilterTile extends StatelessWidget {
  FilterTile(
      {super.key,
      required this.filterText,
      required this.onChecked,
      this.val });
      

// not in use widget


  final filterText;
  var val;
  final void Function(bool, bool) onChecked;
  @override
  Widget build(context) {
    return SwitchListTile(
        //hoverColor: Theme.of(context).colorScheme.background,
        //controlAffinity: ListTileControlAffinity.trailing,
        value: val,
        onChanged: (isChecked) {
          onChecked(isChecked, val);
        },
        title: Text(
          filterText,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
        subtitle: Text(
          "Meals will be completeley $filterText",
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        activeColor: Theme.of(context).colorScheme.tertiary,
        contentPadding: const EdgeInsets.only(left: 30, right: 30));
  }
}
