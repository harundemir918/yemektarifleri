import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../viewmodel/recipe_list_view_model.dart';
import '../widgets/all_recipes_list.dart';

class AllRecipesListView extends StatefulWidget {
  const AllRecipesListView({Key? key}) : super(key: key);

  @override
  _AllRecipesListViewState createState() => _AllRecipesListViewState();
}

class _AllRecipesListViewState extends State<AllRecipesListView> {
  void initState() {
    Provider.of<RecipeListViewModel>(context, listen: false).getAllRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var recipeViewModel = Provider.of<RecipeListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          allRecipesString,
          style: Theme.of(context).textTheme.headline6,
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: AllRecipesList(
          allRecipesList: recipeViewModel.allRecipes,
        ),
      ),
    );
  }
}
