import 'dart:async';

import 'package:crud_getx/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../constant/export.dart';

class OtpController extends GetxController {
  String? mobileOtpController;
  OtpController({this.mobileOtpController});
  RxString currentText = "".obs;
  StreamController<ErrorAnimationType>? errorController;
  TextEditingController verifyOtpController = TextEditingController();
  String verificationID = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  var loading = false.obs;
  verifiyOtp(BuildContext context, TextEditingController verificationOtp) async {
    try {
      final _cred = PhoneAuthProvider.credential(
          verificationId: verificationID, smsCode: verificationOtp.text);
      final user = await auth.signInWithCredential(_cred);
      getStorage.write('CONTACTID', user.user!.uid);
      if (user.user != null) {
        print("User:-${user.user}");
        signInRequestUser(context);

      }
    } on FirebaseAuthException catch (e,st) {
      print("Stack:--${st.toString()}");
      loading(false);
      update();
      Get.snackbar('Error', e.code,
          backgroundColor: AppColor.blueColor.withOpacity(.4),
          snackPosition: SnackPosition.BOTTOM,
          margin:
          EdgeInsets.symmetric(horizontal: 10, vertical: 10));
    } catch (ex) {
      loading(false);
      update();
      Get.snackbar('Error', ex.toString(),
          backgroundColor: AppColor.blueColor.withOpacity(.4),
          snackPosition: SnackPosition.BOTTOM,
          margin:
          EdgeInsets.symmetric(horizontal: 10, vertical: 10));
      return;
    }
  }
  // // Future<void> verifiyOtp(BuildContext context, TextEditingController) async {
  // //   loading(true);
  // //   update();
  // //
  // //   try {
  // //     final _cred = PhoneAuthProvider.credential(
  // //         verificationId: verificationID, smsCode: verifyOtpController.text);
  // //     final user = await auth.signInWithCredential(_cred);
  // //     if (user.user != null) {
  // //       GetStorage().write('phoneNumber', user.user!.uid);
  // //       Get.off(() => UpdateValue());
  // //     }
  // //   } catch (e) {
  // //     if (e is FirebaseAuthException) {
  // //       Get.snackbar('Error', e.code,
  // //           backgroundColor: AppColor.blueColor.withOpacity(.4),
  // //           snackPosition: SnackPosition.BOTTOM,
  // //           margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10));
  // //     } else {
  // //       Get.snackbar('Error', e.toString(),
  // //           backgroundColor: AppColor.blueColor.withOpacity(.4),
  // //           snackPosition: SnackPosition.BOTTOM,
  // //           margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10));
  // //     }
  // //     loading(false);
  // //     update();
  // //   }
  // // }

  Future<bool> signInRequestUser(
    BuildContext context,
  ) async {
    loading(true);
    update();

    return true;
  }
}
