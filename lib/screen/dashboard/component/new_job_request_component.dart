import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class NewJobRequestComponent extends StatelessWidget {
  const NewJobRequestComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: boxDecorationWithRoundedCorners(
        backgroundColor: context.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(defaultRadius),
          topRight: Radius.circular(defaultRadius),
        ),
      ),
      width: context.width(),
      child: Column(
        children: [
          16.height,
          Text(
            "Post a new job request",  // ✅ Dummy text
            style: primaryTextStyle(color: white, size: 16),
            textAlign: TextAlign.center,
          ),
          20.height,
          AppButton(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add, color: Colors.white), // ✅ Removed dark mode logic
                4.width,
                Text(
                  "New Job Request", // ✅ Dummy text
                  style: boldTextStyle(color: Colors.white),
                ),
              ],
            ),
            textStyle: primaryTextStyle(color: Colors.white),
            onTap: () {
              // ✅ Dummy Click Action (No Backend)
              toast("Job Request Button Clicked");
            },
          ),
          16.height,
        ],
      ),
    );
  }
}
