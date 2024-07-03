import 'package:crud_getx/constant/export.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  Color? color, textColor;
  final double width;
  final double height;
  final bool img;
  final String? imgicon;

  CustomButton({
    Key? key,
    this.width = 1,
    this.height = 50,
    this.text='' ,
    required this.press,
    this.color,
    this.img = false,
    this.imgicon,
    this.textColor = AppColor.whiteColor,
  }) : super(key: key) {
    color = color;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: button(),
      ),
    );
  }


  Widget button(){
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 50,
        width: 50,
        color: AppColor.primaryColor,
        child: img
            ? Image.asset(imgicon??AppImage.google,color: AppColor.whiteColor,)
            : Center(
              child: Text(
          text,
          style: TextStyle(color: textColor,fontSize: 17,fontWeight: FontWeight.bold),
        ),
            ),
      ),
    );
  }

  Widget newElevatedButton() {
    print("$imgicon");
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          primary: color,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          textStyle: poppinsMedium.copyWith(fontSize: 14)),
      child: img
          ? Image.asset(imgicon??AppImage.google,scale: 1,color: AppColor.whiteColor,)
          : Text(
              text,
              style: TextStyle(color: textColor,fontSize: 14),
            ),
    );
  }
}
