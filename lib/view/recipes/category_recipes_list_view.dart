import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../viewmodel/recipe_list_view_model.dart';
import '../widgets/category_recipes_list.dart';

class CategoryRecipesListView extends StatefulWidget {
  final categoryId;

  CategoryRecipesListView({this.categoryId});

  @override
  _CategoryRecipesListViewState createState() =>
      _CategoryRecipesListViewState();
}

class _CategoryRecipesListViewState extends State<CategoryRecipesListView> {
  void initState() {
    Provider.of<RecipeListViewModel>(context, listen: false)
        .getCategoryRecipes(widget.categoryId);
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
        child: recipeViewModel.categoryRecipes.isNotEmpty
            ? CategoryRecipesList(
                allRecipesList: recipeViewModel.categoryRecipes,
              )
            : Center(
                child: Text('Tarif bulunamadı.'),
              ),
      ),
    );
  }
}
