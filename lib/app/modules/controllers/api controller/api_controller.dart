import 'package:crud_getx/app/data/models/comment_model.dart';
import 'package:crud_getx/constant/export.dart';
import 'package:dio/dio.dart';

import '../../../data/models/user_model.dart';

class ApiController extends GetxController {
  String BASE_API = "https://jsonplaceholder.typicode.com";
  Dio dio = Dio();
  dynamic data = [].obs;
  var comments = <GetComments>[].obs;
  var users = <UserModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getApiData();
    getUsersApiData();
    super.onInit();
  }

  getApiData() async {
    try{
      final response = await dio.get("$BASE_API/comments");
      if(response.statusCode == 200){
        // data.value = response.data;
        var commentList = (response.data as List)
            .map((comment) => GetComments.fromJson(comment))
            .toList();
        comments.value = commentList;
        print("Data:-${comments.length}");
        update();
      }
    }catch(e){
      print("Error API:-$e");
    }
  }

  getUsersApiData() async {
    try{
      final response = await dio.get("$BASE_API/users");
      if(response.statusCode == 200){
        // data.value = response.data;
        var userList = (response.data as List)
            .map((comment) => UserModel.fromJson(comment))
            .toList();
        users.value = userList;
        print("Users:-${users.length}");
        update();
      }
    }catch(e){
      print("Error API:-$e");
    }
  }


}
