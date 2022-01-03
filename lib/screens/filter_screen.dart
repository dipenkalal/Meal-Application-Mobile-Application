import 'package:flutter/material.dart';
import 'package:mealapp/widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
 static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filtered List'),),
      drawer: MainDrawer(),
      body: const Center(
        child: Text('Filters Tab'),
      ),
    );
  }
}
