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
          Container(
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.blueGrey,
            child: Text(
              'Cooking Time?',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                  color: Theme.of(context).primaryColorLight),
            ),
          ),
          buildListTile('Meals', Icons.restaurant_menu),
          const SizedBox(
            height: 20,
          ),
          buildListTile('Filters', Icons.settings),
        ],
      ),
    );
  }
}
