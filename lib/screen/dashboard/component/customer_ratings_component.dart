import 'package:auth_project/colour/colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';


class CustomerRatingsComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      width: context.width(),
      decoration: boxDecorationDefault(color: primaryColor, borderRadius: radius(0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image.asset(ic_customer_rating_stars), // Static image asset
          26.height,
          Text("Introducing Customer Ratings", style: primaryTextStyle(size: 18, color: Colors.white)), // Static text
          16.height,
          AppButton(
            text: "See Your Ratings",
            textStyle: primaryTextStyle(color: Colors.black),
            onTap: () {
              // Show a simple alert instead of navigating to a backend-dependent screen
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Customer Ratings"),
                    content: Text("This is a dummy customer rating screen."),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("OK"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
