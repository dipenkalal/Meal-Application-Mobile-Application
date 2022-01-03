import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'Lato', fontSize: 22, fontWeight: FontWeight.w700),
      ),
      onTap: () {
        //...
      },
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
              child: Image.asset('assets/images/nav-menu-header-bg.jpg',
                  // width: 300,
                  height: MediaQuery.of(context).size.height * 0.25,
                  fit:BoxFit.cover
              ),
              ),

                ],
              ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


//   height: 150,
//   width: double.infinity,
//   padding: const EdgeInsets.all(20),
//   alignment: Alignment.centerLeft,
//
// //   child: Text(
// //     'Cooking Time?',
// //     style: TextStyle(
// //         fontWeight: FontWeight.w700,
// //         fontSize: 35,
// //           ),
// //   ),
// // ),
// // buildListTile('Meals', Icons.restaurant_menu),
// // const SizedBox(
// //   height: 20,
// // ),
// // buildListTile('Filters', Icons.settings),