import 'package:country_picker/country_picker.dart';
import 'package:crud_getx/app/modules/controllers/auth%20controller/phoneno_controller.dart';
import 'package:crud_getx/app/modules/views/pages/auth/otp/otp_screen.dart';
import 'package:crud_getx/constant/export.dart';
import 'package:crud_getx/service/firebase_service.dart';

class PhoneNoScreen extends StatelessWidget {
  PhoneNoScreen({Key? key}) : super(key: key);
  PhoneNoController phoneNoController = Get.put(PhoneNoController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        height: 65,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColor.greyColor),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                showCountryPicker(
                                    context: context,
                                    countryListTheme: CountryListThemeData(
                                      flagSize: 25,
                                      backgroundColor: Colors.white,
                                      textStyle:
                                          const TextStyle(fontSize: 16, color: AppColor.blueColor),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                      bottomSheetHeight: Get.height * .85,
                                      inputDecoration: InputDecoration(
                                        labelText: 'Search',
                                        hintText: 'Start typing to search',
                                        prefixIcon: const Icon(Icons.search),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color(0xFF8C98A8).withOpacity(0.2),
                                          ),
                                        ),
                                      ),
                                    ),
                                    onSelect: (Country country) {
                                      country.countryCode;
                                      phoneNoController.setCountryNameAndCode(
                                          country.name, country.countryCode, country.phoneCode);
                                      print('Select country: ${country.countryCode}');
                                    });
                              },
                              child: Container(
                                height: 65,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: AppColor.primaryColor,
                                  borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(6),
                                  ),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        Get.find<PhoneNoController>()?.countryCode ?? '',
                                        style: poppinsMedium.copyWith(
                                            color: AppColor.whiteColor, fontSize: 14),
                                      ),
                                      const Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: AppColor.whiteColor,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: phoneNoController.mobileController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Phone number is required';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.phone,
                                cursorColor: AppColor.primaryColor,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                                    border: InputBorder.none,
                                    hintText: "Phone Number",
                                    hintStyle: poppinsRegular.copyWith(fontSize: 14)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  height: 50,
                  width: 200,
                  color: AppColor.primaryColor,
                  text: "Get OTP",
                  press: () async {
                    if (formKey.currentState!.validate()) {
                      print("Heello");
                      FirebaseService().sendOtp(phoneNoController.mobileController.text);

                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
