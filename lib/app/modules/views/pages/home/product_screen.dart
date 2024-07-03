import 'package:crud_getx/constant/export.dart';
import 'package:crud_getx/service/firebase_service.dart';

class ProductScreen extends StatelessWidget {
   ProductScreen({Key? key}) : super(key: key);
  HomeController homeController= Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Image(
                  image: AssetImage(AppImage.home),
                  height: 300,
                  width: 270,
                ),

                CustomButton(
                    height: 50,
                    width: 350,
                    color: AppColor.primaryColor,
                    text: "Log Out",
                    press: () {
                      FirebaseService().logoutWithEmailPassword(
                          email: homeController.emailController.text,
                          password: homeController.passwordController.text);
                    }),
              ]),
        ),
      ),
    );
  }
}
