import 'package:flutter/material.dart';

import '../modul/post.dart';
import '../service/api_service.dart';

class PostDetailPage extends StatefulWidget {
  final int id;

  PostDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  Post? post;

  @override
  void initState() {
    super.initState();
    _loadPost();
  }

  void _loadPost() async {
    try {
      final response = await Network.GET(Network.API_LIST_ID + widget.id.toString(), Network.paramsEmpty());
      responseData(response!);
    } catch (error) {
      print("Error loading post: $error");
    }
  }

  void responseData(String value) {
    setState(() {
      post = Network.parsePostList(value) as Post?;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (post != null)
              Text(
                post!.title.toString(),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 10),
            if (post != null)
              Text(
                post!.body.toString(),
                style: TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
