
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/post.dart';
import '../model/user.dart';
import '../model/user.dart';
final apiServiceProvider= Provider<ApiService>((ref) => ApiService());

class ApiService{
// Post donsun.
  Future<Post> sendPostRequest(
      {required String email, required String password}) async {
      final response=await http.post(
        Uri.parse('https://reqres.in/api/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          // burasi   model.toJson 'i temsil ediyor.
          'email': email,
          'password':password
        }),
      );
      if (response.statusCode == 200) {

        // Ama donen ayni model olmayacak.
        return Post.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        throw Exception('Failed to post.');
      }
  }



  Future<PostResponse> getRequest() async {
    final String _url = "https://reqres.in/api/users?page=2";
    final http.Response response = await http.get(
      Uri.parse(_url),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> usersData=jsonDecode(response.body) as Map<String, dynamic>;
      PostResponse postResponse=PostResponse.fromJson(usersData);
      return postResponse;
    } else {
      throw Exception('Failed to load users');
    }
  }



}



