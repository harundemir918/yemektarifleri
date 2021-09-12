import 'package:flutter/material.dart';

import '../widgets/meal_info_list.dart';
import '../widgets/meal_info_title_card.dart';

class RecipeDetailView extends StatelessWidget {
  final recipe;

  RecipeDetailView({this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MealInfoTitleCard(
                title: recipe.title,
                calories: recipe.calories,
                duration: recipe.duration,
                person: recipe.person,
                picture: recipe.picture,
              ),
              MealInfoList(
                carbohydrate: recipe.carbohydrate,
                protein: recipe.protein,
                fat: recipe.fat,
                ingredients: recipe.ingredients,
                recipe: recipe.recipe,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
