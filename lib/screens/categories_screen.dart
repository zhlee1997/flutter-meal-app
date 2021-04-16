import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/categories_item.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/categories-screen';

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      children: DUMMY_CATEGORIES
          .map((e) => CategoriesItem(e.id, e.title, e.color))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
    );
  }
}
