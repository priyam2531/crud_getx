import 'package:crud_getx/constant/export.dart';

class CustomTextField extends StatelessWidget {
  // final String labelText;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  bool? color = false;
  bool? isEnabled = true;
  final TextInputType keyboardType;
  final Widget? suffixIcon;


   CustomTextField({
     Key? key,
     // required this.labelText,
     required this.hintText,
    required this.obscureText,
    required this.controller,
    this.validator,
    this.color,
     this.keyboardType = TextInputType.text,
    this.isEnabled,
     this.suffixIcon,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool password = false;
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
        clipBehavior: Clip.hardEdge,
        child: TextFormField(
          obscureText: obscureText,
         enabled: isEnabled,
          style: poppinsMedium.copyWith(fontSize: 14, color: AppColor.blackTextColor),
          validator: validator,
          controller: controller,
          cursorColor: AppColor.primaryColor,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            filled: true,

            fillColor: AppColor.lightPrimaryColor,
            enabledBorder: InputBorder.none,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: AppColor.primaryColor, width: 2, style: BorderStyle.solid)),
            // labelText: labelText,
            hintText: hintText,
            hintStyle: TextStyle(color: AppColor.primaryColor),

            suffixIcon:suffixIcon,


          ),
        ),
      );
  }
}
