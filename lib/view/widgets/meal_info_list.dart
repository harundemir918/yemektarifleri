import 'package:flutter/material.dart';

import 'meal_info_ingredients_section.dart';
import 'meal_info_nutrition_facts_section.dart';
import 'meal_info_recipe_section.dart';

class MealInfoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MealInfoNutritionFactsSection(),
        MealInfoIngredientsSection(),
        MealInfoRecipeSection(),
      ],
    );
  }
}
