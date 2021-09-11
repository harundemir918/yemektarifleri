import 'package:flutter/material.dart';
import 'package:yemektarifleri/service/api.dart';

import '../../constants.dart';
import 'last_added_recipes_list_card.dart';

class LastAddedRecipesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      height: deviceHeight * 0.6,
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
                  lastAddedRecipesString,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              TextButton(
                onPressed: () async {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => CategoriesListView(),
                  //   ),
                  // );
                  await Api().fetchAllRecipes();
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
          Expanded(
            flex: 7,
            child: Container(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  LastAddedRecipesListCard(),
                  LastAddedRecipesListCard(),
                  LastAddedRecipesListCard(),
                  LastAddedRecipesListCard(),
                  LastAddedRecipesListCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
