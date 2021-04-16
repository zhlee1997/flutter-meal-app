import 'package:citizen_app/screens/filter_screen.dart';
import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildDrawerListile(IconData icon, String text, Function tapHandler) {
    return ListTile(
      onTap: tapHandler,
      leading: Icon(icon, size: 26),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                'CitizenApp',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Theme.of(context).accentColor),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildDrawerListile(Icons.restaurant, 'Meals', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildDrawerListile(Icons.settings, 'Filters', () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
