import 'package:flutter/material.dart';
import 'package:mealapp/widgets/meal_item.dart';
import 'package:mealapp/models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeal;
  const CategoryMealScreen(this.availableMeal);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  late String? categoryTitle;
  late List<Meal> categoryMeal;
  var _loadedInitData = false;


  @override
  void initState() {

    super.initState();
  }
  @override
  void didChangeDependencies() {
    if (!_loadedInitData){
      final routeArgs =
      ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      categoryMeal = widget.availableMeal.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealTitle){
        setState(() {
          categoryMeal.removeWhere((meal) => meal.title == mealTitle);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return mealitem(
                affordability: categoryMeal[index].affordability,
                complexity: categoryMeal[index].complexity,
                title: categoryMeal[index].title,
                duration: categoryMeal[index].duration,
                imageUrl: categoryMeal[index].imageUrl,
                id: categoryMeal[index].id,
              removeItem: _removeMeal,
            );
          },
          itemCount: categoryMeal.length,
        ));
  }
}
