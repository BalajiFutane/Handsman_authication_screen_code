
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class BackWidget extends StatelessWidget {
  final Function()? onPressed;
  final Color? iconColor;

  BackWidget({this.onPressed, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ??
          () {
            finish(context);
          },
      // icon: ic_arrow_left.iconImage(color: iconColor ?? Colors.white),
     icon:    Image.asset(
          'assets/icon/ic_arrow_left.png',  // Path to your image
          color: iconColor ?? Colors.white,  // Apply color filter if needed
          height: 24,  // Adjust size as needed
          width: 24,
        ),
    );
  }
}
