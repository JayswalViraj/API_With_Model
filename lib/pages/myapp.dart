import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_with_model/API%20Helper%20(%20Methods%20)/api_home.dart';
import 'package:flutter_api_with_model/Model/postmodel.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);



  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter API With JSON Model"),
      ),
      body: FutureBuilder(
        future: cal(),
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
