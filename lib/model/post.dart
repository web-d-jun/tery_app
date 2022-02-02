import 'dart:convert';

import 'package:http/http.dart' as http;

var urlInfo = 'https://my-json-server.typicode.com/web-d-jun/tery_app/posts';
var url = Uri.parse('${urlInfo}');

class Post {
  final int id;
  final String title;
  Post({required this.id, required this.title});
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(id: json['id'], title: json['title']);
  }
}

List<Post> allPostsFromJson(String str) {
  final jsonData = json.decode(str);
  print('...strstr....${jsonData}');
  return List<Post>.from(jsonData.map((x) => Post.fromJson(x)));
}

Future<List<Post>> fetchPost() async {
  var response = await http.get(url);
  var responseBody = response.body;
  return allPostsFromJson(responseBody);
}
