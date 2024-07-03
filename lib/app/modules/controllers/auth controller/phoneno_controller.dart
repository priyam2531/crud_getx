import 'package:crud_getx/constant/export.dart';
import 'package:get/get.dart';

class PhoneNoController extends GetxController{
  String countryName = "India";
  String countryCode = "IN";
  String mobileCode = "91";
  final TextEditingController mobileController = TextEditingController();

  setCountryNameAndCode(String countrynm, String countryCode, String mobileCode) {
    countryName = countrynm;
    this.countryCode = countryCode;
    this.mobileCode = mobileCode;
    update();
  }


}