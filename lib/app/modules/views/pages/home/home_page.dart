import 'package:crud_getx/constant/export.dart';

import 'package:crud_getx/service/firebase_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                Column(
                  children: [
                    Text(
                      "Discover Your",
                      style: poppinsMedium.copyWith(color: AppColor.primaryColor, fontSize: 30),
                    ),
                    Text(
                      "Dream Job here",
                      style: poppinsMedium.copyWith(color: AppColor.primaryColor, fontSize: 30),
                    ),
                    Text(
                      "Explore all the existing job roles based on your \n                   interest and study major",
                      style: poppinsMedium.copyWith(color: AppColor.blackTextColor, fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      width: 150,
                      color: AppColor.primaryColor,
                      text: "Login",
                      press: () {
                        Get.off(() => LoginScreen());
                      },
                    ),
                    CustomButton(
                      width: 150,
                      textColor: AppColor.whiteColor,
                      text: "Register",
                      press: () {
                        Get.off(() => SignUpScreen());
                      },
                    ),
                  ],
                ),

              ]),
        ),
      ),
    );
  }
}
