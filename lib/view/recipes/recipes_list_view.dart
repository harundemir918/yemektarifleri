import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/category_list_view_model.dart';
import '../../viewmodel/recipe_list_view_model.dart';
import '../widgets/categories_list.dart';
import '../widgets/last_added_recipes_list.dart';
import '../widgets/recommended_list.dart';
import '../widgets/search_bar.dart';

class RecipesListView extends StatefulWidget {
  const RecipesListView({Key? key}) : super(key: key);

  @override
  State<RecipesListView> createState() => _RecipesListViewState();
}

class _RecipesListViewState extends State<RecipesListView> {
  void initState() {
    Provider.of<RecipeListViewModel>(context, listen: false)
        .getLastAddedRecipes();
    Provider.of<RecipeListViewModel>(context, listen: false)
        .getRecommendedRecipes();
    Provider.of<CategoryListViewModel>(context, listen: false)
        .getLastAddedCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var recipeViewModel = Provider.of<RecipeListViewModel>(context);
    var categoryViewModel = Provider.of<CategoryListViewModel>(context);
    return Column(
      children: [
        SearchBar(),
        LastAddedRecipesList(lastAddedList: recipeViewModel.lastAddedRecipes),
        CategoriesList(categoryList: categoryViewModel.lastAddedCategories),
        RecommendedList(recommendedList: recipeViewModel.recommendedRecipes),
      ],
    );
  }
}
