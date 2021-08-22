import 'package:flutter/material.dart';

import '../../constants.dart';
import 'recommended_list_card.dart';

class RecommendedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    Constants _constants = Constants();

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: deviceWidth * 0.05,
        vertical: deviceHeight * 0.01,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: deviceHeight * 0.025,
            ),
            child: Text(
              _constants.recommendedString,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            height: deviceHeight * 1.07,
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
