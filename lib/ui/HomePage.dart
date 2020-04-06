import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:treva/ui/MovieBubble.dart';
import 'package:treva/utilities/contants.dart' as constants;

class HomePage extends StatefulWidget {
  static const String id = 'HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _filter = TextEditingController();
  List names = List();
  List filteredNames = List();
  Icon _searchIcon = Icon(Icons.search);
  Widget _appBarTitle = Text('treva');
  static const apiKey = '3d40aa68';
  http.Response response;
  var decodedBody;
  String searchValue = 'Iron Man 2';
  bool isLoading = false;
  List<MovieBubble> _movieBubbleList = [];
  Future getChatData(String searchValue) async {
    response =
        await http.get("http://www.omdbapi.com/?t=$searchValue&apikey=$apiKey");
    print(response.statusCode);
    decodedBody = json.decode(response.body);
    print(decodedBody);
    setState(() {
      if (decodedBody['Response'] == "True") {
        _movieBubbleList.insert(
            0,
            MovieBubble(
              title: decodedBody['Title'],
              year: decodedBody['Year'],
              genre: decodedBody['Genre'],
              actors: decodedBody['Actors'],
              country: decodedBody['Country'],
              imageURL: decodedBody['Poster'],
              runTime: decodedBody['Runtime'],
            ));
      } else {
        print("Do Nothing");
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading == true) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          centerTitle: true,
          title: _appBarTitle,
          leading: null,
          actions: <Widget>[
            IconButton(
              icon: _searchIcon,
              onPressed: _searchPressed,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: constants.Colors.planetPageBackground,
            child: StreamBuilder(builder: (context, snapshot) {
              return Column(
                children: _movieBubbleList,
              );
            }),
          ),
        ),
      );
    }
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = Icon(Icons.close);
        this._appBarTitle = TextField(
          controller: _filter,
          onChanged: (value) {
            if (value == null) {
              searchValue = 'Iron Man 2';
              getChatData(searchValue);
            }
            searchValue = value;
            print(searchValue);
            getChatData(searchValue);
          },
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        this._searchIcon = Icon(Icons.search);
        this._appBarTitle = Text('treva');
        _filter.clear();
      }
    });
  }
}
