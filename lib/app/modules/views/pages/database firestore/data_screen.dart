import 'package:crud_getx/app/modules/controllers/firestore%20controller/firestore_controller.dart';
import 'package:crud_getx/app/modules/views/pages/database%20firestore/firestore_screen.dart';
import 'package:crud_getx/constant/app_icon.dart';
import 'package:crud_getx/constant/export.dart';
import 'package:crud_getx/service/firebase_service.dart';

class DataScreen extends StatelessWidget {
  String? id;
  String? name;
  String? number;
  String? email;
  DataScreen({Key? key, this.id, this.name, this.email, this.number}) : super(key: key);
  FirestoreController firestoreController = FirestoreController();
  FirebaseService firebaseService = FirebaseService();
  @override
  Widget build(BuildContext context) {
    if (name != null && email != null && number != null && id != null) {
      firestoreController.name.text = name ?? "";
      firestoreController.email.text = email ?? "";
      firestoreController.phoneno.text = number ?? "";
    }
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Get.to(FirestoreScreen());
            },
            child: AppIcon.backarrow),
        backgroundColor: AppColor.whiteColor,
      ),
      backgroundColor: AppColor.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextField(
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Email',
                    obscureText: false,
                    controller: firestoreController.email),
                CustomTextField(
                    keyboardType: TextInputType.name,
                    hintText: 'Name',
                    obscureText: false,
                    controller: firestoreController.name),
                CustomTextField(
                    keyboardType: TextInputType.phone,
                    hintText: 'Phone no.',
                    obscureText: false,
                    controller: firestoreController.phoneno),
              ],
            ),
            id != null
                ? CustomButton(
                    height: 50,
                    width: 200,
                    press: () {
                      firebaseService.updateDataFireStore(id, firestoreController.name.text,
                          firestoreController.email.text, firestoreController.phoneno.text);
                      firestoreController.email.clear();
                      firestoreController.name.clear();
                      firestoreController.phoneno.clear();

                      Get.back();
                    },
                    text: "Update")
                : CustomButton(
                    height: 50,
                    width: 200,
                    press: () {
                      final name = firestoreController.email.text;
                      final email = firestoreController.name.text;
                      final phoneNo = firestoreController.phoneno.text;

                      if (name.isEmpty || email.isEmpty || phoneNo.isEmpty) {
                        Get.snackbar(
                          'Error',
                          'Please fill in all fields',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                        return;
                      }

                    firebaseService.setDataFireStore(name, email, phoneNo);
                      firestoreController.email.clear();
                      firestoreController.name.clear();
                      firestoreController.phoneno.clear();

                      Get.back();
                      // firebaseService.setDataFireStore(firestoreController.name.text,
                      //     firestoreController.email.text, firestoreController.phoneno.text);
                      // if (firestoreController.name.text.isNotEmpty &&
                      //     firestoreController.email.text.isNotEmpty &&
                      //     firestoreController.phoneno.text.isNotEmpty) {
                      //   firestoreController.data.add({
                      //     "Name": firestoreController.name.text,
                      //     "Surname": firestoreController.email.text,
                      //     "Age": firestoreController.phoneno.text,
                      //   });
                      //   firestoreController.update();
                      //   Get.back();
                      // } else {
                      //   Get.snackbar(
                      //       backgroundColor: Colors.redAccent.withAlpha(200),
                      //       barBlur: 10,
                      //       duration: const Duration(milliseconds: 1500),
                      //       "Error",
                      //       "Enter Details");
                      // }
                      // print("---------- Name : - ${firestoreController.name.text}");
                      // print("----------data :- ${firestoreController.data}");
                      // print("----------Value :-- ${firestoreController.value}");
                    },
                    text: "Submit"),

            // Get.to(FirestoreScreen());
          ],
        ),
      ),
    ));
  }
}
