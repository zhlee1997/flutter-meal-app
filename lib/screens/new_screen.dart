import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class NewScreen extends StatefulWidget {
  static const routeName = '/new-screen';

  final List<Meal> filteredMeals;

  NewScreen(this.filteredMeals);

  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  var _initialLoad = false;

  List<Meal> _displayedMeal;
  String title;
  // String id;

  @override
  void didChangeDependencies() {
    if (!_initialLoad) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final id = routeArgs['id'];
      title = routeArgs['title'];
      _displayedMeal = widget.filteredMeals
          .where(
            (meal) => meal.categories.contains(id),
          )
          .toList();
      _initialLoad = true;
    }
    super.didChangeDependencies();
  }

  // void _removeMeal(String mealId) {
  //   setState(() {
  //     _displayedMeal.removeWhere((element) => element.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) => MealItem(
            id: _displayedMeal[index].id,
            title: _displayedMeal[index].title,
            imageUrl: _displayedMeal[index].imageUrl,
            duration: _displayedMeal[index].duration,
            complexity: _displayedMeal[index].complexity,
            affordability: _displayedMeal[index].affordability,
          ),
          itemCount: _displayedMeal.length,
        ),
      ),
    );
  }
}
