import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/mealdetail';


  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme.of(context).textTheme.subtitle1),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
            decoration: BoxDecoration(
                color: Colors.white60,
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            height:300,
            width: 400,
            child: child);
  }

  @override
  Widget build(BuildContext context) {

    final _scrollController = ScrollController();
    final mealtitle = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal =
        dummyMeals.firstWhere((mealitem) => mealitem.title == mealtitle);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('$mealtitle'),
      // ),
      body: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        reverse: false,
        child: Scrollbar(
        child:
          Column(children: [
            Stack(children: <Widget>[
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .35,
                    decoration: const BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        )),
                  ),
                ],
              ),
              Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .08,
                      right: 20.0,
                      left: 20.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .38,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      color: Colors.transparent,
                      elevation: 15,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          selectedMeal.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )),
            ]),
            // SingleChildScrollView(
            //   child: Column(
            //     children: <Widget>[
            //       Container(
            //         height: 290,
            //         width: double.infinity,
            //         child: Image.network(
            //           selectedMeal.imageUrl,
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            Container(
              margin:const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
              child: Text(
                mealtitle,
                style: TextStyle(
                    fontSize: 28,
                    foreground: Paint()..color = const Color.fromRGBO(20, 51, 51, 1),
                    fontWeight: FontWeight.bold),
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).secondaryHeaderColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      selectedMeal.ingredients[index].toString(),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${(index + 1)}'),
                      ),
                      title: Text(selectedMeal.instructions[index].toString(),style: const TextStyle(fontSize: 15),),
                    ),
                    const Divider()
                  ],
                ),
                itemCount: selectedMeal.instructions.length,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
