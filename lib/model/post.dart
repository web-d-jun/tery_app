import 'dart:convert';

import 'package:http/http.dart' as http;

var urlInfo = 'https://my-json-server.typicode.com/web-d-jun/tery_app/posts';
var url = Uri.parse('${urlInfo}');

class Post {
  final String id;
  final String title;
  Post({required this.id, required this.title});
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(id: json['id'], title: json['title']);
  }
}

Future<Post> fetchPost() async {
  var response = await http.get(url);
  print(response);
  var responseBody = response.body;
  return Post.fromJson(json.decode(responseBody));
}
