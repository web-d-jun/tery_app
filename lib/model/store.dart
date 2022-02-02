import 'dart:convert';
import 'package:faker/faker.dart';
import 'package:http/http.dart' as http;

var urlInfo = 'https://my-json-server.typicode.com/web-d-jun/tery_app/stores';
var url = Uri.parse('${urlInfo}');

class Store {
  final int id;
  final String title;
  final String? imageUrl;
  Store({required this.id, required this.title, this.imageUrl});
  factory Store.fromJson(Map<String, dynamic> json) {
    json['imageUrl'] = faker.image.image();
    return Store(
        id: json['id'], title: json['title'], imageUrl: json['imageUrl']);
  }
}

List<Store> allPostsFromJson(String str) {
  final jsonData = json.decode(str);
  // print('...strstr....${jsonData}');
  return List<Store>.from(jsonData.map((x) => Store.fromJson(x)));
}

Future<List<Store>> fetchPost() async {
  var response = await http.get(url);
  var responseBody = response.body;
  return allPostsFromJson(responseBody);
}
