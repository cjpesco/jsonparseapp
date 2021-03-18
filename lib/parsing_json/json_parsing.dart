import 'package:flutter/material.dart';
import 'package:jsonparseapp/service/network.dart';

class JSONParsingAppPage extends StatefulWidget {
  @override
  _JSONParsingAppPageState createState() => _JSONParsingAppPageState();
}

class _JSONParsingAppPageState extends State<JSONParsingAppPage> {
  Future data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return createListView(snapshot.data, context);
            // return Text(snapshot.data[0]['title']);
          }
          return CircularProgressIndicator();
        },
      ),
    ));
  }

  Future getData() async {
    Future data;
    String url = 'https://jsonplaceholder.typicode.com/posts';
    Network network = Network(url);

    data = network.fetchData();
    // data.then((value) {
    //   // print(value[0]);
    //   print('userId: ${value[0]['userId']}');
    //   print('id: ${value[0]['id']}');
    //   print('title: ${value[0]['title']}');
    //   print('body: ${value[0]['body']}');
    // });

    return data;
  }

  Widget createListView(List data, BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Divider(
                  height: 5.0,
                ),
                ListTile(
                  title: Text('${data[index]['title']}'),
                  subtitle: Text('${data[index]['body']}'),
                  leading: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black26,
                        radius: 23,
                        child: Text('${data[index]['id']}'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
