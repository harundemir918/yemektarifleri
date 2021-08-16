import 'package:flutter/material.dart';

import 'categories_grid_list_card.dart';

class CategoriesGridList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dynamicWidth = MediaQuery.of(context).size.width;
    final dynamicHeight = MediaQuery.of(context).size.height;

    return Container(
      child: Column(
        children: [
          Container(
            height: dynamicHeight * 0.9,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(10.0),
                children: [
                  CategoriesGridListCard(),
                  CategoriesGridListCard(),
                  CategoriesGridListCard(),
                  CategoriesGridListCard(),
                  CategoriesGridListCard(),
                  CategoriesGridListCard(),
                  CategoriesGridListCard(),
                  CategoriesGridListCard(),
                  CategoriesGridListCard(),
                  CategoriesGridListCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
