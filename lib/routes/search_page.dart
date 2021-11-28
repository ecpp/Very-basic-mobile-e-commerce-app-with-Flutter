import 'package:cs310group28/main.dart';
import 'package:flutter/material.dart';

import 'package:cs310group28/navigation_bar.dart';


late String searchValue;

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
        children: <Widget>[Container
          (child: TextFormField(
          decoration: const InputDecoration(
            hintText: 'What are you looking for?',
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            searchValue=value;
            return null;
          },
        ),margin: EdgeInsets.all(10.0)),

          Container
            (child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                  print(searchValue);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHome()));
                }
              },
              child: const Text('Search'),
            ),
          ),margin: EdgeInsets.only(left:15.0))
        ],
      ),
    );
  }
}