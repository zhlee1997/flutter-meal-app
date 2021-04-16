import 'package:flutter/widgets.dart';

import 'screens/new_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/filter_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  NewScreen.routeName: (ctx) => NewScreen(),
  MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
  FilterScreen.routeName: (ctx) => FilterScreen(),
};
