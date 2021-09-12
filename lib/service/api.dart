import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
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

  fetchAllRecipes() async {
    String token = await getToken();
    final recipesUrl = Uri.parse(apiRecipesUrl);
    final response = await http.get(recipesUrl, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(response.body);
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
}
