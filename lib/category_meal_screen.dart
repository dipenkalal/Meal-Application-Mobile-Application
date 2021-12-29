import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  const CategoryMealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('The Recipe Page',),
      ),
      body: const Center(
        child: Text('List of Recipes for the Category Screen'),
      ),
    );
  }
}
