import 'package:flutter/material.dart';
import 'package:jsonparseapp/parsing_json/json_parsing.dart';
import 'package:jsonparseapp/parsing_json/json_parsing_map.dart';

class JSONParseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PODO'),
      ),
      body: JSONParsingMapPage(),
    );
  }
}
