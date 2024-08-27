class Post {
  String title;
  String body;
  int userId;

  Post({required this.title, required this.body, required this.userId});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        title: json['title'],
        body: json['body'],
        userId: json['userId']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'userId': userId,
    };
  }

  // Método para converter uma lista de JSON em uma lista de objetos Post
  static List<Post> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Post.fromJson(json)).toList();
  }
}