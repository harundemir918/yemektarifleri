import 'package:flutter/material.dart';

import 'account_recipes_list_card.dart';

class AccountRecipesList extends StatelessWidget {
  final userRecipesList;

  AccountRecipesList({this.userRecipesList});

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
        children: userRecipesList
            .map<Widget>(
              (recipe) => AccountRecipesListCard(recipe: recipe),
            )
            .toList(),
      ),
    );
  }
}
