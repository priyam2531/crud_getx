import 'package:crud_getx/constant/export.dart';
import 'package:crud_getx/service/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final SignupController signupController = Get.put(SignupController());
  FirebaseService firebaseService = FirebaseService();
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
                "Create Account",
                style: poppinsMedium.copyWith(color: AppColor.primaryColor, fontSize: 25),
              ),
              Text(
                "Create an account so you can explore all the \n                               exitings jobs",
                style: poppinsMedium.copyWith(color: AppColor.blackTextColor, fontSize: 14),
              ),
              CustomTextField(
                hintText: "email",
                // labelText: "email",
                isEnabled: true,
                obscureText: false,
                controller: signupController.emailController,
                keyboardType: TextInputType.text,
              ),
              Obx(
                () => CustomTextField(
                  hintText: "password",
                  // labelText: "Password",
                  obscureText: !signupController.isPasswordVisible.value,
                  controller: signupController.passwordController,
                  keyboardType: TextInputType.text,
                  suffixIcon: IconButton(
                    color: AppColor.primaryColor,
                    icon: Icon(
                      signupController.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: signupController.passwordVisibility,
                  ),
                ),
              ),
              Obx(
                () => CustomTextField(
                  hintText: "Confirm Password",
                  // labelText: "Password",
                  obscureText: !signupController.isConfirmPasswordVisible.value,
                  controller: signupController.confirmpasswordController,
                  keyboardType: TextInputType.text,
                  suffixIcon: IconButton(
                    color: AppColor.primaryColor,
                    icon: Icon(
                      signupController.isConfirmPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: signupController.confirPasswordVisibility,
                  ),
                ),
              ),
              CustomButton(
                  height: 50,
                  width: 350,
                  color: AppColor.primaryColor,
                  text: "Sign Up",
                  press: () {
                    FirebaseService().signUpWithEmailPassword(
                        email: signupController.emailController.text,
                        password: signupController.passwordController.text);
                    // Get.to(SignUpScreen());
                  }),
              InkWell(
                onTap: () {
                  Get.off(LoginScreen());
                },
                child: Text(
                  "Already have an account",
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


                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     primary: AppColor.primaryColor,
                  //     elevation: 5,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //   ),
                  //   child: ImageIcon(AssetImage(AppImage.fb)),
                  //   onPressed: () async {
                  //     try {
                  //       final GoogleSignIn googleSignIn = GoogleSignIn();
                  //       final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
                  //       if (googleUser != null) {
                  //         print('Signed in with Google: ${googleUser.email}');
                  //       } else {
                  //         print('Failed to sign in with Google');
                  //       }
                  //     } catch (e) {
                  //       print("Errorr--------$e");
                  //     }
                  //   },
                  // ),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     primary: AppColor.primaryColor,
                  //     elevation: 5,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //   ),
                  //   child: const ImageIcon(AssetImage(AppImage.apple)),
                  //   onPressed: () async {},
                  // ),
                ],
              )
            ]),
      )),
    );
  }
}
