
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../modul/post.dart';
import '../service/api_service.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiPostList();

  }

   void _apiPostList(){
     Network.GET(Network.API_LIST, Network.paramsEmpty()).then((value) => {
      responseData(value!),
    });
   }

   void responseData(String value){
    setState(() {
      items = Network.parsePostList(value);
    });
   }

  Future _detailPage(int id) async{
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context){
          return  PostDetailPage(id:id,);
        }
    ));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context,index) => itemPost(items[index]),
        ),
      )
    );
  }
  Widget itemPost(Post post) {
    return GestureDetector(
      onTap: (){
        _detailPage(post.id!);
      },
      child: Slidable(
        startActionPane: ActionPane(
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(
              onDismissed: (){

              },
            ),
            children: [SlidableAction(
              onPressed: (BuildContext context) {

              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.edit,
            )]
        ),
        endActionPane:  ActionPane(
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(
              onDismissed: (){

              },
            ),
            children: [
              SlidableAction(
                onPressed: (BuildContext context) {},
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
              )]
        ),
        child: Container(
          padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
          child: Column(
            children: [
              Text(post.title!.toUpperCase()),
              const SizedBox(
                height: 5,
              ),
              Text(post.body ?? ""),
            ],
          ),
        ),
      ),
    );
  }
}
