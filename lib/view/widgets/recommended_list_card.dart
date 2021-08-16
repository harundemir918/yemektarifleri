import 'package:flutter/material.dart';

import '../../constants.dart';
import '../recipes/recipe_detail_view.dart';

class RecommendedListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dynamicWidth = MediaQuery.of(context).size.width;
    final dynamicHeight = MediaQuery.of(context).size.height;
    Constants _constants = Constants();

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecipeDetailView(),
        ),
      ),
      child: Card(
        child: Container(
          height: dynamicHeight * 0.2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Container(
                  width: dynamicWidth * 0.4,
                  height: dynamicHeight * 0.5,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.network(
                        'https://cdn.yemek.com/mnresize/940/940/uploads/2015/08/tavuk-sote-yemekcom.jpg'),
                  ),
                ),
              ),
              Container(
                width: dynamicWidth * 0.4,
                height: dynamicHeight * 0.5,
                margin: EdgeInsets.symmetric(
                  horizontal: dynamicWidth * 0.02,
                  vertical: dynamicHeight * 0.02,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tavuk Sote',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 2,
                    ),
                    Container(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildInfoRow(
                            icon: 'assets/icons/calories.png',
                            title: '100 ${_constants.caloriesUnitString}',
                          ),
                          _buildInfoRow(
                            icon: 'assets/icons/chronometer.png',
                            title: '10 ${_constants.durationUnitString}',
                          ),
                          _buildInfoRow(
                            icon: 'assets/icons/person.png',
                            title: '4 ${_constants.personUnitString}',
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
