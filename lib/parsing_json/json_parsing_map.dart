import 'package:flutter/material.dart';
import 'package:jsonparseapp/model/post.dart';
import 'package:jsonparseapp/model/postlist.dart';
import 'package:jsonparseapp/service/networklist.dart';

class JSONParsingMapPage extends StatefulWidget {
  @override
  _JSONParsingMapPageState createState() => _JSONParsingMapPageState();
}

class _JSONParsingMapPageState extends State<JSONParsingMapPage> {
  Future<PostList> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    NetworkList networkList =
        NetworkList('https://jsonplaceholder.typicode.com/posts');

    data = networkList.loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: FutureBuilder(
            future: data,
            builder: (context, AsyncSnapshot<PostList> snapshot) {
              List<Post> allPosts;
              if (snapshot.hasData) {
                allPosts = snapshot.data.posts;
                return createListView(allPosts, context);
                // return Text('${allPosts[0].title}');
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }

  Widget createListView(List<Post> data, BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, int index) {
          return Column(
            children: [
              Divider(
                height: 5.0,
              ),
              ListTile(
                title: Text('${data[index].title}'),
                subtitle: Text('${data[index].body}'),
                leading: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 23,
                      child: Text('${data[index].id}'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
