import 'dart:convert';
import '../models/Post.dart';
import 'package:http/http.dart' as http;

class JsonplaceholderAPI {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/');

  Future<List<Post>> getPosts() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // Decodificando a resposta JSON
      List<dynamic> jsonResponse = jsonDecode(response.body);

      // Convertendo a lista JSON para uma lista de objetos Post
      List<Post> posts = Post.fromJsonList(jsonResponse);
      return posts;
    } else {
      throw Exception('Falhou em buscar os posts');
    }
  }

  void addPost(Post post) async {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(post.toJson()),
    );
    print(response.statusCode);
    print(response.body);
  }
}
