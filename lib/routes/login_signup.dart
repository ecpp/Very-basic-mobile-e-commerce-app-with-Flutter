import 'package:cs310group28/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:cs310group28/routes/profile.dart';
import 'package:cs310group28/routes/register_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';



User? user;
String useremail = "aa";
int tries = 0;
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _value = false;
  String email = '';
  String password = '';
  final formkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String error = "";
  static Future<User?> loginEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String loginError;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      loginError = e.message!;
      print(e.message);
      tries = tries +1;
      if(tries == 3)
        FirebaseCrashlytics.instance.crash();

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("CAN'T LOGIN!"),
              content: Text(loginError),


            );
          });
      if (e.code == "user-not-found") {
        SnackBar(content: Text('Login error.'), duration: Duration(seconds: 3));
        print("No user found for that email");
      }
    }
    CircularProgressIndicator();
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                            "Login",
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
                            "Login to experience new ways",
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
                  margin: EdgeInsets.all(25),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      emailFormField(),
                      SizedBox(
                        height: 20,
                      ),
                      passwordFormField(),
                      SizedBox(
                        height: 40,
                      ),
                      submitBtton(),
                      SizedBox(
                        height: 40,
                      ),
                      registerBtton(),
                      SizedBox(
                        height: 40,
                      ),
                      googleSignIn(),
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

  Widget usernameFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        fillColor: Colors.grey.withOpacity(0.1),
        filled: true,
        contentPadding:
            new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            borderSide: BorderSide.none),
        hintText: "User Name",
        prefixIcon: Icon(Icons.person_outline),
      ),
      validator: (String? value) {
        if (value!.length > 20) {
          return "Username must be less than 20 characters";
        }
      },
    );
  }

  Widget emailFormField() {
    return TextField(
      decoration: InputDecoration(
          fillColor: Colors.grey.withOpacity(0.1),
          filled: true,
          contentPadding:
              new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              borderSide: BorderSide.none),
          hintText: "Email ID",
          prefixIcon: Icon(Icons.alternate_email)),
      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
      // validator: (String? value) {
      //   if (!validateEmail(value!)) {
      //     return "Please use valid email address";
      //   }
      //   return null;
      // },
    );
  }

  Widget googleSignIn() {
    return MaterialButton(
        color: Colors.grey[800],
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Image.network(
                  'http://pngimg.com/uploads/google/google_PNG19635.png',
                  height: 30,
                  width: 30),
              SizedBox(width: 12),
              Text('Sign in with Google'),
            ],
          ),
        ),
        onPressed: () {
          signup(context);
        });
  }

  //FIREBASE FOR GOOGLE SIGN-IN
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signup(BuildContext context) async {
    loginStatus = true;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;
      //print("DATALAR");
      //print(result.additionalUserInfo.username);
      print(result.user!.email);
      useremail = result.user!.email!;

      if (user != null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => MyHome()));
      }
    }
  }

  /* Widget phoneNumberFormField() {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.grey.withOpacity(0.1),
        filled: true,
        contentPadding:
            new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            borderSide: BorderSide.none),
        hintText: "Mobile No",
        prefixIcon: Icon(Icons.phone_outlined),
      ),
      keyboardType: TextInputType.number,
      validator: (String? value) {
        if (value![0] != "0") {
          return "Please enter valid mobile number";
        } else if (value.length != 10) {
          return "Mobile Number must be 10 digits";
        }
        return null;
      },
    );
  }*/

  Widget passwordFormField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        fillColor: Colors.grey.withOpacity(0.1),
        filled: true,
        contentPadding:
            new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            borderSide: BorderSide.none),
        hintText: "Enter Password",
        prefixIcon: Icon(Icons.lock_outline),
      ),
      // validator: (value) {
      //   if (!validatePassword(value!)) {
      //     return "Password must be minimum eight characters, at least one uppercase letter, one lowercase letter and one number";
      //   }
      //   return null;
      // },
      keyboardType: TextInputType.visiblePassword,
      controller: _passwordController,
    );
  }

  ElevatedButton submitBtton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: new EdgeInsets.symmetric(vertical: 20.0, horizontal: 125.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          )),
      onPressed: () async {
        // formkey.currentState!.validate();
        loginStatus = true;
        useremail = _emailController.text;
        User? user = await loginEmailPassword(
          email: _emailController.text,
          password: _passwordController.text,
          context: context,
        );
        print(user?.uid);
        if (user != null) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) => MyHome()));
        }
      },
      child: Text(
        "  Login  ",
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  ElevatedButton registerBtton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: new EdgeInsets.symmetric(vertical: 20.0, horizontal: 125.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          )),
      onPressed: () {
        // formkey.currentState!.validate();
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => RegisterScreen()));
      },
      child: Text(
        "Register",
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  bool validateEmail(String value) {
    RegExp regex = new RegExp(r'[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
    return (!regex.hasMatch(value) ? false : true);
  }

  bool validatePassword(String value) {
    RegExp regex = new RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    return (!regex.hasMatch(value) ? false : true);
  }
}
