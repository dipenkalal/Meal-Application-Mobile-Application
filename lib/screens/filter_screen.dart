import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealapp/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final void Function(Map<String,bool>) savedFilter;
  final Map<String,bool> currentfilters;

  const FilterScreen(this.savedFilter,this.currentfilters);


  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegan = false;
  var _vegetarian = false;
  var _lactoseFree = false;

  @override
  initState(){
    _glutenFree = widget.currentfilters['gluten']?? false;
    _vegan = widget.currentfilters['vegan']?? false;
    _vegetarian = widget.currentfilters['vegetarian']?? false;
    _lactoseFree = widget.currentfilters['lactose']?? false;
    super.initState();
  }

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
            IconButton(onPressed:() {
              final selectedFilters = {
              'gluten':_glutenFree,
              'vegan':_vegan,
              'vegetarian':_vegetarian,
              'lactose':_lactoseFree,
              };
              widget.savedFilter(selectedFilters);
            },
                icon: Icon(Icons.save_outlined))
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
                  _vegetarian,
                      (updateValue) {
                    setState(
                          () {
                            _vegetarian = updateValue;
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
