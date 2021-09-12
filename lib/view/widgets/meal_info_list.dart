import 'package:flutter/material.dart';

import 'meal_info_ingredients_section.dart';
import 'meal_info_nutrition_facts_section.dart';
import 'meal_info_recipe_section.dart';

class MealInfoList extends StatelessWidget {
  final carbohydrate;
  final protein;
  final fat;
  final ingredients;
  final recipe;

  MealInfoList({
    this.carbohydrate,
    this.protein,
    this.fat,
    this.ingredients,
    this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MealInfoNutritionFactsSection(
          carbohydrate: carbohydrate,
          protein: protein,
          fat: fat,
        ),
        MealInfoIngredientsSection(ingredients: ingredients),
        MealInfoRecipeSection(recipe: recipe),
      ],
    );
  }
}
