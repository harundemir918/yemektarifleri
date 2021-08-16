import 'package:flutter/material.dart';

import '../../constants.dart';

class CategoriesGridListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dynamicWidth = MediaQuery.of(context).size.width;
    final dynamicHeight = MediaQuery.of(context).size.height;
    Constants _constants = Constants();

    return Container(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: dynamicWidth * 0.45,
                height: dynamicWidth * 0.45,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.network(
                      'https://cdn.yemek.com/mnresize/940/940/uploads/2015/08/tavuk-sote-yemekcom.jpg'),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              child: Container(
                width: dynamicWidth * 0.45,
                height: dynamicHeight * 0.05,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.only(
                top: dynamicHeight * 0.01,
                bottom: dynamicHeight * 0.01,
                left: dynamicWidth * 0.075,
              ),
              child: Text(
                'Tavuk Sote',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
