import 'package:flutter/material.dart';

import '../model/user_model.dart';
import '../service/api.dart';
import 'user_view_model.dart';

enum LoadingStatus { completed, searching, empty }

class UserListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  UserViewModel user = UserViewModel();
  List<UserViewModel> lastAddedUsers = [];
  List<UserViewModel> recommendedUsers = [];
  List<UserViewModel> categoryUsers = [];

  void getUser(int id) async {
    User user = await Api().fetchUser(id);
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.user = UserViewModel(user: user);
    if (this.user.id == null) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }

  // void getLastAddedUsers() async {
  //   List<UserModel> recipesList = await Api().fetchLastAddedUsers();
  //   loadingStatus = LoadingStatus.searching;
  //   notifyListeners();
  //
  //   this.lastAddedUsers =
  //       recipesList.map((recipe) => UserViewModel(recipe: recipe)).toList();
  //   if (this.lastAddedUsers.isEmpty) {
  //     this.loadingStatus = LoadingStatus.empty;
  //   } else {
  //     this.loadingStatus = LoadingStatus.completed;
  //   }
  //   notifyListeners();
  // }
}
