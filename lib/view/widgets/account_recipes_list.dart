import 'package:flutter/material.dart';

import 'account_recipes_list_card.dart';

class AccountRecipesList extends StatelessWidget {
  const AccountRecipesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: deviceWidth * 0.05),
      height: deviceHeight * 1.07,
      child: ListView(
        children: [
          AccountRecipesListCard(),
          AccountRecipesListCard(),
          AccountRecipesListCard(),
          AccountRecipesListCard(),
          AccountRecipesListCard(),
          AccountRecipesListCard(),
          AccountRecipesListCard(),
          AccountRecipesListCard(),
          AccountRecipesListCard(),
          AccountRecipesListCard(),
        ],
      ),
    );
  }
}
