import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_with_model/Model/postmodel.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Postmodel> postList = [];

  Future<List<Postmodel>> callAPI() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      postList.clear();
      var data = jsonDecode(response.body);

      for (Map i in data) {
        postList.add(Postmodel.fromJson(i));
      }
      return postList;

      print(data.runtimeType);
    } else {
      print("Error");
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter API With JSON Model"),
      ),
      body: FutureBuilder(
        future: callAPI(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ListView.builder(
            itemCount: postList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("Title: ${postList[index].title.toString()}"),
                subtitle:
                    Text("Description: ${postList[index].body.toString()}"),
                leading: Text("Id: ${postList[index].id.toString()}"),
              );
            },
          );
        },
      ),
    );
  }
}
