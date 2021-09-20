import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../service/api.dart';
import '../add_recipe/edit_recipe_view.dart';

class AccountRecipesListCard extends StatelessWidget {
  final recipe;

  AccountRecipesListCard({
    this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Dismissible(
      key: ValueKey(recipe.id),
      background: Card(
        color: Theme.of(context).errorColor,
        child: Container(
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
          alignment: Alignment.centerRight,
          margin: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4,
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Silme'),
            content: Text('Tarifi silmek istediğinizden emin misiniz?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('Hayır'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('Evet'),
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) async {
        var userId = await Api().getId();
        var isDeleted = await Api().deleteRecipe(userId, recipe.id);
        if (isDeleted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Silme başarılı.'),
              duration: Duration(seconds: 1),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Bir hata oluştu.'),
              duration: Duration(seconds: 1),
            ),
          );
        }
      },
      child: Card(
        child: Container(
          height: deviceHeight * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Container(
                  width: deviceWidth * 0.25,
                  height: deviceHeight * 0.25,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child:
                        Image.network('$apiRecipeImagesUrl/${recipe.picture}'),
                  ),
                ),
              ),
              Container(
                width: deviceWidth * 0.25,
                child: Text(
                  recipe.title,
                  style: Theme.of(context).textTheme.bodyText1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.025),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditRecipeView(recipe),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.deepOrange,
                      child: IconButton(
                        onPressed: () async {
                          var userId = await Api().getId();
                          var isDeleted =
                              await Api().deleteRecipe(userId, recipe.id);
                          if (isDeleted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Silme başarılı.'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Bir hata oluştu.'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          }
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
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
}
