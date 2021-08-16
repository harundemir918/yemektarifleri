import 'package:flutter/material.dart';

import '../widgets/categories_grid_list.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CategoriesGridList(),
      ),
    );
  }
}
