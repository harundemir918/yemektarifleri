import 'package:flutter/material.dart';

class CategoriesListCard extends StatelessWidget {
  final category;

  CategoriesListCard({
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: deviceWidth * 0.5,
            height: deviceHeight * 0.15,
            color: Colors.white,
            child: GridTile(
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Image.network(
                  category.picture,
                ),
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                title: Text(category.title),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
