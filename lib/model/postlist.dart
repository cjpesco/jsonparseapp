import 'post.dart';

class PostList {
  final List<Post> posts;
  PostList({this.posts});

  factory PostList.fromJson(List<dynamic> parsedJson) {
    List<Post> posts = [];

    posts = parsedJson.map((e) => Post.fromJson(e)).toList();

    return new PostList(posts: posts);
  }
}
