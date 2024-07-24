

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workingwithdata/helpers/routes.dart';
import 'package:workingwithdata/providers/post_provider.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<PostProvider>(context, listen: false).getPostsFromInternet();
  }

  @override
  Widget build(BuildContext context) {
    var postProv = Provider.of<PostProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(title: Text('Posts'),),
      body: ListView.builder(
        itemCount: postProv.getPostModelList.length,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index){
          var post = postProv.getPostModelList[index];
          return ListTile(
            onTap: ()
            {
              postProv.setPostModel(post);

              Navigator.pushNamed(context, postDetailRoute);
            },
            title: Text(post.title),
            subtitle: Text(post.body),
          );
        }),
      );
  }
}