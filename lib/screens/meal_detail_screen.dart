import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/widgets/meal_item.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/mealdetail';

  Widget buildSectionTitle(BuildContext context,String text){
    return Container(
        padding: EdgeInsets.all(4),
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(text,
            style: Theme.of(context).textTheme.subtitle1),
      );
  }

  Widget buildContainer(Widget child){
    return Container(
        decoration: BoxDecoration(
        color: Colors.white60,
        border: Border.all(color: Colors.black12),
    borderRadius: BorderRadius.circular(10)),
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    height: 180,
    width: 400,
    child:child
    );
  }


  @override
  Widget build(BuildContext context) {
    final mealtitle = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal =
        dummyMeals.firstWhere((mealitem) => mealitem.title == mealtitle);
    return Scaffold(
      appBar: AppBar(
        title: Text('$mealtitle'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 290,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context,'Ingredients'),
        buildContainer(
          ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    color: Theme.of(context).secondaryHeaderColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                      child: Text(
                        selectedMeal.ingredients[index].toString(),
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
            ),
            buildSectionTitle(context,'Steps'),
            buildContainer(ListView.builder(
                itemBuilder: (ctx,index)=> Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          '#${(index+1)}'
                        ),
                      ),
                      title: Text(selectedMeal.instructions[index].toString()),
                    ),
                    Divider()
                  ],
                ),
              itemCount: selectedMeal.instructions.length,
            ))
          ],
        ),
      ),
    );
  }
}
