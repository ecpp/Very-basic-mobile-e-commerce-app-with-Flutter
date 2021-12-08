import 'dart:async';
import 'package:cs310group28/routes/profile.dart';
import 'package:cs310group28/routes/cart_page.dart';
import 'utils/colors.dart';
import 'utils/styles.dart';
import 'routes/login_signup.dart';
import 'package:flutter/material.dart';
import 'package:cs310group28/main.dart';
import 'package:cs310group28/routes/category_page.dart';
import 'package:cs310group28/routes/search_page.dart';
import 'package:cs310group28/routes/profile_page.dart';

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
                title: Text('Login', style: navText),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
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
                    .push(MaterialPageRoute(builder: (context) => MyHome()));
              }),
          if (loginStatus == true)
            ListTile(
                leading: Icon(Icons.account_box),
                title: Text('Profile', style: navText),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                }),
          if (loginStatus == true)
            ListTile(
                leading: const Icon(Icons.local_shipping),
                title: Text('Orders & Returns', style: navText),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                }),
          if (loginStatus == false) Divider(),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Search', style: navText),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SearchPage()));
            },
          ),
          if (loginStatus == false)
            ListTile(
              leading: Icon(Icons.shopping_cart_rounded),
              title: Text('Cart', style: navText),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => CartPage()));
              },
            ),
          Divider(),
          ListTile(
            title: Text('Hats', style: navText),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Hats()));
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
                  .push(MaterialPageRoute(builder: (context) => Skirts()));
            },
          ),
          ListTile(
            title: Text('Shirts', style: navText),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Shirts()));
            },
          ),
          ListTile(
            title: Text('Shoes', style: navText),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Shoes()));
            },
          ),
          Divider(),
          ListTile(
            title: Text('Products', style: navText),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AllProducts()));
            },
          ),
        ],
      ),
    );
  }
}
