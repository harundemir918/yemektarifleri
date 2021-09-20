import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../service/api.dart';
import '../../viewmodel/user_list_view_model.dart';
import '../auth/login_view.dart';
import 'account_recipes_view.dart';

class AccountView extends StatefulWidget {
  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  void initState() {
    getUser();
    super.initState();
  }

  getUser() async {
    var userId = await Api().getId();
    Provider.of<UserListViewModel>(context, listen: false).getUser(userId);
  }

  @override
  Widget build(BuildContext context) {
    var userViewModel = Provider.of<UserListViewModel>(context);
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      height: deviceHeight,
      width: deviceWidth,
      child: Center(
        child: ListView(
          padding: EdgeInsets.fromLTRB(24, 36, 24, 24),
          children: [
            Card(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: userViewModel.user.avatar != null
                        ? Image.network(
                            userViewModel.user.avatar!,
                            height: 100,
                            width: 100,
                          )
                        : Image.asset(
                            'assets/icons/userprofile.png',
                            height: 100,
                            width: 100,
                          ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userViewModel.user.name!,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(userViewModel.user.email!),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AccountRecipesView(
                              userId: userViewModel.user.id!,
                            ),
                          ),
                        );
                      },
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      title: Text('Tariflerim'),
                      trailing: Icon(
                        Icons.chevron_right,
                        size: 20,
                      ),
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: TextButton(
                        onPressed: () async {
                          await Api().setToken('');
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginView(),
                            ),
                          );
                        },
                        child: Text(
                          "Çıkış Yap",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
