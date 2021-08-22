import 'package:flutter/material.dart';

import '../widgets/account_recipes_list.dart';

class AccountRecipesView extends StatelessWidget {
  const AccountRecipesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tariflerim',
          style: Theme.of(context).textTheme.headline6,
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: AccountRecipesList(),
    );
  }
}
