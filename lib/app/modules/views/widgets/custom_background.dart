

import 'package:crud_getx/constant/export.dart';

class CustomBackGround extends StatelessWidget {
  final Widget? child;
  final bool isBackGroundImage;

  CustomBackGround({Key? key, this.child, this.isBackGroundImage = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isBackGroundImage)
          Positioned.fill(
            child: Image.asset(
              AppImage.welcome,
              fit: BoxFit.cover,
            ),
          ),
        if (child != null) child!,
      ],
    );
  }
}
