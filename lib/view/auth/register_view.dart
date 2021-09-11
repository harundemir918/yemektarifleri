import 'package:flutter/material.dart';

import '../../constants.dart';
import '../widgets/app_logo.dart';
import '../widgets/auth_text_form_field.dart';
import 'login_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _passwordAgainController = TextEditingController();

    final _formKey = GlobalKey<FormState>();
    bool _isLoading = false;

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
                  AuthTextFormField(
                    label: passwordAgainString,
                    controller: _passwordAgainController,
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
                        // if (_formKey.currentState!.validate()) {
                        //   setState(() {
                        //     _isLoading = true;
                        //   });
                        //   Api api = Api();
                        //   bool _isLoggedIn = await api.logIn(
                        //       email: _email.text.toString(),
                        //       password: _password.text.toString());
                        //   if (_isLoggedIn) {
                        //     setState(() {
                        //       _isLoading = false;
                        //     });
                        //     Navigator.pushReplacement(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => HomeView(),
                        //       ),
                        //     );
                        //   } else {
                        //     setState(() {
                        //       _isLoading = false;
                        //     });
                        //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //       content: Text("Bilgilerinizi kontrol ediniz."),
                        //     ));
                        //   }
                        // }
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(primary: Colors.transparent),
                      child: Text(
                        doYouHaveAnAccountString,
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginView(),
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
