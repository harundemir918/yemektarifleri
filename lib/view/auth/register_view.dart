import 'package:flutter/material.dart';

import '../../constants.dart';
import '../widgets/app_logo.dart';
import '../widgets/auth_text_form_field.dart';
import 'login_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Constants _constants = Constants();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 40,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(height: 25),
              AppLogo(),
              Container(height: 5),
              Text(
                _constants.createNewAccountString,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Spacer(),
              AuthTextFormField(
                label: _constants.emailString,
                obscured: false,
              ),
              Container(height: 25),
              AuthTextFormField(
                label: _constants.passwordString,
                obscured: true,
              ),
              Container(height: 25),
              AuthTextFormField(
                label: _constants.passwordAgainString,
                obscured: true,
              ),
              Container(height: 25),
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
                    _constants.signUpString,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.transparent,
                  ),
                  child: Text(
                    _constants.doYouHaveAnAccountString,
                    style: TextStyle(
                      color: Colors.red,
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
              Container(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
