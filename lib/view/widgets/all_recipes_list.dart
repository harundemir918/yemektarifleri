import 'package:flutter/material.dart';

import 'all_recipes_list_card.dart';

class AllRecipesList extends StatelessWidget {
  final allRecipesList;

  AllRecipesList({this.allRecipesList});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: deviceWidth * 0.05,
        vertical: deviceHeight * 0.01,
      ),
      child: ListView(
        children: allRecipesList
            .map<Widget>(
              (recommended) => AllRecipesListCard(recipe: recommended),
            )
            .toList(),
      ),
    );
  }
}
