import 'package:crud_getx/constant/export.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isPasswordVisible = RxBool(false); // Reactive variable for password visibility

  void passwordVisibility() => isPasswordVisible.toggle();
}