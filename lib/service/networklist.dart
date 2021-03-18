import 'dart:convert';

import 'package:http/http.dart';
import 'package:jsonparseapp/model/postlist.dart';

class NetworkList {
  final String url;

  NetworkList(this.url);

  Future<PostList> loadPosts() async {
    print('$url');

    Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      //  print(response.body);
      return PostList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get posts');
    }
  }
}
