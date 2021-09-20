import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../model/category_model.dart';
import '../model/recipe_model.dart';
import '../model/user_model.dart';

class Api {
  int? id;
  String? token;
  int? active;

  setId(id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt('id', id);
  }

  getId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    id = sharedPreferences.getInt('id');
    return id;
  }

  setToken(token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', token);
  }

  getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    return token;
  }

  setActive(active) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt('active', active);
  }

  getActive() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    active = sharedPreferences.getInt('active');
    return active;
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
      var user = UserModel.fromJson(jsonDecode(response.body));
      setId(user.user?.id);
      setToken(user.accessToken);
      setActive(user.user?.active);
      return true;
    } else {
      print('Response: ' + response.body);
    }
    return false;
  }

  Future<bool> register({
    required String name,
    required String email,
    required String password,
    required String passwordAgain,
  }) async {
    var loginUrl = Uri.parse(apiRegisterUrl);
    var response = await http.post(
      loginUrl,
      body: jsonEncode(
        {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordAgain,
        },
      ),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == HttpStatus.created) {
      var user = UserModel.fromJson(jsonDecode(response.body));
      setId(user.user?.id);
      setToken(user.accessToken);
      setActive(user.user?.active);
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
    final recipeUrl = Uri.parse('$apiRecipesUrl/$id');
    final response = await http.get(recipeUrl, headers: {
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

  Future<User> fetchUser(int id) async {
    String token = await getToken();
    final userUrl = Uri.parse('$apiUsersUrl/$id');
    final response = await http.get(userUrl, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == HttpStatus.ok) {
      final result = User.fromJson(jsonDecode(response.body));
      return result;
    } else {
      throw Exception(
          'Response Status: ${response.statusCode}. Failed to get data.');
    }
  }

  Future<List<RecipeModel>> fetchUserRecipes(int id) async {
    List<RecipeModel> userRecipesList = [];

    String token = await getToken();
    final userRecipesUrl = Uri.parse('$apiUsersUrl/$id/recipes');
    final response = await http.get(userRecipesUrl, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == HttpStatus.ok) {
      final result = jsonDecode(response.body);
      result.forEach(
        (recipe) => userRecipesList.add(
          RecipeModel.fromJson(recipe),
        ),
      );
      return userRecipesList;
    } else {
      throw Exception(
          'Response Status: ${response.statusCode}. Failed to get data.');
    }
  }

  Future<bool> postRecipe(RecipeModel recipe) async {
    String token = await getToken();
    var request = http.MultipartRequest("POST", Uri.parse(apiAddRecipeUrl));
    request.fields['user_id'] = recipe.userId.toString();
    request.fields['category'] = recipe.category.toString();
    request.fields['title'] = recipe.title!;
    request.fields['ingredients'] = recipe.ingredients!;
    request.fields['recipe'] = recipe.recipe!;
    request.fields['calories'] = recipe.calories!;
    request.fields['duration'] = recipe.duration!;
    request.fields['person'] = recipe.person!;
    request.fields['carbohydrate'] = recipe.carbohydrate!;
    request.fields['protein'] = recipe.protein!;
    request.fields['fat'] = recipe.fat!;

    if (recipe.picture != null) {
      var pictureFile = File(recipe.picture!);
      var pictureLength = await pictureFile.length();
      var pictureStream = new http.ByteStream(pictureFile.openRead());
      pictureStream.cast();

      request.files.add(
        http.MultipartFile(
          'picture',
          pictureStream,
          pictureLength,
          filename: basename(pictureFile.path),
        ),
      );
    }

    request.headers.addAll({
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var response = await request.send();
    if (response.statusCode == HttpStatus.created) {
      print(await response.stream.bytesToString());
      return true;
    } else {
      print(await response.stream.bytesToString());
      return false;
    }
  }

  Future<bool> updateRecipe(int userId, RecipeModel recipe) async {
    String token = await getToken();
    var request = http.MultipartRequest(
        "POST", Uri.parse('$apiUsersUrl/$userId/recipes/${recipe.id}/edit'));
    request.fields['category'] = recipe.category.toString();
    request.fields['title'] = recipe.title!;
    request.fields['ingredients'] = recipe.ingredients!;
    request.fields['recipe'] = recipe.recipe!;
    request.fields['calories'] = recipe.calories!;
    request.fields['duration'] = recipe.duration!;
    request.fields['person'] = recipe.person!;
    request.fields['carbohydrate'] = recipe.carbohydrate!;
    request.fields['protein'] = recipe.protein!;
    request.fields['fat'] = recipe.fat!;

    if (recipe.picture != null) {
      bool isPictureExist = await File(recipe.picture!).exists();
      if (isPictureExist) {
        var pictureFile = File(recipe.picture!);
        var pictureLength = await pictureFile.length();
        var pictureStream = new http.ByteStream(pictureFile.openRead());
        pictureStream.cast();

        request.files.add(
          http.MultipartFile(
            'picture',
            pictureStream,
            pictureLength,
            filename: basename(pictureFile.path),
          ),
        );
      }
    }

    request.headers.addAll({
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var response = await request.send();
    if (response.statusCode == HttpStatus.ok) {
      print(await response.stream.bytesToString());
      return true;
    } else {
      print(await response.stream.bytesToString());
      return false;
    }
  }

  Future<bool> deleteRecipe(int userId, int recipeId) async {
    String token = await getToken();
    final userRecipeUrl =
        Uri.parse('$apiUsersUrl/$userId/recipes/$recipeId/delete');
    final response = await http.get(userRecipeUrl, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == HttpStatus.ok) {
      return true;
    } else {
      return false;
    }
  }
}
