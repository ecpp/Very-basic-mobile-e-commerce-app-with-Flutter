import 'dart:async';

import 'package:cs310group28/main.dart';
import 'package:cs310group28/utils/dimension.dart';
import 'package:flutter/material.dart';

List shoppingCart = [];
double totalCost = 0;

class Product {
  String productname;
  int cost;
  String searchname;

  Product({
    required this.productname,
    required this.cost,
    required this.searchname,
  });
}

Future<Widget> _getImage(BuildContext context, String imageName) async {
  late Image image;
  await FireStorageService.loadImage(context, imageName).then((value) {
    image = Image.network(
      value.toString(),
      fit: BoxFit.fill,
    );
  });
  return image;
}

class Hats extends StatefulWidget {
  @override
  _HatsState createState() => _HatsState();
}

class _HatsState extends State<Hats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hats'),
          centerTitle: true,
        ),
        body: ListView(children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              //Image(image: AssetImage('assets/'+item['productname']+'.jpg'))
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      width: 350,
                      height: 350,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          margin: Dimen.regularPadding,
                          width: 300,
                          height: 300,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: FutureBuilder<Widget>(
                                future: _getImage(context, "BarbourTrilby.jpg"),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.width / 2,
                                      child: snapshot.data,
                                    );
                                  }
                                  return Container();
                                },
                              )),
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 20.0, top: 20.0)),
                ),
                const Text("Barbour Trilby",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                const ListTile(
                  title: Text(
                      "Perfect hat to wear during solving detective cases!",
                      style: TextStyle(fontSize: 15.0)),
                ),
                ListTile(
                    title: const Text("Price: \$25",
                        style: TextStyle(fontSize: 20.0)),
                    trailing: const Icon(Icons.add_box_rounded),
                    onTap: () {
                      setState(() {
                        Product temp =
                            Product(productname: "Barbour Trilby", cost: 25,searchname: "BarbourTrilby");
                        shoppingCart.add(temp);
                        totalCost = totalCost + temp.cost;
                      });
                    })
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              //Image(image: AssetImage('assets/'+item['productname']+'.jpg'))
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      width: 350,
                      height: 350,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          margin: Dimen.regularPadding,
                          width: 300,
                          height: 300,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: FutureBuilder<Widget>(
                                future: _getImage(context, "OldWest.jpg"),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.width / 2,
                                      child: snapshot.data,
                                    );
                                  }
                                  return Container();
                                },
                              )),
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 20.0, top: 20.0)),
                ),
                const Text("Old West",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                const ListTile(
                  title: Text("All you need for a day under the sun!",
                      style: TextStyle(fontSize: 15.0)),
                ),
                ListTile(
                    title: const Text("Price: \$15",
                        style: TextStyle(fontSize: 20.0)),
                    trailing: const Icon(Icons.add_box_rounded),
                    onTap: () {
                      setState(() {
                        Product temp =
                            Product(productname: "Old West", cost: 15,searchname: "OldWest");
                        shoppingCart.add(temp);
                        totalCost = totalCost + temp.cost;
                      });
                    })
              ],
            ),
          )
        ]));
  }
}

class Dresses extends StatefulWidget {
  @override
  _DressesState createState() => _DressesState();
}

class _DressesState extends State<Dresses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dresses'),
          centerTitle: true,
        ),
        body: ListView(children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      width: 350,
                      height: 350,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          margin: Dimen.regularPadding,
                          width: 300,
                          height: 300,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: FutureBuilder<Widget>(
                                future: _getImage(context, "FlowerField.jpg"),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.width / 2,
                                      child: snapshot.data,
                                    );
                                  }
                                  return Container();
                                },
                              )),
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 20.0, top: 20.0)),
                ),
                const Text("Flower Field",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                const ListTile(
                  title: Text(
                      "A white and red one piece dress for casual days!",
                      style: TextStyle(fontSize: 15.0)),
                ),
                ListTile(
                    title: const Text("Price: \$30",
                        style: TextStyle(fontSize: 20.0)),
                    trailing: const Icon(Icons.add_box_rounded),
                    onTap: () {
                      setState(() {
                        Product temp =
                            Product(productname: "Flower Field", cost: 30, searchname: "FlowerField");
                        shoppingCart.add(temp);
                        totalCost = totalCost + temp.cost;
                      });
                    })
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      width: 350,
                      height: 350,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          margin: Dimen.regularPadding,
                          width: 300,
                          height: 300,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: FutureBuilder<Widget>(
                                future: _getImage(context, "SpringBreeze.jpg"),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.width / 2,
                                      child: snapshot.data,
                                    );
                                  }
                                  return Container();
                                },
                              )),
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 20.0, top: 20.0)),
                ),
                const Text("Spring Breeze",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                const ListTile(
                  title: Text(
                      "A fresh one piece to wear in fresh spring breeze!",
                      style: TextStyle(fontSize: 15.0)),
                ),
                ListTile(
                    title: const Text("Price: \$40",
                        style: TextStyle(fontSize: 20.0)),
                    trailing: const Icon(Icons.add_box_rounded),
                    onTap: () {
                      setState(() {
                        Product temp =
                            Product(productname: "Spring Breeze", cost: 40, searchname: "SpringBreeze");
                        shoppingCart.add(temp);
                        totalCost = totalCost + temp.cost;
                      });
                    })
              ],
            ),
          )
        ]));
  }
}

class Skirts extends StatefulWidget {
  @override
  _SkirtsState createState() => _SkirtsState();
}

class _SkirtsState extends State<Skirts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Skirts'),
          centerTitle: true,
        ),
        body: ListView(children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      width: 350,
                      height: 350,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          margin: Dimen.regularPadding,
                          width: 300,
                          height: 300,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: FutureBuilder<Widget>(
                                future: _getImage(context, "Alexis.jpg"),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.width / 2,
                                      child: snapshot.data,
                                    );
                                  }
                                  return Container();
                                },
                              )),
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 20.0, top: 20.0)),
                ),
                const Text("Alexis",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                const ListTile(
                  title: Text("A stylish skirt for casual wear!",
                      style: TextStyle(fontSize: 15.0)),
                ),
                ListTile(
                    title: const Text("Price: \$30",
                        style: TextStyle(fontSize: 20.0)),
                    trailing: const Icon(Icons.add_box_rounded),
                    onTap: () {
                      setState(() {
                        Product temp = Product(productname: "Alexis", cost: 30, searchname: "Alexis");
                        shoppingCart.add(temp);
                        totalCost = totalCost + temp.cost;
                      });
                    })
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      width: 350,
                      height: 350,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          margin: Dimen.regularPadding,
                          width: 300,
                          height: 300,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: FutureBuilder<Widget>(
                                future: _getImage(context, "DarkSpring.jpg"),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.width / 2,
                                      child: snapshot.data,
                                    );
                                  }
                                  return Container();
                                },
                              )),
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 20.0, top: 20.0)),
                ),
                const Text("Dark Spring",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                const ListTile(
                  title: Text("An elegant skirt for fashionable days!",
                      style: TextStyle(fontSize: 15.0)),
                ),
                ListTile(
                    title: const Text("Price: \$40",
                        style: TextStyle(fontSize: 20.0)),
                    trailing: const Icon(Icons.add_box_rounded),
                    onTap: () {
                      setState(() {
                        Product temp =
                            Product(productname: "Dark Spring", cost: 40, searchname: "DarkSpring");
                        shoppingCart.add(temp);
                        totalCost = totalCost + temp.cost;
                      });
                    })
              ],
            ),
          )
        ]));
  }
}

class Shirts extends StatefulWidget {
  @override
  _ShirtsState createState() => _ShirtsState();
}

class _ShirtsState extends State<Shirts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Shirts'),
          centerTitle: true,
        ),
        body: ListView(children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      width: 350,
                      height: 350,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          margin: Dimen.regularPadding,
                          width: 300,
                          height: 300,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: FutureBuilder<Widget>(
                                future: _getImage(context, "Adventure.jpg"),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.width / 2,
                                      child: snapshot.data,
                                    );
                                  }
                                  return Container();
                                },
                              )),
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 20.0, top: 20.0)),
                ),
                const Text("Adventure",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                const ListTile(
                  title: Text("A vanilla shirt to reflect the simplicity!",
                      style: TextStyle(fontSize: 15.0)),
                ),
                ListTile(
                    title: const Text("Price: \$25",
                        style: TextStyle(fontSize: 20.0)),
                    trailing: const Icon(Icons.add_box_rounded),
                    onTap: () {
                      setState(() {
                        Product temp =
                            Product(productname: "Adventure", cost: 25,searchname: "Adventure");
                        shoppingCart.add(temp);
                        totalCost = totalCost + temp.cost;
                      });
                    })
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      width: 350,
                      height: 350,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          margin: Dimen.regularPadding,
                          width: 300,
                          height: 300,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: FutureBuilder<Widget>(
                                future: _getImage(context, "DenimShirt.jpg"),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.width / 2,
                                      child: snapshot.data,
                                    );
                                  }
                                  return Container();
                                },
                              )),
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 20.0, top: 20.0)),
                ),
                const Text("Denim Shirt",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                const ListTile(
                  title: Text("A fresh shirt to show your youth!",
                      style: TextStyle(fontSize: 15.0)),
                ),
                ListTile(
                    title: const Text("Price: \$30",
                        style: TextStyle(fontSize: 20.0)),
                    trailing: const Icon(Icons.add_box_rounded),
                    onTap: () {
                      setState(() {
                        Product temp =
                            Product(productname: "Denim Shirt", cost: 40, searchname: "DenimShirt");
                        shoppingCart.add(temp);
                        totalCost = totalCost + temp.cost;
                      });
                    })
              ],
            ),
          )
        ]));
  }
}

class Shoes extends StatefulWidget {
  @override
  _ShoesState createState() => _ShoesState();
}

class _ShoesState extends State<Shoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Shoes'),
          centerTitle: true,
        ),
        body: ListView(children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      width: 350,
                      height: 350,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          margin: Dimen.regularPadding,
                          width: 300,
                          height: 300,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: FutureBuilder<Widget>(
                                future: _getImage(context, "Whiteex.jpg"),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.width / 2,
                                      child: snapshot.data,
                                    );
                                  }
                                  return Container();
                                },
                              )),
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 20.0, top: 20.0)),
                ),
                const Text("Whiteex",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                const ListTile(
                  title: Text("A sporty shoe to wear in casual days!",
                      style: TextStyle(fontSize: 15.0)),
                ),
                ListTile(
                    title: const Text("Price: \$25",
                        style: TextStyle(fontSize: 20.0)),
                    trailing: const Icon(Icons.add_box_rounded),
                    onTap: () {
                      setState(() {
                        Product temp =
                            Product(productname: "Whiteex", cost: 25, searchname: "Whiteex");
                        shoppingCart.add(temp);
                        totalCost = totalCost + temp.cost;
                      });
                    })
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      width: 350,
                      height: 350,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          margin: Dimen.regularPadding,
                          width: 300,
                          height: 300,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: FutureBuilder<Widget>(
                                future: _getImage(context, "Blueiva.jpg"),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.width / 2,
                                      child: snapshot.data,
                                    );
                                  }
                                  return Container();
                                },
                              )),
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 20.0, top: 20.0)),
                ),
                const Text("Blueiva",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                const ListTile(
                  title: Text("An elegant shoe to wear in fashionable places!",
                      style: TextStyle(fontSize: 15.0)),
                ),
                ListTile(
                    title: const Text("Price: \$40",
                        style: TextStyle(fontSize: 20.0)),
                    trailing: const Icon(Icons.add_box_rounded),
                    onTap: () {
                      setState(() {
                        Product temp =
                            Product(productname: "Blueiva", cost: 40, searchname: "Blueiva");
                        shoppingCart.add(temp);
                        totalCost = totalCost + temp.cost;
                      });
                    })
              ],
            ),
          )
        ]));
  }
}

class AllProducts extends StatefulWidget {
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Products'),
          centerTitle: true,
        ),
        body: ListView(children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              //Image(image: AssetImage('assets/'+item['productname']+'.jpg'))
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      width: 350,
                      height: 350,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          margin: Dimen.regularPadding,
                          width: 300,
                          height: 300,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: FutureBuilder<Widget>(
                                future: _getImage(context, "BarbourTrilby.jpg"),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.width / 2,
                                      child: snapshot.data,
                                    );
                                  }
                                  return Container();
                                },
                              )),
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 20.0, top: 20.0)),
                ),
                const Text("Barbour Trilby",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                const ListTile(
                  title: Text(
                      "Perfect hat to wear during solving detective cases!",
                      style: TextStyle(fontSize: 15.0)),
                ),
                ListTile(
                    title: const Text("Price: \$25",
                        style: TextStyle(fontSize: 20.0)),
                    trailing: const Icon(Icons.add_box_rounded),
                    onTap: () {
                      setState(() {
                        Product temp =
                            Product(productname: "Barbour Trilby", cost: 25, searchname: "BarbourTrilby");
                        shoppingCart.add(temp);
                        totalCost = totalCost + temp.cost;
                      });
                    })
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              //Image(image: AssetImage('assets/'+item['productname']+'.jpg'))
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      width: 350,
                      height: 350,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          margin: Dimen.regularPadding,
                          width: 300,
                          height: 300,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: FutureBuilder<Widget>(
                                future: _getImage(context, "OldWest.jpg"),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.width / 2,
                                      child: snapshot.data,
                                    );
                                  }
                                  return Container();
                                },
                              )),
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 20.0, top: 20.0)),
                ),
                const Text("Old West",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                const ListTile(
                  title: Text("All you need for a day under the sun!",
                      style: TextStyle(fontSize: 15.0)),
                ),
                ListTile(
                    title: const Text("Price: \$15",
                        style: TextStyle(fontSize: 20.0)),
                    trailing: const Icon(Icons.add_box_rounded),
                    onTap: () {
                      setState(() {
                        Product temp =
                            Product(productname: "Old West", cost: 15, searchname: "OldWest");
                        shoppingCart.add(temp);
                        totalCost = totalCost + temp.cost;
                      });
                    })
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      width: 350,
                      height: 350,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          margin: Dimen.regularPadding,
                          width: 300,
                          height: 300,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: FutureBuilder<Widget>(
                                future: _getImage(context, "FlowerField.jpg"),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.width / 2,
                                      child: snapshot.data,
                                    );
                                  }
                                  return Container();
                                },
                              )),
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 20.0, top: 20.0)),
                ),
                const Text("Flower Field",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                const ListTile(
                  title: Text(
                      "A white and red one piece dress for casual days!",
                      style: TextStyle(fontSize: 15.0)),
                ),
                ListTile(
                    title: const Text("Price: \$30",
                        style: TextStyle(fontSize: 20.0)),
                    trailing: const Icon(Icons.add_box_rounded),
                    onTap: () {
                      setState(() {
                        Product temp =
                            Product(productname: "Flower Field", cost: 30, searchname: "FlowerField");
                        shoppingCart.add(temp);
                        totalCost = totalCost + temp.cost;
                      });
                    })
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      width: 350,
                      height: 350,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          margin: Dimen.regularPadding,
                          width: 300,
                          height: 300,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: FutureBuilder<Widget>(
                                future: _getImage(context, "SpringBreeze.jpg"),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.width / 2,
                                      child: snapshot.data,
                                    );
                                  }
                                  return Container();
                                },
                              )),
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 20.0, top: 20.0)),
                ),
                const Text("Spring Breeze",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                const ListTile(
                  title: Text(
                      "A fresh one piece to wear in fresh spring breeze!",
                      style: TextStyle(fontSize: 15.0)),
                ),
                ListTile(
                    title: const Text("Price: \$40",
                        style: TextStyle(fontSize: 20.0)),
                    trailing: const Icon(Icons.add_box_rounded),
                    onTap: () {
                      setState(() {
                        Product temp =
                            Product(productname: "Spring Breeze", cost: 40, searchname: "SpringBreeze");
                        shoppingCart.add(temp);
                        totalCost = totalCost + temp.cost;
                      });
                    })
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      width: 350,
                      height: 350,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          margin: Dimen.regularPadding,
                          width: 300,
                          height: 300,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: FutureBuilder<Widget>(
                                future: _getImage(context, "Alexis.jpg"),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.width / 2,
                                      child: snapshot.data,
                                    );
                                  }
                                  return Container();
                                },
                              )),
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 20.0, top: 20.0)),
                ),
                const Text("Alexis",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                const ListTile(
                  title: Text("A stylish skirt for casual wear!",
                      style: TextStyle(fontSize: 15.0)),
                ),
                ListTile(
                    title: const Text("Price: \$30",
                        style: TextStyle(fontSize: 20.0)),
                    trailing: const Icon(Icons.add_box_rounded),
                    onTap: () {
                      setState(() {
                        Product temp = Product(productname: "Alexis", cost: 30, searchname: "Alexis");
                        shoppingCart.add(temp);
                        totalCost = totalCost + temp.cost;
                      });
                    })
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      width: 350,
                      height: 350,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          margin: Dimen.regularPadding,
                          width: 300,
                          height: 300,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: FutureBuilder<Widget>(
                                future: _getImage(context, "DarkSpring.jpg"),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.width / 2,
                                      child: snapshot.data,
                                    );
                                  }
                                  return Container();
                                },
                              )),
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 20.0, top: 20.0)),
                ),
                const Text("Dark Spring",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                const ListTile(
                  title: Text("An elegant skirt for fashionable days!",
                      style: TextStyle(fontSize: 15.0)),
                ),
                ListTile(
                    title: const Text("Price: \$40",
                        style: TextStyle(fontSize: 20.0)),
                    trailing: const Icon(Icons.add_box_rounded),
                    onTap: () {
                      setState(() {
                        Product temp =
                            Product(productname: "Dark Spring", cost: 40, searchname: "DarkSpring");
                        shoppingCart.add(temp);
                        totalCost = totalCost + temp.cost;
                      });
                    })
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      width: 350,
                      height: 350,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          margin: Dimen.regularPadding,
                          width: 300,
                          height: 300,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: FutureBuilder<Widget>(
                                future: _getImage(context, "Adventure.jpg"),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.width / 2,
                                      child: snapshot.data,
                                    );
                                  }
                                  return Container();
                                },
                              )),
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 20.0, top: 20.0)),
                ),
                const Text("Adventure",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                const ListTile(
                  title: Text("A vanilla shirt to reflect the simplicity!",
                      style: TextStyle(fontSize: 15.0)),
                ),
                ListTile(
                    title: const Text("Price: \$25",
                        style: TextStyle(fontSize: 20.0)),
                    trailing: const Icon(Icons.add_box_rounded),
                    onTap: () {
                      setState(() {
                        Product temp =
                            Product(productname: "Adventure", cost: 25, searchname: "Adventure");
                        shoppingCart.add(temp);
                        totalCost = totalCost + temp.cost;
                      });
                    })
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      width: 350,
                      height: 350,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          margin: Dimen.regularPadding,
                          width: 300,
                          height: 300,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: FutureBuilder<Widget>(
                                future: _getImage(context, "DenimShirt.jpg"),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.width / 2,
                                      child: snapshot.data,
                                    );
                                  }
                                  return Container();
                                },
                              )),
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 20.0, top: 20.0)),
                ),
                const Text("Denim Shirt",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                const ListTile(
                  title: Text("A fresh shirt to show your youth!",
                      style: TextStyle(fontSize: 15.0)),
                ),
                ListTile(
                    title: const Text("Price: \$30",
                        style: TextStyle(fontSize: 20.0)),
                    trailing: const Icon(Icons.add_box_rounded),
                    onTap: () {
                      setState(() {
                        Product temp =
                            Product(productname: "Denim Shirt", cost: 40, searchname: "DenimShirt");
                        shoppingCart.add(temp);
                        totalCost = totalCost + temp.cost;
                      });
                    })
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      width: 350,
                      height: 350,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          margin: Dimen.regularPadding,
                          width: 300,
                          height: 300,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: FutureBuilder<Widget>(
                                future: _getImage(context, "Whiteex.jpg"),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.width / 2,
                                      child: snapshot.data,
                                    );
                                  }
                                  return Container();
                                },
                              )),
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 20.0, top: 20.0)),
                ),
                const Text("Whiteex",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                const ListTile(
                  title: Text("A sporty shoe to wear in casual days!",
                      style: TextStyle(fontSize: 15.0)),
                ),
                ListTile(
                    title: const Text("Price: \$25",
                        style: TextStyle(fontSize: 20.0)),
                    trailing: const Icon(Icons.add_box_rounded),
                    onTap: () {
                      setState(() {
                        Product temp =
                            Product(productname: "Whiteex", cost: 25, searchname: "Whiteex");
                        shoppingCart.add(temp);
                        totalCost = totalCost + temp.cost;
                      });
                    })
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      width: 350,
                      height: 350,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          margin: Dimen.regularPadding,
                          width: 300,
                          height: 300,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: FutureBuilder<Widget>(
                                future: _getImage(context, "Blueiva.jpg"),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.width / 2,
                                      child: snapshot.data,
                                    );
                                  }
                                  return Container();
                                },
                              )),
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 20.0, top: 20.0)),
                ),
                const Text("Blueiva",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                const ListTile(
                  title: Text("An elegant shoe to wear in fashionable places!",
                      style: TextStyle(fontSize: 15.0)),
                ),
                ListTile(
                    title: const Text("Price: \$40",
                        style: TextStyle(fontSize: 20.0)),
                    trailing: const Icon(Icons.add_box_rounded),
                    onTap: () {
                      setState(() {
                        Product temp =
                            Product(productname: "Blueiva", cost: 40, searchname: "Blueiva");
                        shoppingCart.add(temp);
                        totalCost = totalCost + temp.cost;
                      });
                    })
              ],
            ),
          )
        ]));
  }
}
