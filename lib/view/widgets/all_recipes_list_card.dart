import 'package:flutter/material.dart';

import '../../constants.dart';
import '../recipes/recipe_detail_view.dart';

class AllRecipesListCard extends StatelessWidget {
  final recipe;

  AllRecipesListCard({
    this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecipeDetailView(recipe: recipe),
        ),
      ),
      child: Card(
        child: Container(
          height: deviceHeight * 0.2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Container(
                  width: deviceWidth * 0.4,
                  height: deviceHeight * 0.5,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child:
                        Image.network('$apiRecipeImagesUrl/${recipe.picture}'),
                  ),
                ),
              ),
              Container(
                width: deviceWidth * 0.4,
                height: deviceHeight * 0.5,
                margin: EdgeInsets.symmetric(
                  horizontal: deviceWidth * 0.02,
                  vertical: deviceHeight * 0.02,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.title,
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 2,
                    ),
                    Container(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildInfoRow(
                            icon: 'assets/icons/calories.png',
                            title: '${recipe.calories} $caloriesUnitString',
                          ),
                          _buildInfoRow(
                            icon: 'assets/icons/chronometer.png',
                            title: '${recipe.duration} $durationUnitString',
                          ),
                          _buildInfoRow(
                            icon: 'assets/icons/person.png',
                            title: '${recipe.person} $personUnitString',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow({required String icon, required String title}) {
    return Row(
      children: [
        Image.asset(
          icon,
          width: 18,
        ),
        Container(
          margin: EdgeInsets.only(left: 5),
          child: Text(title),
        ),
      ],
    );
  }
}
