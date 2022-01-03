import 'package:flutter/material.dart';
import 'package:mealapp/screens/category_meal_screen.dart';
import 'package:mealapp/screens/filter_screen.dart';
import 'package:mealapp/screens/meal_detail_screen.dart';
import 'package:mealapp/screens/tabs_screen.dart';
import './screens/category_screen.dart';

Future<void> main() async {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Application',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0,128,128,1),
        primaryColorLight: Color.fromRGBO(250, 250, 250, 1),
        accentColor: Colors.teal,
        canvasColor: const Color.fromRGBO(250, 250, 250, 1),
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal).copyWith(secondary: Colors.amber),
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          subtitle1: const TextStyle(fontSize: 20, fontFamily: 'Lato', fontWeight: FontWeight.w300)
        )
      ),

      // home: const ,
      initialRoute: '/', //default loading path
      routes: {
          '/' : (ctx) => TabsScreen(),
          CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
        MealDetail.routeName: (ctx) => MealDetail(),
        FilterScreen.routeName: (ctx) => FilterScreen(),
      },
    );
  }
}

