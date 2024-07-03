import 'package:crud_getx/app/modules/controllers/api%20controller/api_controller.dart';
import 'package:crud_getx/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiScreen extends StatelessWidget {
  ApiScreen({Key? key}) : super(key: key);

  ApiController apiController = Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text("Api Demo"),
      ),
      body: Obx(
            () =>  ListView.builder(
          itemCount: apiController.comments.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                  leading:  CircleAvatar(),
                  title: Text(apiController.comments[index].name.toString()),
                  subtitle: Text(apiController.comments[index].email.toString())),
            );
          },
        ),
      ),
    );
  }
}
