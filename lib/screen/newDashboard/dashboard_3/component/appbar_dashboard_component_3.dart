import 'package:auth_project/screen/dashboard/component/featured_service_list_component.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';


class AppbarDashboardComponent3 extends StatefulWidget {
  final List<ServiceData> featuredList;
  final VoidCallback? callback;

  AppbarDashboardComponent3({required this.featuredList, this.callback});

  @override
  State<AppbarDashboardComponent3> createState() => _AppbarDashboardComponent3State();
}

class _AppbarDashboardComponent3State extends State<AppbarDashboardComponent3> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    // Replace backend-related variables with static values or mock data
    bool isLoggedIn = false; // No actual backend check
    String userProfileImage = "assets/icons/user_icon.png"; // Placeholder image
    String userFullName = "Guest User"; // Static name for guest
    int unreadCount = 3; // Static unread count (example)

    return Row(
      children: [
        if (isLoggedIn)
          Image.asset(userProfileImage, height: 44, width: 44, fit: BoxFit.cover)
              .cornerRadiusWithClipRRect(100)
              .paddingRight(16),
        Row(
          children: [
            Text(
              isLoggedIn ? userFullName : 'Hello, Guest!',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: boldTextStyle(),
            ),
            // !isLoggedIn
                // ? Image.asset(ic_hi, height: 20, fit: BoxFit.cover)
                // : Offstage(),
          ],
        ).expand(),
        16.width,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: unreadCount > 0 ? 10 : 8),
          decoration: boxDecorationDefault(
            color: context.cardColor,
            borderRadius: radius(28),
          ),
          child: Row(
            children: [
              // Simplified search button with an icon (no backend logic)
              Icon(Icons.search, size: 18).onTap(() {
              //  SearchServiceScreen(featuredList: widget.featuredList).launch(context);
              }),
              if (isLoggedIn)
                Container(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(Icons.notifications, size: 18).center(),
                      if (unreadCount > 0)
                        Positioned(
                          top: -2,
                          right: 2,
                          child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                    ],
                  ),
                ).paddingLeft(12).onTap(() {
               //   NotificationScreen().launch(context);
                })
            ],
          ),
        )
      ],
    ).paddingSymmetric(horizontal: 16, vertical: 16);
  }
}
