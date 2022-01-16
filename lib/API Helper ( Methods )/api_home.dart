import 'dart:convert';

import 'package:flutter_api_with_model/Model/postmodel.dart';
import 'package:http/http.dart' as http;

List<Postmodel> postList = [];
Future<List<Postmodel>> cal() async {
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
