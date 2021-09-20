import 'package:flutter/material.dart';

import 'categories_grid_list_card.dart';

class CategoriesGridList extends StatelessWidget {
  final categoryList;

  CategoriesGridList({this.categoryList});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(25.0),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: categoryList
                  .map<Widget>(
                    (category) => CategoriesGridListCard(category: category),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
