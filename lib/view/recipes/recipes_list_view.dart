import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(),
        LastAddedRecipesList(),
        CategoriesList(),
        RecommendedList(),
      ],
    );
  }
}
