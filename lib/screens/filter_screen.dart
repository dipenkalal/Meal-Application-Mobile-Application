import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealapp/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilter;

  FilterScreen(this.saveFilter);


  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegan = false;
  var _vegeterian = false;
  var _lactoseFree = false;

  Widget _buildListSwitchTile(String title, String subtitle, bool value,
      dynamic Function(bool) updateValue) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: CupertinoSwitch(
        value: value,
        onChanged: updateValue,
      ),
      //onTap: () { setState(() { value = !value; }); },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meal Settings'),
          actions: <Widget>[
            IconButton(onPressed: widget.saveFilter, icon: Icon(Icons.save_outlined))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                _buildListSwitchTile(
                  'Gluten Free',
                  'Enabling this will filter GlutenFree Meals',
                  _glutenFree,
                  (updateValue) {
                    setState(
                      () {
                        _glutenFree = updateValue;
                      },
                    );
                  },
                ),
                _buildListSwitchTile(
                  'Vegan',
                  'Enabling this will filter Vegan Meals',
                  _vegan,
                      (updateValue) {
                    setState(
                          () {
                        _vegan = updateValue;
                      },
                    );
                  },
                ),
                _buildListSwitchTile(
                  'Vegetarian',
                  'Enabling this will filter Vegetarian Meals',
                  _vegeterian,
                      (updateValue) {
                    setState(
                          () {
                            _vegeterian = updateValue;
                      },
                    );
                  },
                ),
                _buildListSwitchTile(
                  'Lactose Free',
                  'Enabling this will filter LactoseFree Meals',
                  _lactoseFree,
                      (updateValue) {
                    setState(
                          () {
                            _lactoseFree = updateValue;
                      },
                    );
                  },
                ),
              ],
            ))
          ],
        ));
  }
}
