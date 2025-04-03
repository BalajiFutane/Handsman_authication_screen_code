import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class JobRequestDashboardComponent2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.33, 0.65, 0.99],
          colors: [
            Color(0xFF4647a0),
            Color(0xFF36377c),
            Color(0xFF272759),
          ],
        ),
      ),
      child: Column(
        children: [
          16.height,
          Text(
            "If you didn't find what you were looking for, create a new request!",
            style: primaryTextStyle(size: 16, color: Colors.white),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          20.height,
          AppButton(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add, color: Colors.white),
                4.width,
                Text("New Request", style: boldTextStyle(color: Colors.white)),
              ],
            ),
            color: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            onTap: () {
              toast("New request clicked!");
            },
          ),
          16.height,
        ],
      ),
    );
  }
}
