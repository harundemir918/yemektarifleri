import 'package:flutter/material.dart';

import '../../constants.dart';

class MealInfoNutritionFactsSection extends StatelessWidget {
  final carbohydrate;
  final protein;
  final fat;

  MealInfoNutritionFactsSection({
    this.carbohydrate,
    this.protein,
    this.fat,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    Constants _constants = Constants();

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
              Icon(Icons.info_outline),
              SizedBox(
                width: 5,
              ),
              Text(
                _constants.nutritionFactsString,
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
          _buildInfoRow(
            title: _constants.carbohydrateTitleString,
            value: '100 ${_constants.carbohydrateUnitString}',
          ),
          _buildInfoRow(
            title: _constants.proteinTitleString,
            value: '100 ${_constants.proteinUnitString}',
          ),
          _buildInfoRow(
            title: _constants.fatTitleString,
            value: '100 ${_constants.fatUnitString}',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(value),
      ],
    );
  }
}
