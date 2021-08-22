import 'package:flutter/material.dart';

class MealInfoTitleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      width: deviceWidth * 0.9,
      height: deviceHeight * 0.5,
      margin: EdgeInsets.only(
        top: deviceHeight * 0.025,
        left: deviceWidth * 0.05,
        right: deviceWidth * 0.05,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 25,
            spreadRadius: -10,
          ),
        ],
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: Container(
                width: deviceWidth * 1,
                height: deviceHeight * 0.3,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Image.network(
                      'https://cdn.yemek.com/mnresize/940/940/uploads/2015/08/tavuk-sote-yemekcom.jpg'),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: deviceWidth * 0.8,
                  child: Text(
                    'Tavuk Sote',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildInfoRow(
                      icon: 'assets/icons/calories.png',
                      title: '100 kcal',
                    ),
                    _buildInfoRow(
                      icon: 'assets/icons/chronometer.png',
                      title: '10 dk',
                    ),
                    _buildInfoRow(
                      icon: 'assets/icons/person.png',
                      title: '4 kişi',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
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
