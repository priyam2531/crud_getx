import 'package:crud_getx/constant/export.dart';
import 'package:get/get.dart';

class SignupController extends GetxController{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  RxBool isPasswordVisible = RxBool(false);
  RxBool isConfirmPasswordVisible = RxBool(true);// Reactive variable for password visibility

  void passwordVisibility() => isPasswordVisible.toggle();
  void confirPasswordVisibility() => isConfirmPasswordVisible.toggle();
}