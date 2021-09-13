import 'package:flutter/material.dart';

import '../model/category_model.dart';
import '../service/api.dart';
import 'category_view_model.dart';

enum LoadingStatus { completed, searching, empty }

class CategoryListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<CategoryViewModel> allCategories = [];
  List<CategoryViewModel> lastAddedCategories = [];

  void getAllCategories() async {
    List<CategoryModel> allCategoriesList = await Api().fetchAllCategories();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.allCategories = allCategoriesList
        .map((category) => CategoryViewModel(category: category))
        .toList();
    if (this.allCategories.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }

  void getLastAddedCategories() async {
    List<CategoryModel> lastAddedCategoriesList =
        await Api().fetchLastAddedCategories();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.lastAddedCategories = lastAddedCategoriesList
        .map((category) => CategoryViewModel(category: category))
        .toList();
    if (this.lastAddedCategories.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
