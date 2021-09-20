import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/recipe_list_view_model.dart';
import '../widgets/account_recipes_list.dart';

class AccountRecipesView extends StatefulWidget {
  final userId;

  AccountRecipesView({this.userId});

  @override
  State<AccountRecipesView> createState() => _AccountRecipesViewState();
}

class _AccountRecipesViewState extends State<AccountRecipesView> {
  void initState() {
    Provider.of<RecipeListViewModel>(context, listen: false)
        .getUserRecipes(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var recipeViewModel = Provider.of<RecipeListViewModel>(context);

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
      body: RefreshIndicator(
        onRefresh: () async {
          Provider.of<RecipeListViewModel>(context, listen: false)
              .getUserRecipes(widget.userId);
        },
        child: recipeViewModel.userRecipes.isNotEmpty
            ? AccountRecipesList(
                userRecipesList: recipeViewModel.userRecipes,
              )
            : Center(
                child: Text('Tarif bulunamadı.'),
              ),
      ),
    );
  }
}
