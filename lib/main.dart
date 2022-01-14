import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:cs310group28/navigation_bar.dart';
import 'package:cs310group28/routes/cart_page.dart';
import 'package:cs310group28/routes/category_page.dart';
import 'package:cs310group28/routes/login_signup.dart';
import 'package:cs310group28/utils/colors.dart';
import 'package:cs310group28/utils/dimension.dart';
import 'package:cs310group28/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cs310group28/routes/welcome_page.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'onboard/onboard.dart';
import 'services/analytics_service.dart';
import 'package:cs310group28/routes/profile.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

bool loginStatus = false;
int? isViewed;
int launchCount = 0;

Future main() async {
  List list3 = List.empty(growable: true);
  WidgetsFlutterBinding.ensureInitialized();
  setValue();
  //runApp(new MyApp());
  runApp(MaterialApp(
      title: 'CS310 Group 28 Project',
      navigatorObservers: [AnalyticsService().getAnalyticObserver()],
      initialRoute: '/',
      routes: {
        '/': (context) => MyApp(),
        '/HomePage': (context) => MyHome(),
        '/Login': (context) => LoginScreen(),
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



void setValue() async {

  final prefs = await SharedPreferences.getInstance();
  launchCount = prefs.getInt('counter') ?? 0;
  prefs.setInt('counter', launchCount + 1);
  if (launchCount == 0) {
    print("first launch"); //setState to refresh or move to some other page
  } else {
    print("Not first launch");
  }
}



class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Firebase connecting error.");
            return const MaterialApp(
                home: Scaffold(
                    body: Center(
              child: Text('Connection error.'),
            )));
          }
          if (snapshot.connectionState == ConnectionState.done) {
            print("Firebase connecting success!");
            return MaterialApp(
                theme: ThemeData(
                  brightness: Brightness.dark,
                  primaryColor: Colors.orange,
                  //accentColor: Colors.cyan[600],
                  fontFamily: 'Georgia',
                ),
                home: launchCount != 0 ? WelcomePage() : OnBoard());
          }
          return const MaterialApp(
              home: Center(
            child: Text('Connecting to firebase...'),
          ));
        });
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {

    Future<Widget> _getImage(BuildContext context, String imageName) async{
      late Image image;
      await FireStorageService.loadImage(context, imageName).then((value){
        image = Image.network(
          value.toString(),
          fit: BoxFit.scaleDown,
        );
      });
      return image;
    }


    return Scaffold(

      drawer: NavigationBar(),

      appBar: AppBar(
          centerTitle: true,
          title: Text('Home', style: homeText),
          actions: <Widget>[
            /*
            if (loginStatus == false)
              Container(
                  child: Text("Sign in",
                      textAlign: TextAlign.center, style: navText),
                  decoration: BoxDecoration(),
                  margin: Dimen.homepageDefaultPadding),
            if (loginStatus == false)
              IconButton(
                icon: Icon(
                  Icons.login,
                  color: AppColors.navColor,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                  //Navigator.pushNamed(context, '/Login');
                },
              ),
              */
            if (loginStatus == false)
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text("Login",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            if (loginStatus == false)
              IconButton(
                icon: Icon(
                  Icons.login,
                  color: AppColors.navColor,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                  //Navigator.pushNamed(context, '/Login');
                },
              ),
            if (loginStatus == true)
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
                child: const Text("Profile",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            /* if (loginStatus == true)
              IconButton(
                  icon: const Icon(
                    Icons.logout,
                    color: AppColors.navColor,
                  ),
                  onPressed: () {
                    setState(() {
                      loginStatus = false;
                    });
                  }),*/
          ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart_outlined),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CartPage()));
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AllProducts()));
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
            margin: Dimen.mainDefaultMargin,
            //padding: EdgeInsets.all(20.0),
            padding: Dimen.mainDefaultPadding),
        InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Hats()));
          },
          child: Container(
            margin: Dimen.regularPadding,
            width: 300,
            height: 400,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FutureBuilder<Widget>(
                future: _getImage(context, "CategoryHat.jpg"),
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    return Container(
                      width: MediaQuery.of(context).size.width/ 1.2,
                      height: MediaQuery.of(context).size.width/ 1.2,
                      child:  snapshot.data,
                    );
                  }
                  return Container();
                },
              )
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
            margin: Dimen.mainDefaultMargin,
            //padding: EdgeInsets.all(20.0),
            padding: Dimen.mainDefaultPadding),
        InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Dresses()));
          },
          child: Container(
            margin: Dimen.regularPadding,
            width: 300,
            height: 400,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FutureBuilder<Widget>(
                future: _getImage(context, "CategoryDress.jpg"),
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    return Container(
                      width: MediaQuery.of(context).size.width/ 1.2,
                      height: MediaQuery.of(context).size.width/ 1.2,
                      child:  snapshot.data,
                    );
                  }
                  return Container();
                },
              )
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
            margin: Dimen.mainDefaultMargin,
            //padding: EdgeInsets.all(20.0),
            padding: Dimen.mainDefaultPadding),
        InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Skirts()));
          },
          child: Container(
            margin: Dimen.regularPadding,
            width: 300,
            height: 400,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FutureBuilder<Widget>(
                future: _getImage(context, "CategorySkirt.jpg"),
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    return Container(
                      width: MediaQuery.of(context).size.width/ 1.2,
                      height: MediaQuery.of(context).size.width/ 1.2,
                      child:  snapshot.data,
                    );
                  }
                  return Container();
                },
              )
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
            margin: Dimen.mainDefaultMargin,
            //padding: EdgeInsets.all(20.0),
            padding: Dimen.mainDefaultPadding),
        InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Shirts()));
          },
          child: Container(
            margin: Dimen.regularPadding,
            width: 300,
            height: 400,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FutureBuilder<Widget>(
                future: _getImage(context, "CategoryShirt.jpg"),
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    return Container(
                      width: MediaQuery.of(context).size.width/ 1.2,
                      height: MediaQuery.of(context).size.width/ 1.2,
                      child:  snapshot.data,
                    );
                  }
                  return Container();
                },
              )
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
            margin: Dimen.mainDefaultMargin,
            //padding: EdgeInsets.all(20.0),
            padding: Dimen.mainDefaultPadding),
        InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Shoes()));
          },
          child: Container(
            margin: Dimen.regularPadding,
            width: 300,
            height: 400,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FutureBuilder<Widget>(
                future: _getImage(context, "CategoryShoe.jpg"),
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    return Container(
                      width: MediaQuery.of(context).size.width/ 1.2,
                      height: MediaQuery.of(context).size.width/ 1.2,
                      child:  snapshot.data,
                    );
                  }
                  return Container();
                },
              )
            ),
          ),
        ),
      ]),
      //resizeToAvoidBottomInset: false
    );
  }
}

class FireStorageService extends ChangeNotifier{
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context, String Image) async{
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}
