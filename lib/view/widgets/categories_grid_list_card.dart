import 'package:flutter/material.dart';

class CategoriesGridListCard extends StatelessWidget {
  final category;

  CategoriesGridListCard({
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: FittedBox(
          fit: BoxFit.cover,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(50),
            child: Image.network(
              category.picture,
            ),
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(category.title),
        ),
      ),
    );
  }
}
