import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import '../main.dart';

String signInName = "";

const users = const {
  'asd@gmail.com': '12345',
  'qwe@hotmail.com': 'hunter',
  'anilercan@sabanciuniv.edu': '123'
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  //auth
  Future<String?> _authUser(LoginData data) async {
    loginStatus = true;
    return null;
  }

  Future<String?> _signupUser() async {
    return null;
  }

  //recover pw
  Future<String?> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User does not exist';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      theme: LoginTheme(pageColorLight: Colors.red),

      title: 'Welcome',
      //onLogin: _authUser,
      //onSignup: _authUser,
      /*
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MyApp(),
        ));
      },

       */
      //onRecoverPassword: _recoverPassword,
      userValidator: (value) {
        bool endingDot = false;
        if (value!.endsWith('.com')) {
          endingDot = true;
        }
        if (value.endsWith('.edu')) {
          endingDot = true;
        }
        if (!value.contains('@') || endingDot == false) {
          //!value.endsWith('.com')
          return "Email must contain '@' and end with '.com' or '.edu'";
        }
        return null;
      },
      passwordValidator: (value) {
        if (value!.isEmpty) {
          return 'Password is empty';
        }
        return null;
      },
      onLogin: (loginData) {
        print('Login info');
        print('Name: ${loginData.name}');
        signInName = loginData.name;
        print('Password: ${loginData.password}');
        return _authUser(loginData); //auth
      },
      //signup
      onSignup: (loginData) {
        print('Signup info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _signupUser();
      },

      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MyApp(),
        ));
      },
      onRecoverPassword: (name) {
        print('Recover password info');
        print('Name: $name');
        return _recoverPassword(name);
        // Show new password dialog
      },
      //showDebugButtons: true,
    );
    //);
  }
}
