import 'package:flutter/material.dart';

import 'package:delimeals/widgets/category/category_item.dart';
import 'package:delimeals/fixtures/dummy_data.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, // 200 pixels
          childAspectRatio: 3 / 2, // relation 3:2
          crossAxisSpacing: 20, // space between elements
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (cat) => CategoryItem(
                title: cat.title,
                color: cat.color,
              ),
            )
            .toList(),
      ),
    );
  }
}
