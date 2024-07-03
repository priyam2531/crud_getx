import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_getx/app/modules/controllers/auth%20controller/otp_controller.dart';
import 'package:crud_getx/app/modules/controllers/auth%20controller/phoneno_controller.dart';
import 'package:crud_getx/app/modules/views/pages/auth/otp/otp_screen.dart';
import 'package:crud_getx/app/modules/views/pages/auth/otp/phoneno_screen.dart';
import 'package:crud_getx/app/modules/views/pages/database%20firestore/firestore_screen.dart';
import 'package:crud_getx/app/modules/views/pages/home/product_screen.dart';
import 'package:crud_getx/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../app/modules/controllers/firestore controller/firestore_controller.dart';
import '../constant/export.dart';

class FirebaseService extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String? verification;
  OtpController otpController = Get.put(OtpController());
  PhoneNoController phoneNoController = Get.put(PhoneNoController());
  FirestoreController firestoreController = Get.put(FirestoreController());
  GoogleSignIn googleSignIn = GoogleSignIn();

  signUpWithEmailPassword({email, password}) async {
    try {
      final user =
          await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      if (user.user != null) {
        Get.off(LoginScreen());
        print(user.user!.email);
      }
    } catch (e) {
      print("Error:---$e");
    }
  }

  signInWithEmailPassword({email, password}) async {
    try {
      final user = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if (user.user != null) {
        getStorage.write('LOGINID', user.user!.uid);
        print("==========${getStorage.read('LOGINID')}");
        // Get.off(HomeScreen());
        print(user.user!.email);
        update();
      }
    } catch (e) {
      print("Error:---$e");
    }
  }

  logoutWithEmailPassword({email, password}) async {
    try {
      await firebaseAuth.signOut();
      getStorage.remove('LOGINID'); // remove the stored login ID
      Get.offAll(HomeScreen());
    } catch (e) {
      print("Error:---$e");
    }
  }

  sendOtp(phoneNumber) async {
    try {
      await firebaseAuth
          .verifyPhoneNumber(
              phoneNumber: "+91${phoneNumber}",
              verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
              verificationFailed: (FirebaseAuthException error) {},
              codeSent: (String verificationId, int? forceResendingToken) {
                otpController.verificationID = verificationId;
              },
              codeAutoRetrievalTimeout: (String verificationId) {})
          .then((value) => Get.to(OtpScreen()));
    } catch (e) {
      print("Send OTP Error:- $e");
    }
  }

  googleSignInLogin() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth!.accessToken, idToken: googleAuth.idToken);
      final user = await firebaseAuth.signInWithCredential(credential);
      if (user.user != null) {
        print('Signed in with Google: ${user.user!.email}');
        Get.offAll(HomeScreen());
      } else {
        print('Failed to sign in with Google');
      }
    } catch (e) {}
  }

  setDataFireStore(name, email, number) async {
    try {
      String docId = firebaseFirestore.collection('user').doc().id;

      await firebaseFirestore
          .collection('user')
          .doc(docId)
          .set({'name': name, 'email': email, 'number': number, 'did': docId}).then((value) {
        Get.snackbar("Success", "Data added sucessfully",
            backgroundColor: Colors.green.withOpacity(.4));
        return Get.off(FirestoreScreen());
      });
    } catch (e) {
      print("Error:-$e");
    }
  }

  updateDataFireStore(id,name, email, number) async {
    try {
      await firebaseFirestore
          .collection('user')
          .doc(id)
          .update({'name': name, 'email': email, 'number': number, 'did': id}).then((value) {
        Get.snackbar("Success", "Data updated successfully",
            backgroundColor: Colors.green.withOpacity(.4));
        return Get.off(FirestoreScreen());
      });
    } catch (e) {
      print("Error:-$e");
    }
  }

  deleteDataFireStore(id) async {
    try {
      await firebaseFirestore
          .collection('user')
          .doc(id)
          .delete().then((value) {
        Get.snackbar("Success", "Data removed successfully",
            backgroundColor: Colors.green.withOpacity(.4));
      });
    } catch (e) {
      print("Error:-$e");
    }
  }

}
