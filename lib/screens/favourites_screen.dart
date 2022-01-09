import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/meal_item.dart';

class FavScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favouriteMeals.isEmpty){
      return const Center(
        child: Text('Your Favourites are empty... Start adding some!!'),
      );
    } else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return mealitem(
            affordability: favouriteMeals[index].affordability,
            complexity: favouriteMeals[index].complexity,
            title: favouriteMeals[index].title,
            duration: favouriteMeals[index].duration,
            imageUrl: favouriteMeals[index].imageUrl,
            id: favouriteMeals[index].id,
            //removeItem: _removeMeal,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }

  }
}
