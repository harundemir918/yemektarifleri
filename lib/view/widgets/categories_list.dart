import 'package:flutter/material.dart';

import '../../constants.dart';
import 'categories_list_card.dart';

class CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dynamicWidth = MediaQuery.of(context).size.width;
    final dynamicHeight = MediaQuery.of(context).size.height;
    Constants _constants = Constants();

    return Container(
      margin: EdgeInsets.only(
        left: dynamicWidth * 0.05,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: dynamicHeight * 0.02,
                ),
                child: Text(
                  _constants.categoriesString,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(_constants.seeAllString),
                    Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
              )
            ],
          ),
          Container(
            height: dynamicHeight * 0.15,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                CategoriesListCard(),
                CategoriesListCard(),
                CategoriesListCard(),
                CategoriesListCard(),
                CategoriesListCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
