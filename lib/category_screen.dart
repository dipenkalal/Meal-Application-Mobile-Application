import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Meal App Dev Phase',
          ),
        ),
        body: GridView(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20),
          children: Dummy_Category
              .map((catData) =>
                  CategoryItem(catData.id, catData.title, catData.color))
              .toList(),
        ));
  }
}
