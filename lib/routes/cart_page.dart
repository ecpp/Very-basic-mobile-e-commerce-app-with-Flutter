import 'package:flutter/material.dart';

import '../main.dart';
import 'category_page.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Cart Page'),
      centerTitle: true,
    ),
      body: ListView(children: <Widget>[
        if (shoppingCart.length == 0)
          ListTile(
              title: Text("The cart is currently empty",
                  style: TextStyle(fontSize: 20))),
        if (shoppingCart.length != 0)
          for (var item in shoppingCart)
            ListTile(
              leading: Text(item.productname.toString(),
                  style: TextStyle(fontSize: 20)),
              title: Text("      \$" + item.cost.toString(),
                  textAlign: TextAlign.end, style: TextStyle(fontSize: 20)),
              trailing: Icon(Icons.remove_circle_rounded),
              onTap: () {
                setState(() {
                  shoppingCart.remove(item);
                  totalCost = totalCost - item.cost;
                });
              },
            ),
      ]),
      bottomNavigationBar: BottomAppBar(
          elevation: 50,
          //color: Colors.indigo,
          child: Container(
              height: 60,
              padding: EdgeInsets.only(left: 10.0),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(color: Colors.indigo),
              child: Text('Total cost of cart: ',
                  style: TextStyle(fontSize: 25)))),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 20,
        onPressed: () {
          if (loginStatus == true)
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => MyHome()));
          else
            (null);
        },
        label:
        Text(totalCost.toStringAsFixed(2), style: TextStyle(fontSize: 25)),
        backgroundColor: Colors.deepPurple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
