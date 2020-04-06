import 'package:flutter/cupertino.dart';

class Movie {
  final decodedBody;
  Movie({@required this.decodedBody});
  String getDecodedData() {
    return decodedBody;
  }
}
