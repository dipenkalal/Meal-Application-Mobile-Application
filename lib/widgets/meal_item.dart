import 'package:flutter/material.dart';
import '../models/meal.dart';

class mealitem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  mealitem(
      {required this.affordability,
      required this.complexity,
      required this.title,
      required this.duration,
      required this.imageUrl});

  String get complexityText{
    switch(complexity){
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default :
        return "Unknown";

    }
  }

  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable:
        return 'Affordable ';
        break;
      case Affordability.LittleBitPricey:
        return 'LittleBitPricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default :
        return "Unknown";

    }
  }

  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 8,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                    ),
                    child:InkWell(child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    )
                  ),
                  Positioned(
                    bottom: 15,
                    left: 10,
                    child: Container(

                      width: 200,
                      color: Colors.black45,
                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                      child: Text(title, style: const TextStyle(fontSize: 20, color: Colors.white,
                      ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(children: <Widget>[
                          const Icon(Icons.timelapse_rounded),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('$duration Minutes ', style: const TextStyle(fontSize: 16),),
                        ],),
                        Row(children: <Widget>[
                          const Icon(Icons.work_outline_rounded),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('Level: $complexityText ', style: const TextStyle(fontSize: 16),),
                        ],),
                      ],
                    ),const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: <Widget>[
                          const Icon(Icons.monetization_on_outlined),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('Costing: $affordabilityText ', style: const TextStyle(fontSize: 16),),
                        ],),
                      ],
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
