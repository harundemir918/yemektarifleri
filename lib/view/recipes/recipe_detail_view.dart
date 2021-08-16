import 'package:flutter/material.dart';

import '../widgets/meal_info_list.dart';
import '../widgets/meal_info_title_card.dart';

class RecipeDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MealInfoTitleCard(),
              MealInfoList(),
            ],
          ),
        ),
      ),
    );
  }
}
