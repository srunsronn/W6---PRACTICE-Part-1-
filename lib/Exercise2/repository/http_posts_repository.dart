import 'dart:convert';
import 'package:http/http.dart' as http;
import '../dto/post_dto.dart';
import '../model/post.dart';
import 'post_repository.dart';

class HttpPostsRepository implements PostRepository {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Future<List<Post>> getPosts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      List<PostDto> postDtos = jsonData.map((json) => PostDto.fromJson(json)).toList();
      return postDtos.map((dto) => Post(id: dto.id, title: dto.title, description: dto.body)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}