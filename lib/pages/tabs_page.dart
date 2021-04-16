import 'package:flutter/material.dart';

import 'package:delimeals/pages/categories_page.dart';
import 'package:delimeals/pages/favorites_page.dart';
import 'package:delimeals/widgets/nav/main_drawer.dart';
import 'package:delimeals/models/meal.dart';

class TabsPage extends StatefulWidget {
  final List<Meal> favoriteMeal;

  TabsPage(this.favoriteMeal);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'title': 'Categories', 'page': CategoriesPage()},
      {'title': 'Favorites', 'page': FavoritesPage(widget.favoriteMeal)},
    ];

    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.white,
        // backgroundColor: Theme.of(context).primaryColor,
        // unselectedItemColor: Colors.lightGreen,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          )
        ],
      ),
    );
  }
}
