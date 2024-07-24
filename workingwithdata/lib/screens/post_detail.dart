

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workingwithdata/providers/post_provider.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({super.key});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
     var postProv = Provider.of<PostProvider>(context, listen: true);
      return Scaffold(
      appBar: AppBar(title:const Text('Post Detail'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          Text(postProv.getPostModel!.title, style: TextStyle(fontSize: 30),), 
          Text(postProv.getPostModel!.body), 
        
        
        ],),
      ),
      );
  }
}