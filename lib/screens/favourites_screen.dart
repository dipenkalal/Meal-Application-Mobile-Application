import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';

class FavScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('The Favourites'),
    );
  }
}
