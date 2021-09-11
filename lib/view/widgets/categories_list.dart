import 'package:flutter/material.dart';

import '../../constants.dart';
import '../categories/categories_list_view.dart';
import 'categories_list_card.dart';

class CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(
        left: deviceWidth * 0.05,
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
                  vertical: deviceHeight * 0.02,
                ),
                child: Text(
                  categoriesString,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoriesListView(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Text(seeAllString),
                    Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
              )
            ],
          ),
          Container(
            height: deviceHeight * 0.15,
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
