import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'view/auth/login_view.dart';
import 'viewmodel/category_list_view_model.dart';
import 'viewmodel/recipe_list_view_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => RecipeListViewModel(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => CategoryListViewModel(),
        ),
      ],
      child: MaterialApp(
        title: appName,
        home: LoginView(),
      ),
    );
  }
}
