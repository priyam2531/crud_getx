import 'package:crud_getx/constant/export.dart';
import 'package:crud_getx/service/firebase_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final LoginController loginController = Get.put(LoginController());
  FirebaseService firebaseService= FirebaseService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Login here",
                style: poppinsMedium.copyWith(color: AppColor.primaryColor, fontSize: 25),
              ),
              Text(
                "Welcome back you've \n         been missed!",
                style: poppinsMedium.copyWith(color: AppColor.blackTextColor, fontSize: 14),
              ),
              CustomTextField(
                hintText: "email",
                // labelText: "email",
                isEnabled: true,
                obscureText: false,
                controller: loginController.emailController,
                keyboardType: TextInputType.text,
              ),
              Obx(
                () => CustomTextField(
                  hintText: "password",
                  // labelText: "Password",
                  obscureText: !loginController.isPasswordVisible.value,
                  controller: loginController.passwordController,
                  keyboardType: TextInputType.text,
                  suffixIcon: IconButton(
                    color: AppColor.primaryColor,
                    icon: Icon(
                      loginController.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: loginController.passwordVisibility,
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Foregot your password?",
                    style: TextStyle(color: AppColor.primaryColor, fontSize: 14),
                  )
                ],
              ),
              CustomButton(
                  height: 50,
                  width: 350,
                  color: AppColor.primaryColor,
                  text: "Sign in",
                  press: () {
                    FirebaseService().signInWithEmailPassword(
                        email: loginController.emailController.text,
                        password: loginController.passwordController.text);
                  }),

              InkWell(onTap: () {
                Get.off(SignUpScreen());
              },
                child: Text(
                  "Create new account",
                  style: poppinsMedium.copyWith(fontSize: 14, color: AppColor.blackTextColor),
                ),
              ),
              Text(
                "Or continue with",
                style: poppinsMedium.copyWith(fontSize: 14, color: AppColor.primaryColor),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    img: true,
                    imgicon: AppImage.google,
                    height: 50,
                    width: 60,
                    color: AppColor.primaryColor,
                    press: () {
                      firebaseService.googleSignInLogin();
                    },
                  ),
                  CustomButton(
                    img: true,
                    imgicon: AppImage.fb,
                    height: 50,
                    width: 60,
                    color: AppColor.primaryColor,
                    press: () {
                      firebaseService.googleSignInLogin();
                    },
                  ),
                  CustomButton(
                    img: true,
                    imgicon: AppImage.apple,
                    height: 50,
                    width: 60,
                    color: AppColor.primaryColor,
                    press: () {
                      firebaseService.googleSignInLogin();
                    },
                  ),

                ],
              )
            ]),
      )),
    );
  }
}
