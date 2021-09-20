import 'package:flutter/material.dart';

import '../model/recipe_model.dart';
import '../service/api.dart';
import 'recipe_view_model.dart';

enum LoadingStatus { completed, searching, empty }

class RecipeListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<RecipeViewModel> allRecipes = [];
  List<RecipeViewModel> lastAddedRecipes = [];
  List<RecipeViewModel> recommendedRecipes = [];
  List<RecipeViewModel> categoryRecipes = [];
  List<RecipeViewModel> userRecipes = [];

  void getAllRecipes() async {
    List<RecipeModel> recipesList = await Api().fetchAllRecipes();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.allRecipes =
        recipesList.map((recipe) => RecipeViewModel(recipe: recipe)).toList();
    if (this.allRecipes.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }

  void getLastAddedRecipes() async {
    List<RecipeModel> recipesList = await Api().fetchLastAddedRecipes();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.lastAddedRecipes =
        recipesList.map((recipe) => RecipeViewModel(recipe: recipe)).toList();
    if (this.lastAddedRecipes.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }

  void getRecommendedRecipes() async {
    List<RecipeModel> recipesList = await Api().fetchRecommendedRecipes();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.recommendedRecipes =
        recipesList.map((recipe) => RecipeViewModel(recipe: recipe)).toList();
    if (this.recommendedRecipes.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }

  void getCategoryRecipes(int id) async {
    List<RecipeModel> recipesList = await Api().fetchCategoryRecipes(id);
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.categoryRecipes =
        recipesList.map((recipe) => RecipeViewModel(recipe: recipe)).toList();
    if (this.categoryRecipes.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }

  void getUserRecipes(int id) async {
    List<RecipeModel> recipesList = await Api().fetchUserRecipes(id);
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.userRecipes =
        recipesList.map((recipe) => RecipeViewModel(recipe: recipe)).toList();
    if (this.userRecipes.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }

  Future<bool> postRecipe(RecipeModel recipe) async {
    loadingStatus = LoadingStatus.searching;
    var response = await Api().postRecipe(recipe);
    notifyListeners();

    if (response) {
      this.loadingStatus = LoadingStatus.completed;
      return true;
    } else {
      this.loadingStatus = LoadingStatus.empty;
      return false;
    }
  }

  Future<bool> updateRecipe(int userId, RecipeModel recipe) async {
    loadingStatus = LoadingStatus.searching;
    var response = await Api().updateRecipe(userId, recipe);
    notifyListeners();

    if (response) {
      this.loadingStatus = LoadingStatus.completed;
      return true;
    } else {
      this.loadingStatus = LoadingStatus.empty;
      return false;
    }
  }

  Future<bool> deleteUserRecipe(int userId, int recipeId) async {
    loadingStatus = LoadingStatus.searching;
    var response = await Api().deleteRecipe(userId, recipeId);
    notifyListeners();

    if (response) {
      this.loadingStatus = LoadingStatus.completed;
      return true;
    } else {
      this.loadingStatus = LoadingStatus.empty;
      return false;
    }
  }
}
