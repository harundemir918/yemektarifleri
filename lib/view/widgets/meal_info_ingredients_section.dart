import 'package:flutter/material.dart';

import '../../constants.dart';

class MealInfoIngredientsSection extends StatelessWidget {
  final ingredients;

  MealInfoIngredientsSection({
    this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      width: deviceWidth * 0.9,
      margin: EdgeInsets.symmetric(
        horizontal: deviceWidth * 0.05,
        vertical: deviceHeight * 0.025,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.shopping_cart_outlined),
              SizedBox(
                width: 5,
              ),
              Text(
                ingredientsString,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 17),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            ingredients,
          ),
        ],
      ),
    );
  }
}
