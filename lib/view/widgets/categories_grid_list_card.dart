import 'package:flutter/material.dart';

import '../recipes/category_recipes_list_view.dart';

class CategoriesGridListCard extends StatelessWidget {
  final category;

  CategoriesGridListCard({
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryRecipesListView(
            categoryId: category.id,
          ),
        ),
      ),
      child: ClipRRect(
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
      ),
    );
  }
}
