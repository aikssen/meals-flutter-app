import 'package:flutter/material.dart';

import 'package:delimeals/widgets/meal/meal_item.dart';
import 'package:delimeals/models/meal.dart';

class CategoryMealsPage extends StatefulWidget {
  static String routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsPage(this.availableMeals);

  @override
  _CategoryMealsPageState createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadedInitData = false; // not needed in 2.0.2 ??

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryID = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayedMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(categoryID))
          .toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealID) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(displayedMeals[index], _removeMeal);
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
