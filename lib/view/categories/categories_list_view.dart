import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../viewmodel/category_list_view_model.dart';
import '../widgets/categories_grid_list.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({Key? key}) : super(key: key);

  @override
  _CategoriesListViewState createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  void initState() {
    Provider.of<CategoryListViewModel>(context, listen: false)
        .getAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var categoryViewModel = Provider.of<CategoryListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoriesString,
          style: Theme.of(context).textTheme.headline6,
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: CategoriesGridList(
          categoryList: categoryViewModel.allCategories,
        ),
      ),
    );
  }
}
