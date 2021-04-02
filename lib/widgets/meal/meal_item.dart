import 'package:delimeals/pages/meal_detail_page.dart';
import 'package:flutter/material.dart';

import 'package:delimeals/models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function removeItem;

  MealItem(this.meal, this.removeItem);

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challengin';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  void _selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MeatDetailPage.routeName,
      arguments: {'id': meal.id},
    ).then((result) {
      // action to exec when back to this page
      print(result); // result = mealID - e.g. 'm1'
      if (result != null) {
        removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(5),
                    topRight: const Radius.circular(5),
                  ),
                  child: Image.network(
                    meal.imageURL,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      meal.title,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(children: <Widget>[
                    Icon(Icons.schedule),
                    SizedBox(width: 5),
                    Text('${meal.duration} min'),
                  ]),
                  Row(children: <Widget>[
                    Icon(Icons.work),
                    SizedBox(width: 5),
                    Text(complexityText),
                  ]),
                  Row(children: <Widget>[
                    Icon(Icons.attach_money),
                    SizedBox(width: 5),
                    Text(affordabilityText),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
