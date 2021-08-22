import 'package:flutter/material.dart';

class AccountRecipesListCard extends StatelessWidget {
  const AccountRecipesListCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Card(
      child: Container(
        height: deviceHeight * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Container(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Image.network(
                    'https://cdn.yemek.com/mnresize/940/940/uploads/2015/08/tavuk-sote-yemekcom.jpg',
                    width: 150,
                  ),
                ),
              ),
            ),
            Text(
              'Tavuk Sote',
              style: Theme.of(context).textTheme.bodyText1,
              maxLines: 2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.025),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    child: IconButton(
                      onPressed: () {},
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
                      onPressed: () {},
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
    );
  }
}
