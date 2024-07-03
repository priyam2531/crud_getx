import 'package:crud_getx/app/modules/controllers/auth%20controller/otp_controller.dart';
import 'package:crud_getx/app/modules/views/home_screen.dart';
import 'package:crud_getx/app/modules/views/widgets/custom_button.dart';
import 'package:crud_getx/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../../constant/app_text_style.dart';

class OtpScreen extends StatelessWidget {
  String? mobileOtpController;
  late final OtpController otpController;
  OtpScreen(
      {Key? key,
        this.mobileOtpController,})
      : super(key: key) {
    otpController = Get.put(OtpController(
      mobileOtpController: mobileOtpController,));
  }


  @override
  Widget build(BuildContext context) {
    print("--------------------------");

    return
      Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Verification',
                            style: poppinsSemiBold.copyWith(fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Enter your OTP code number",
                            style: poppinsMedium.copyWith(
                                fontSize: 16, color: AppColor.greyColor),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 28,
                          ),
                          PinCodeTextField(
                            length: 6,
                            autoDisposeControllers: false,
                            obscureText: false,
                            animationType: AnimationType.fade,
                            cursorColor: AppColor.blackTextColor,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 50,
                              fieldWidth: 40,
                              selectedColor: AppColor.primaryColor,
                              inactiveColor: AppColor.primaryColor,
                            ),
                            animationDuration: const Duration(milliseconds: 300),
                            errorAnimationController:
                            otpController.errorController,
                            controller: otpController.verifyOtpController,
                            onCompleted: (v) {
                              print("Completed");
                            },
                            onChanged: (value) {
                              print(value);
                              otpController.currentText.value = value;
                            },
                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");
                              return true;
                            },
                            appContext: context,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          color: AppColor.primaryColor,
                          text: "Verify",
                          press: () {
                            otpController.verifiyOtp(
                                context, otpController.verifyOtpController);
                            Get.off(()=>UpdateValue());
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Didn't you receive any code?",
                  style: poppinsRegular.copyWith(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Resend New Code",
                  style: poppinsMedium.copyWith(
                      fontSize: 14, color: AppColor.primaryColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
  }
}
