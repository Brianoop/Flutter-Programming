
import 'package:flutter/material.dart';
import 'package:workingwithdata/models/post_model.dart';
import 'package:workingwithdata/services/post_service.dart';

class PostProvider with ChangeNotifier {
  List<PostModel> _listOfPosts = [];
  PostModel? _postModel;


  List<PostModel> get getPostModelList => _listOfPosts;
  PostModel? get getPostModel => _postModel;


  void setPostModelList( List<PostModel> list)
  {
    _listOfPosts = list;
    notifyListeners();
  }


  void setPostModel(PostModel post) 
  {
    _postModel = post;
    notifyListeners();
  }

  Future<bool> getPostsFromInternet() async 
  {
    try 
    {
      return await PostService.fetchPosts(this);
    }
    catch(e) 
    {
      throw "Error happened from the provider: ${e.toString()}";
    }
  }


}