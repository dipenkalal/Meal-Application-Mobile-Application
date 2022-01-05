import 'package:flutter/material.dart';
import 'package:mealapp/screens/category_meal_screen.dart';
import 'package:mealapp/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'Lato', fontSize: 22, fontWeight: FontWeight.w700),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Image.asset('assets/images/nav-bg.jpg',
                          // width: 300,
                          height: MediaQuery.of(context).size.height * 0.30,
                          fit: BoxFit.cover),
                    ),
                  ],
                ),
                //],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
//         Container(
// //          alignment: Alignment.centerLeft,
//           padding: const EdgeInsets.only(left: 20,bottom: 10),
//           height: MediaQuery.of(context).size.height * 0.28,
//           child: const CircleAvatar(
//             radius: 50.0,
//             backgroundColor: Color(0xFF778899),
//             backgroundImage: NetworkImage("https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZSUyMHBob3RvfGVufDB8fDB8fA%3D%3D&w=1000&q=80"), // for Network image
//           ),
//         ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.all(7),
                    height: MediaQuery.of(context).size.height * 0.28,
                    child: const Text(
                      'Welcome User',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
            Column(
            children: <Widget>[
              buildListTile('Meals', Icons.restaurant_menu,(){ Navigator.of(context).pushReplacementNamed('/');}),
              buildListTile('Filters', Icons.settings,(){Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);}),
                ]
            ),
            ],
      ),
    );
  }
}


