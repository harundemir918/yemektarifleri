import 'package:flutter/material.dart';

import '../../constants.dart';
import 'recommended_list_card.dart';

class RecommendedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dynamicWidth = MediaQuery.of(context).size.width;
    final dynamicHeight = MediaQuery.of(context).size.height;
    Constants _constants = Constants();

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: dynamicWidth * 0.05,
        vertical: dynamicHeight * 0.01,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: dynamicHeight * 0.025,
            ),
            child: Text(
              _constants.recommendedString,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            height: dynamicHeight * 1.07,
            child: Column(
              children: [
                RecommendedListCard(),
                RecommendedListCard(),
                RecommendedListCard(),
                RecommendedListCard(),
                RecommendedListCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
