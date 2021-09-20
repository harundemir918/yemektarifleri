import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/home_view.dart';
import 'login_view.dart';

class WrapperView extends StatefulWidget {
  const WrapperView({Key? key}) : super(key: key);

  @override
  _WrapperViewState createState() => _WrapperViewState();
}

class _WrapperViewState extends State<WrapperView> {
  String? userToken;

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      userToken = prefs.getString('token') ?? null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (userToken == null || userToken!.isEmpty) {
      return LoginView();
    } else {
      return HomeView();
    }
  }
}
