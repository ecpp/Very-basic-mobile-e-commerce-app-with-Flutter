import 'package:cs310group28/main.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Icon(Icons.shopping_cart_outlined, size: 120),
        Container(
            child: Image.network(
                'https://www.freepngimg.com/thumb/shopping/73432-flame-shopping-cart-icon-free-hq-image.png'),
        margin: EdgeInsets.only(left:30.0,right:30.0)),
        SizedBox(height: 60),
        Center(
          child: Text(
            'Welcome to E-Gayme',
            style: TextStyle(
                color: Colors.white,
                letterSpacing: .6,
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            'E-Commercial App!',
            style: TextStyle(
                color: Colors.white,
                letterSpacing: .6,
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 30),
        OutlinedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyHome()));
            },
            child: Text('Home Page',
                style: TextStyle(
                    color: Colors.white, letterSpacing: .6, fontSize: 16)))
      ],
    )));
  }
}
