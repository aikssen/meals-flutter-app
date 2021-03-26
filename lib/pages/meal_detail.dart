import 'package:flutter/material.dart';

import 'package:delimeals/fixtures/dummy_data.dart';

class MeatDetailPage extends StatelessWidget {
  static String routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealID = routeArgs['id'];
    final meal = DUMMY_MEALS.where((meal) => meal.id == mealID).first;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Center(
        child: Text(meal.title),
      ),
    );
  }
}
