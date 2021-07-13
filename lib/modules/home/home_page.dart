import 'package:flutter/material.dart';
import 'package:api/shared/models/post_model.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostModel> _posts = [];
  final _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home API'),
      ),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Text(
                _posts[index].id.toString(),
              ),
            ),
            title: Text(
              _posts[index].title.toString(),
            ),
            subtitle: Text(
              _posts[index].body.toString(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          _posts = await _controller.getPosts(_posts);
          setState(() {});
        },
        icon: Icon(Icons.download),
        label: Text('Get all posts'),
      ),
    );
  }
}
