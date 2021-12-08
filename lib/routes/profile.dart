import 'package:cs310group28/main.dart';
import 'package:cs310group28/navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cs310group28/routes/login_signup.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _value = false;
  String email = '';
  String password = '';
  final formkey = GlobalKey<FormState>();

  void _signOut() {
    loginStatus = false;
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut().then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return MyHome();
      }));
    });
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationBar(),
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(5.0),
          child: Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 25)),
                        Container(
                          child: Text(
                            "Welcome",
                            style: TextStyle(
                                fontSize: 34, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(left: 25)),
                        Container(
                          child: Text(
                            useremail,
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 1,
                      ),
                      logoutButton(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /* Widget emailFormField() {
    return TextField(
      decoration: InputDecoration(
        fillColor: Colors.grey.withOpacity(0.1),
        filled: true,
        contentPadding:
            new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            borderSide: BorderSide.none),
        hintText: user!.email,
      ),
      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
      // validator: (String? value) {
      //   if (!validateEmail(value!)) {
      //     return "Please use valid email address";
      //   }
      //   return null;
      // },
    );
  }*/

  ElevatedButton logoutButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: new EdgeInsets.symmetric(vertical: 20.0, horizontal: 125.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          )),
      onPressed: () {
        // formkey.currentState!.validate();
        _signOut();
      },
      child: Text(
        "Logout",
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
