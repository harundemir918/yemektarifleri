import 'package:flutter/material.dart';

import 'categories_grid_list_card.dart';

class CategoriesGridList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      child: Column(
        children: [
          Container(
            height: deviceHeight * 0.85,
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
        ],
      ),
    );
  }
}
