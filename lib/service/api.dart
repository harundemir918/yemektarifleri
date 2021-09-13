import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../model/category_model.dart';
import '../model/recipe_model.dart';
import '../model/user_model.dart';

class Api {
  String token = '';

  setToken(token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', token);
  }

  getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token')!;
    return token;
  }

  Future<bool> logIn({required String email, required String password}) async {
    var loginUrl = Uri.parse(apiLoginUrl);
    var response = await http.post(
      loginUrl,
      body: jsonEncode(
        {
          'email': email,
          'password': password,
        },
      ),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == HttpStatus.ok) {
      print('Response: ' + response.body);
      var user = UserModel.fromJson(jsonDecode(response.body));
      setToken(user.accessToken);
      print(user.accessToken);
      return true;
    } else {
      print('Response: ' + response.body);
    }
    return false;
  }

  Future<List<RecipeModel>> fetchAllRecipes() async {
    List<RecipeModel> allRecipesList = [];

    String token = await getToken();
    final recipesUrl = Uri.parse(apiRecipesUrl);
    final response = await http.get(recipesUrl, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == HttpStatus.ok) {
      final result = jsonDecode(response.body);
      result.forEach(
        (recipe) => allRecipesList.add(
          RecipeModel.fromJson(recipe),
        ),
      );
      return allRecipesList;
    } else {
      throw Exception(
          'Response Status: ${response.statusCode}. Failed to get data.');
    }
  }

  Future<List<RecipeModel>> fetchRecommendedRecipes() async {
    List<RecipeModel> recommendedRecipesList = [];

    String token = await getToken();
    final lastAddedRecipesUrl = Uri.parse(apiRecommendedRecipesUrl);
    final response = await http.get(lastAddedRecipesUrl, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == HttpStatus.ok) {
      final result = jsonDecode(response.body);
      result.forEach(
        (recipe) => recommendedRecipesList.add(
          RecipeModel.fromJson(recipe),
        ),
      );
      return recommendedRecipesList;
    } else {
      throw Exception(
          'Response Status: ${response.statusCode}. Failed to get data.');
    }
  }

  Future<List<RecipeModel>> fetchLastAddedRecipes() async {
    List<RecipeModel> lastAddedRecipesList = [];

    String token = await getToken();
    final lastAddedRecipesUrl = Uri.parse(apiLastAddedRecipesUrl);
    final response = await http.get(lastAddedRecipesUrl, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == HttpStatus.ok) {
      final result = jsonDecode(response.body);
      result.forEach(
        (recipe) => lastAddedRecipesList.add(
          RecipeModel.fromJson(recipe),
        ),
      );
      return lastAddedRecipesList;
    } else {
      throw Exception(
          'Response Status: ${response.statusCode}. Failed to get data.');
    }
  }

  Future<RecipeModel> fetchRecipe(int id) async {
    String token = await getToken();
    final lastAddedRecipesUrl = Uri.parse('$apiRecipesUrl/$id');
    final response = await http.get(lastAddedRecipesUrl, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == HttpStatus.ok) {
      final result = RecipeModel.fromJson(jsonDecode(response.body));
      return result;
    } else {
      throw Exception(
          'Response Status: ${response.statusCode}. Failed to get data.');
    }
  }

  Future<List<CategoryModel>> fetchAllCategories() async {
    List<CategoryModel> categoriesList = [];

    String token = await getToken();
    final categoriesUrl = Uri.parse(apiCategoriesUrl);
    final response = await http.get(categoriesUrl, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == HttpStatus.ok) {
      final result = jsonDecode(response.body);
      result.forEach(
        (recipe) => categoriesList.add(
          CategoryModel.fromJson(recipe),
        ),
      );
      return categoriesList;
    } else {
      throw Exception(
          'Response Status: ${response.statusCode}. Failed to get data.');
    }
  }

  Future<List<CategoryModel>> fetchLastAddedCategories() async {
    List<CategoryModel> lastAddedCategoriesList = [];

    String token = await getToken();
    final categoriesUrl = Uri.parse(apiLastAddedCategoriesUrl);
    final response = await http.get(categoriesUrl, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == HttpStatus.ok) {
      final result = jsonDecode(response.body);
      result.forEach(
        (recipe) => lastAddedCategoriesList.add(
          CategoryModel.fromJson(recipe),
        ),
      );
      return lastAddedCategoriesList;
    } else {
      throw Exception(
          'Response Status: ${response.statusCode}. Failed to get data.');
    }
  }

  Future<List<RecipeModel>> fetchCategoryRecipes(int id) async {
    List<RecipeModel> categoryRecipesList = [];

    String token = await getToken();
    final recipesUrl = Uri.parse('$apiCategoriesUrl/$id/recipes');
    final response = await http.get(recipesUrl, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == HttpStatus.ok) {
      final result = jsonDecode(response.body);
      result.forEach(
        (recipe) => categoryRecipesList.add(
          RecipeModel.fromJson(recipe),
        ),
      );
      return categoryRecipesList;
    } else {
      throw Exception(
          'Response Status: ${response.statusCode}. Failed to get data.');
    }
  }
}
