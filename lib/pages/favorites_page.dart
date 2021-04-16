import 'package:flutter/material.dart';

import 'package:delimeals/models/meal.dart';
import 'package:delimeals/widgets/meal/meal_item.dart';

class FavoritesPage extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesPage(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Scaffold(
        // appBar: AppBar(title: const Text('Favorites')),
        body: Container(
          child: Text('Favorites'),
        ),
      );
    } else {
      return Scaffold(
        // appBar: AppBar(title: const Text('Favorites')),
        body: Container(
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(favoriteMeals[index], null);
            },
            itemCount: favoriteMeals.length,
          ),
        ),
      );
    }
  }
}
