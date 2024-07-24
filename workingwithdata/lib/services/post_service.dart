import 'package:http/http.dart' as http;
import 'package:workingwithdata/helpers/urls.dart';
import 'package:workingwithdata/models/post_model.dart';
import 'package:workingwithdata/providers/post_provider.dart';


class PostService {
  static Future<bool> fetchPosts(PostProvider prov) async {

   try  
   {
       final response = await http.get(Uri.parse(postUrl));

        if(response.statusCode == 200)
        {
          final postResponseModel = postModelFromJson(response.body);
          prov.setPostModelList(postResponseModel);
          return true;
        }
        else 
        {
          return false;
        }
   }catch(e)
   {
    throw "An error happened: ${e.toString()}";
   }


  }
}