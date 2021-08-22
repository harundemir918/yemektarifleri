import 'package:flutter/material.dart';

import '../widgets/categories_grid_list.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kategoriler',
          style: Theme.of(context).textTheme.headline6,
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: CategoriesGridList(),
      ),
    );
  }
}
