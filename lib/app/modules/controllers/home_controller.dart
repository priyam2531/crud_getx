import 'package:crud_getx/constant/export.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
 RxInt counter = 0.obs;
 RxList data = [].obs;
 TextEditingController xNumber =TextEditingController();
 void xIncrement() {
  counter++;
  update();
 }
 final TextEditingController emailController = TextEditingController();
 final TextEditingController passwordController = TextEditingController();

 @override
  void onInit() {
   print("hello world") ;
   // TODO: implement onInit
    super.onInit();
  }


}