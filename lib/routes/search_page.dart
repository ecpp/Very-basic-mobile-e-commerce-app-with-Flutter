import 'package:cs310group28/main.dart';
import 'package:cs310group28/navigation_bar.dart';
import 'package:cs310group28/routes/category_page.dart';
import 'package:cs310group28/utils/dimension.dart';
import 'package:flutter/material.dart';

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

Product BarbourTrilby = Product(
    productname: "Barbour Trilby", cost: 25, searchname: "BarbourTrilby");
Product OldWest =
    Product(productname: "Old West", cost: 15, searchname: "OldWest");
Product FlowerField =
    Product(productname: "Flower Field", cost: 30, searchname: "FlowerField");
Product SpringBreeze =
    Product(productname: "Spring Breeze", cost: 40, searchname: "SpringBreeze");
Product Alexis = Product(productname: "Alexis", cost: 30, searchname: "Alexis");
Product DarkSpring =
    Product(productname: "Dark Spring", cost: 40, searchname: "DarkSpring");
Product Adventure =
    Product(productname: "Adventure", cost: 25, searchname: "Adventure");
Product DenimShirt =
    Product(productname: "Denim Shirt", cost: 40, searchname: "DenimShirt");
Product Whiteex =
    Product(productname: "Whiteex", cost: 25, searchname: "Whiteex");
Product Blueiva =
    Product(productname: "Blueiva", cost: 40, searchname: "Blueiva");
List<Product> items = [
  BarbourTrilby,
  OldWest,
  FlowerField,
  SpringBreeze,
  Alexis,
  DarkSpring,
  Adventure,
  DenimShirt,
  Whiteex,
  Blueiva
];

late String searchValue;
String currentItem = "";
List<Product> searchRes = [];

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  static const String _title = 'Search Page';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo[800],
        //accentColor: Colors.cyan[600],
        fontFamily: 'Georgia',
      ),
      title: _title,
      home: Scaffold(
        drawer: NavigationBar(),
        appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text('Search Page', style: TextStyle(fontSize: 25))),
        body: const SearchPage2(),
      ),
    );
  }
}

class SearchPage2 extends StatefulWidget {
  const SearchPage2({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'What are you looking for?',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  searchValue = value;
                  return null;
                },
              ),
              margin: Dimen.regularPadding),
          Container(
              child: Padding(
                padding: Dimen.verticalparentPadding,
                //padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState!.validate()) {
                      // Process data.
                      //print(searchValue);
                      if (searchRes.isNotEmpty) {
                        for (var elem in searchRes) {
                          searchRes.remove(elem);
                        }
                      }
                      for (var elem in items) {
                        String test=elem.productname.toLowerCase();
                        String testSearch=searchValue.toLowerCase();
                        if (test.contains(testSearch) == true) {
                          searchRes.add(elem);
                        }
                      }
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SearchResults()));
                    }
                  },
                  child: const Text('Search'),
                ),
              ),
              margin: EdgeInsets.only(left: 15.0))
        ],
      ),
    );
  }
}

class SearchResults extends StatefulWidget {
  @override
  _SearchResultsState createState() => _SearchResultsState();
}

//late Future<Product> data;

class _SearchResultsState extends State<SearchResults> {
  //late List data;

  @override
  void initState() {
    //data.add(BarbourTrilby);
    //Product temp=Product(productname:"asd",cost:10);
    //data.add(temp);
    super.initState();
    //this.findItem().whenComplete((){setState((){});});
  }

/*
  Future findItem() async{
    //data.add(BarbourTrilby);
    setState((){for (var elem in items) {
      //if (elem == BarbourTrilby) {
        data.add(elem);
      //}
    }});

  }

 */

  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: NavigationBar(),
      appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title:
              Text('Showing Search Result(s)', style: TextStyle(fontSize: 25))),
      body: _buildListView(),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: searchRes == null ? 0 : searchRes.length,
        itemBuilder: (context, index) {
            return _buildImageColumn(searchRes[index]);

          // return _buildRow(data[index]);
        });
  }

  Widget _buildImageColumn(dynamic item) => Container(
        decoration: const BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        margin: const EdgeInsets.all(10),
        child: Column(
          //Image(image: AssetImage('assets/'+item['productname']+'.jpg'))
          children: [
            InkWell(
              onTap: () {
              },
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
                            future:
                                _getImage(context, item.searchname + ".jpg"),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height: MediaQuery.of(context).size.width / 2,
                                  child: snapshot.data,
                                );
                              }
                              return Container();
                            },
                          )),
                    ),
                  ),
                  margin: EdgeInsets.only(bottom: 20.0, top: 20.0)),
            ),
            Text(item.productname, style: TextStyle(fontSize: 25.0)),
            _buildRow(item)
          ],
        ),
      );

  Widget _buildRow(dynamic item) {
    return ListTile(
      title: Text("Price: \$" + item.cost.toString(),
          style: TextStyle(fontSize: 20.0)),
      trailing: Icon(Icons.add_box_rounded),
      onTap: () {
        setState(() {
          Product temp = Product(
              productname: item.productname,
              cost: item.cost,
              searchname: item.searchname);

          shoppingCart.add(temp);
          totalCost = totalCost + temp.cost;
        });
      },
    );
  }
}
