import 'package:flutter/material.dart';

import '../../constants.dart';
import 'last_added_recipes_list_card.dart';

class LastAddedRecipesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    Constants _constants = Constants();

    return Container(
      height: deviceHeight * 0.6,
      margin: EdgeInsets.only(
        left: deviceWidth * 0.05,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _constants.lastAddedRecipesString,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
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
