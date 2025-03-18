import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:w6_practices_hw/EX-2-START-CODE/dto/post_dto.dart';
import 'package:w6_practices_hw/EX-2-START-CODE/model/post.dart';
import 'package:w6_practices_hw/EX-2-START-CODE/repository/post_repository.dart';

class HttpPostsRepository implements PostRepository {
  final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  
  @override
  Future<List<Post>> getPost(int postId) async {
    List<Post> posts = [];

    try {
      // fetch data from api
      final respone = await http.get(url);
      if (respone.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(respone.body);  // convert json string into list object

        for (var item in jsonList) {
          // convert json to PostDto
          PostDto postDto = PostDto.fromJson(item);
          // convert PostDto to Post(model)
          Post post = Post.fromDTO(postDto);
          posts.add(post);
        }

      } else {
        print("Error: ${respone.statusCode}");
      }
    } catch (e) {
      print('Error: $e');
    }

    return posts;
  }
}



  // // convert JSON to Post object
  // factory Post.fromJson(Map<String, dynamic> json) {
  //   return Post(
  //       id: json['id'], title: json['title'], description: json['description']);
  // }


