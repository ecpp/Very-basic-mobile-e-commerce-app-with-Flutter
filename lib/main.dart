import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cs310group28/navigation_bar.dart';
import 'package:cs310group28/routes/category_page.dart';
import 'package:cs310group28/routes/login_signup.dart';
import 'package:cs310group28/utils/colors.dart';
import 'package:cs310group28/utils/styles.dart';

bool loginStatus = false;

Future main() async {
  List list3 = List.empty(growable: true);
  WidgetsFlutterBinding.ensureInitialized();
  //runApp(new MyApp());
  runApp(
      MaterialApp(title: 'CS310 Group 28 Project', initialRoute: '/', routes: {
    '/': (context) => MyApp(),
    '/HomePage': (context) => MyHome(),
    '/login': (context) => LoginScreen(),
    '/Hats': (context) => Hats(),
    '/Dresses': (context) => Dresses(),
    '/Skirts': (context) => Skirts(),
    '/Shirts': (context) => Shirts(),
    '/Shoes': (context) => Shoes(),
  }));
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
          //accentColor: Colors.cyan[600],
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
                      textAlign: TextAlign.center, style: navText),
                  decoration: BoxDecoration(),
                  margin: EdgeInsets.only(left: 10.0, top: 17.0)),
            if (loginStatus == false)
              IconButton(
                icon: Icon(
                  Icons.login,
                  color: AppColors.navColor,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                  //Navigator.pushNamed(context, '/login');
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
                  textAlign: TextAlign.center, style: navTextBlack),
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
            child:
                Text('Hats', textAlign: TextAlign.center, style: navTextBlack),
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
                textAlign: TextAlign.center, style: navTextBlack),
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
                textAlign: TextAlign.center, style: navTextBlack),
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
                textAlign: TextAlign.center, style: navTextBlack),
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
            child:
                Text('Shoes', textAlign: TextAlign.center, style: navTextBlack),
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
