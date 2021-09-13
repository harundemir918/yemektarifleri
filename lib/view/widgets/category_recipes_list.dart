import 'package:flutter/material.dart';

import 'category_recipes_list_card.dart';

class CategoryRecipesList extends StatelessWidget {
  final allRecipesList;

  CategoryRecipesList({this.allRecipesList});

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
              (recipe) => CategoryRecipesListCard(recipe: recipe),
            )
            .toList(),
      ),
    );
  }
}
