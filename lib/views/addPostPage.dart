import 'package:flutter/material.dart';
import 'package:jsonplaceholder_posts/models/Post.dart';
import 'package:jsonplaceholder_posts/services/jsonPlaceHolderAPI.dart';

class AddPostPage extends StatefulWidget {
  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {

  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  // Método para enviar o post para a API
  void _submitPost() {

      final userId = int.tryParse(_userIdController.text);
      final title = _titleController.text;
      final body = _bodyController.text;

      print('UserId: $userId, Title: $title, Body: $body');

      JsonplaceholderAPI().addPost(Post(title: title, body: body, userId: userId!));

      // Limpar os campos após o envio
      _userIdController.clear();
      _titleController.clear();
      _bodyController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Post adicionado com sucesso!')),
      );
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Novo Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: _userIdController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'User ID',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _bodyController,
                decoration: InputDecoration(
                  labelText: 'Body',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitPost,
                child: Text('Adicionar Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _userIdController.dispose();
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }
}
