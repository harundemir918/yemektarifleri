import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../service/api.dart';
import '../home/home_view.dart';
import '../widgets/app_logo.dart';
import '../widgets/auth_text_form_field.dart';
import 'register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 40,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _formKey,
            child: Container(
              child: Column(
                children: [
                  Container(height: 25),
                  AppLogo(),
                  Container(height: 5),
                  Text(
                    loginToYourAccountString,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Spacer(),
                  AuthTextFormField(
                    label: emailString,
                    controller: _emailController,
                    keyboard: TextInputType.emailAddress,
                    obscured: false,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  AuthTextFormField(
                    label: passwordString,
                    controller: _passwordController,
                    keyboard: TextInputType.text,
                    obscured: true,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        loginString,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });
                          Api api = Api();
                          bool _isLoggedIn = await api.logIn(
                              email: _emailController.text.toString(),
                              password: _passwordController.text.toString());
                          if (_isLoggedIn) {
                            setState(() {
                              _isLoading = false;
                            });
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeView(),
                              ),
                            );
                          } else {
                            setState(() {
                              _isLoading = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Bilgilerinizi kontrol ediniz."),
                            ));
                          }
                        }
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(primary: Colors.transparent),
                      child: Text(
                        doNotYouHaveAnAccountString,
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterView(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _isLoading == true
                      ? CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color?>(primaryColor),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
