import 'dart:async';
import 'utils/colors.dart';
import 'utils/styles.dart';
import 'routes/login_signup.dart';
import 'package:flutter/material.dart';
import 'package:cs310group28/main.dart';
import 'package:cs310group28/routes/category_page.dart';

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
                      .push(MaterialPageRoute(builder: (context) => LoginScreen()));
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