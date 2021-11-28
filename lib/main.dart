import 'dart:async';
import 'utils/colors.dart';
import 'utils/styles.dart';
import 'login_signup.dart';
//test 123
import 'package:flutter/material.dart';

bool loginStatus = false;
//saaassasaasda

class NavigationBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(),
          if (loginStatus == false)
            ListTile(
                leading: Icon(Icons.login),
                title: Text('Sign In', style: navText),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => LogIn()));
                }),
          if (loginStatus == true)
            ListTile(
                title: Text('Welcome ' + '!', style: TextStyle(fontSize: 25))),
          if (loginStatus == true) Divider(),
          ListTile(
              leading: Icon(Icons.home),
              title: Text('Home Page', style: navText),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyApp()));
              }),
          if (loginStatus == true)
            ListTile(
                leading: Icon(Icons.account_box),
                title: Text('Profile', style: navText),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Dresses()));
                }),
          if (loginStatus == true)
            ListTile(
                leading: const Icon(Icons.local_shipping),
                title: const Text('Orders & Returns', style: TextStyle(fontSize: 25)),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Dresses()));
                }),

          if (loginStatus == false) Divider(),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Search', style: navText),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Dresses()));
            },
          ),
          if (loginStatus == false)
            ListTile(
              leading: Icon(Icons.shopping_cart_rounded),
              title: Text('Cart', style: navText),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Dresses()));
              },
            ),
          Divider(),
          ListTile(
            title: Text('Hats', style: navText),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Dresses()));
            },
          ),
          ListTile(
            title: Text('Dresses', style: navText),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Dresses()));
            },
          ),
          ListTile(
            title: Text('Skirts', style: navText),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Dresses()));
            },
          ),
          ListTile(
            title: Text('Shirts', style: navText),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Dresses()));
            },
          ),
          ListTile(
            title: Text('Shoes', style: navText),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Dresses()));
            },
          ),
          Divider(),
          ListTile(
            title: Text('Products', style: navText),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Dresses()));
            },
          ),
        ],
      ),
    );
  }
}

Future main() async {
  List list3 = List.empty(growable: true);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.orange,
          accentColor: Colors.cyan[600],
          fontFamily: 'Georgia',
        ),
        home: MyHome());
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationBar(),

      appBar: AppBar(
          centerTitle: true,
          title: Text('Home', style: homeText),
          actions: <Widget>[
            if (loginStatus == false)
              Container(
                  child: Text("Sign in",
                      textAlign: TextAlign.center,
                      style: navText),
                  decoration: BoxDecoration(),
                  margin: EdgeInsets.only(left: 10.0, top: 17.0)),
            if (loginStatus == false)
              IconButton(
                icon: Icon(
                  Icons.login,
                  color: AppColors.navColor,
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            if (loginStatus == true)
              Container(
                  child: Text("Sign out",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18)),
                  decoration: BoxDecoration(),
                  margin: EdgeInsets.only(left: 10.0, top: 17.0)),
            if (loginStatus == true)
              IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: AppColors.navColor,
                  ),
                  onPressed: () {
                    setState(() {
                      loginStatus = false;
                    });
                  }),
          ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart_outlined),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Dresses()));
        },
      ),
      body: ListView(children: [
        Container(
          child: ElevatedButton(
              child: Text('Products',
                  textAlign: TextAlign.center,
                  style: navTextBlack),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                primary: Colors.cyan, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Dresses()));
              }),
          //margin: EdgeInsets.only(top:15.0),
          margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
          width: 50.0,
          height: 70.0,
        ),
        Container(
            child: Text('Hats',
                textAlign: TextAlign.center,
                style: navTextBlack),
            //color: Colors.lightBlue,
            decoration: BoxDecoration(
                //shape: BoxShape.rectangle,
                color: AppColors.titleBackColor,
                border: Border.all(width: 4, color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.only(
                top: 30.0, bottom: 5.0, left: 15.0, right: 15.0),
            //padding: EdgeInsets.all(20.0),
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0)),
        InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Dresses()));
          },
          child: Container(
            margin: EdgeInsets.all(10.0),
            width: 300,
            height: 400,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('assets/CategoryHat.jpg', fit: BoxFit.cover),
            ),
          ),
        ),
        Container(
            child: Text('Dresses',
                textAlign: TextAlign.center,
                style: navTextBlack),
            //color: Colors.lightBlue,
            decoration: BoxDecoration(
                //shape: BoxShape.rectangle,
                color: AppColors.titleBackColor,
                border: Border.all(width: 4, color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.only(
                top: 50.0, bottom: 5.0, left: 15.0, right: 15.0),
            //padding: EdgeInsets.all(20.0),
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0)),
        InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Dresses()));
          },
          child: Container(
            margin: EdgeInsets.all(10.0),
            width: 300,
            height: 400,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('assets/CategoryDress.jpg', fit: BoxFit.cover),
            ),
          ),
        ),
        Container(
            child: Text('Skirts',
                textAlign: TextAlign.center,
                style: navTextBlack),
            //color: Colors.lightBlue,
            decoration: BoxDecoration(
                //shape: BoxShape.rectangle,
                color: AppColors.titleBackColor,
                border: Border.all(width: 4, color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.only(
                top: 50.0, bottom: 5.0, left: 15.0, right: 15.0),
            //padding: EdgeInsets.all(20.0),
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0)),
        InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Dresses()));
          },
          child: Container(
            margin: EdgeInsets.all(10.0),
            width: 300,
            height: 400,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('assets/CategorySkirt.jpg', fit: BoxFit.fill),
            ),
          ),
        ),
        Container(
            child: Text('Shirts',
                textAlign: TextAlign.center,
                style: navTextBlack),
            //color: Colors.lightBlue,
            decoration: BoxDecoration(
                //shape: BoxShape.rectangle,
                color: AppColors.titleBackColor,
                border: Border.all(width: 4, color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.only(
                top: 50.0, bottom: 5.0, left: 15.0, right: 15.0),
            //padding: EdgeInsets.all(20.0),
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0)),
        InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Dresses()));
          },
          child: Container(
            margin: EdgeInsets.all(10.0),
            width: 300,
            height: 400,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('assets/CategoryShirt.jpg', fit: BoxFit.fill),
            ),
          ),
        ),
        Container(
            child: Text('Shoes',
                textAlign: TextAlign.center,
                style: navTextBlack),
            //color: Colors.lightBlue,
            decoration: BoxDecoration(
                //shape: BoxShape.rectangle,
                color: AppColors.titleBackColor,
                border: Border.all(width: 4, color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.only(
                top: 50.0, bottom: 5.0, left: 15.0, right: 15.0),
            //padding: EdgeInsets.all(20.0),
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0)),
        InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Dresses()));
          },
          child: Container(
            margin: EdgeInsets.all(10.0),
            width: 300,
            height: 400,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('assets/CategoryShoe.jpg', fit: BoxFit.cover),
            ),
          ),
        ),
      ]),
      //resizeToAvoidBottomInset: false
    );
  }
}

const users = const {
  'asd@gmail.com': '12345',
  'qwe@hotmail.com': 'hunter',
  'anilercan@sabanciuniv.edu': '123'
};

String signInName = "";

//late Future<String> a;

class Dresses extends StatefulWidget {
  @override
  _DressesState createState() => _DressesState();
}

class _DressesState extends State<Dresses> {
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(top: 30.0),
            padding: EdgeInsets.all(40.0),
            decoration: BoxDecoration(color: Colors.pinkAccent),
            child: TextFormField()));
  }
}
