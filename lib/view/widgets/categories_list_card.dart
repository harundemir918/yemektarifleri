import 'package:flutter/material.dart';

class CategoriesListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(right: 10),
      width: deviceWidth * 0.5,
      height: deviceHeight * 0.15,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Image.network(
              'https://cdn.yemek.com/mnresize/940/940/uploads/2015/08/tavuk-sote-yemekcom.jpg',
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text('Tavuk Sote'),
          ),
        ),
      ),
    );
  }
}
