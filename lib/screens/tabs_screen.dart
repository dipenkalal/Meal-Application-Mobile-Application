import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/category_screen.dart';
import 'package:mealapp/widgets/main_drawer.dart';

import 'favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoutireMeals;
  TabsScreen(this.favoutireMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, dynamic>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': CategoryScreen(), 'title': 'Categories'},
      {'page': FavScreen(widget.favoutireMeals), 'title': 'Favourites'}
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
        type: BottomNavigationBarType.shifting,
        onTap: _selectPage,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}

//bottom: const TabBar(
//     tabs: <Widget>[
//       Tab(
//         icon: Icon(Icons.category),
//         text: 'Category',
//       ),
//       Tab(
//         icon: Icon(Icons.favorite),
//         text: 'Favourites',
//       )
//     ],
//   ),
// ),
// body: TabBarView(
//     children: <Widget>[
//       CategoryScreen(),
//       FavScreen()
//     ],
// ),
