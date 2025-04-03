import 'package:auth_project/colour/colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class JobRequestDashboardComponent3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace appStore.isLoggedIn with a static value (false for guest user)
    bool isLoggedIn = false; // Static login state

    return Container(
      width: context.width(),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: primaryColor,
        // image: DecorationImage(image: AssetImage()),
        shape: BoxShape.rectangle,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          14.height,
          // Image.asset(people),
          14.height,
          Text(
            'If you didn\'t find your request, try creating a new one!', // Static text in place of language.ifYouDidnTFind
            style: boldTextStyle(color: Colors.white, size: 16),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          14.height,
          TextButton(
            onPressed: () {
              if (isLoggedIn) {
                // Since we're not navigating to MyPostRequestListScreen in this example,
                // replace it with a simple print or mock screen navigation
                print("Navigate to MyPostRequestListScreen");
              } else {
                // Mocking the SignInScreen and navigation
                print("User not logged in, navigate to SignInScreen...");
                // For now, simply simulate that login is successful and navigate to the next screen
                bool isLoggedInAfterSignIn = true; // Simulated successful login
                if (isLoggedInAfterSignIn) {
                  print("Navigate to MyPostRequestListScreen");
                }
              }
            },
            child: Text(
              'Create New Request', // Static text for the new request button
              style: boldTextStyle(color: Colors.black, decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}
