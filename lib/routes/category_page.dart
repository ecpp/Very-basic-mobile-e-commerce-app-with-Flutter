import 'dart:async';
import 'package:cs310group28/utils/colors.dart';
import 'package:cs310group28/utils/styles.dart';
import 'package:cs310group28/routes/login_signup.dart';
import 'package:flutter/material.dart';
import 'package:cs310group28/navigation_bar.dart';
import 'package:cs310group28/main.dart';


class Hats extends StatefulWidget {
  @override
  _HatsState createState() => _HatsState();
}

class _HatsState extends State<Hats> {
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:Text('Hats'),centerTitle: true,));
  }
}

class Dresses extends StatefulWidget {
  @override
  _DressesState createState() => _DressesState();
}

class _DressesState extends State<Dresses> {
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:Text('Dresses'),centerTitle: true,));
  }
}

class Skirts extends StatefulWidget {
  @override
  _SkirtsState createState() => _SkirtsState();
}

class _SkirtsState extends State<Skirts> {
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:Text('Skirts'),centerTitle: true,));
  }
}

class Shirts extends StatefulWidget {
  @override
  _ShirtsState createState() => _ShirtsState();
}

class _ShirtsState extends State<Shirts> {
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:Text('Shirts'),centerTitle: true,));
  }
}

class Shoes extends StatefulWidget {
  @override
  _ShoesState createState() => _ShoesState();
}

class _ShoesState extends State<Shoes> {
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:Text('Shoes'),centerTitle: true,));
  }
}

class AllProducts extends StatefulWidget {
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:Text('All Products'),centerTitle: true,));
  }
}