import 'package:flutter/material.dart';
import 'package:yemektarifleri/view/recipes/category_recipes_list_view.dart';

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
        InkWell(
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
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
