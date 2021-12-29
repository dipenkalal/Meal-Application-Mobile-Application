import 'package:flutter/material.dart';
import './dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
      static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;
  //
  // CategoryMealScreen(this.categoryId,this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeal = Dummy_Meals.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(itemBuilder: (ctx , index ){
        return Text(categoryMeal[index].title);
      },itemCount: categoryMeal.length,)
    );
  }
}
