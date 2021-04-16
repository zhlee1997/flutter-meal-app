import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-screen';

  final Function saveFilter;
  final Map<String, bool> filterData;

  FilterScreen(this.saveFilter, this.filterData);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVeganFree = false;
  var _isVegetarianFree = false;

  Widget _buildSwitchListTile(
      String title, String subtile, bool value, Function onTapSwitch) {
    return SwitchListTile(
      value: value,
      onChanged: onTapSwitch,
      title: Text(title),
      subtitle: Text(subtile),
    );
  }

  @override
  void initState() {
    _isGlutenFree = widget.filterData['gluten'];
    _isLactoseFree = widget.filterData['lactose'];
    _isVeganFree = widget.filterData['vegan'];
    _isVegetarianFree = widget.filterData['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Filter'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final filterData = {
                'gluten': _isGlutenFree,
                'vegan': _isVeganFree,
                'vegetarian': _isVegetarianFree,
                'lactose': _isLactoseFree,
              };

              widget.saveFilter(filterData);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            height: 80,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              'Adjust your meal selection',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          _buildSwitchListTile(
            'Gluten-free',
            'Only include gluten-free meals',
            _isGlutenFree,
            (value) {
              setState(
                () {
                  _isGlutenFree = value;
                },
              );
            },
          ),
          _buildSwitchListTile(
            'Vegan-free',
            'Only include vegan-free meals',
            _isVeganFree,
            (value) {
              setState(
                () {
                  _isVeganFree = value;
                },
              );
            },
          ),
          _buildSwitchListTile(
            'Vegetarian-free',
            'Only include vegetarian-free meals',
            _isVegetarianFree,
            (value) {
              setState(
                () {
                  _isVegetarianFree = value;
                },
              );
            },
          ),
          _buildSwitchListTile(
            'Lactose-free',
            'Only include lactose-free meals',
            _isLactoseFree,
            (value) {
              setState(
                () {
                  _isLactoseFree = value;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
