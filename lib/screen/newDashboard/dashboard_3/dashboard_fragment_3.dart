import 'package:auth_project/colour/colors.dart';
import 'package:auth_project/component/base_scaffold_widget.dart';
import 'package:auth_project/screen/newDashboard/dashboard_3/component/appbar_dashboard_component_3.dart';
import 'package:auth_project/screen/newDashboard/dashboard_3/component/category_list_dashboard_component_3.dart';
import 'package:auth_project/screen/newDashboard/dashboard_3/component/job_request_dahboard_component_3.dart';
import 'package:auth_project/screen/newDashboard/dashboard_3/component/slider_dashboard_component_3.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';


import 'component/upcoming_booking_dashboard_component_3.dart';

class DashboardFragment3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Status bar height
                (context.statusBarHeight).toInt().height,

                // Custom App Bar UI
                AppbarDashboardComponent3(
                  featuredList: [],
                  callback: () {},
                ),

                // Location button UI
                AppButton(
                  padding: EdgeInsets.all(0),
                  width: context.width(),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: boxDecorationDefault(color: context.cardColor),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      //  ic_location.iconImage(color: appStore.isDarkMode ? Colors.white : Colors.black, size: 24),
                        8.width,
                        Text(
                          "Current Location",
                          style: secondaryTextStyle(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ).expand(),
                        8.width,
                        Icon(Icons.keyboard_arrow_down, size: 24, color: primaryColor),
                      ],
                    ),
                  ),
                  onTap: () {},
                ).cornerRadiusWithClipRRect(28).paddingSymmetric(horizontal: 16),

                24.height,

                // // Slider UI
                // SliderDashboardComponent3( [
                //   {'sliderImage': 'assets/images/slider1.jpg', 'type': 'service', 'typeId': '1'},
                //   {'sliderImage': 'assets/images/slider2.jpg', 'type': 'service', 'typeId': '2'},
                //   {'sliderImage': 'assets/images/slider3.jpg', 'type': 'service', 'typeId': '3'},
                // ]),

                SliderDashboardComponent3(sliderList: [

                  {'sliderImage': 'assets/images/slider1.jpg', 'type': 'service', 'typeId': '1'},
                ],),

                // Upcoming booking UI
              //  UpcomingBookingDashboardComponent3(upcomingBookingData: []),

                16.height,

                // Category List UI
                CategoryListDashboardComponent3(
                  // categoryList: [
                  //   {'id': '1', 'title': 'Category 1', 'image': 'assets/images/category1.jpg'},
                  //   {'id': '2', 'title': 'Category 2', 'image': 'assets/images/category2.jpg'},
                  // ],
                  listTiTle: "Categories",
                ),

                16.height,

                // Service List UI
                // ServiceListDashboardComponent3(
                //   serviceList: [
                //     {'id': '1', 'title': 'Service 1', 'image': 'assets/images/service1.jpg'},
                //     {'id': '2', 'title': 'Service 2', 'image': 'assets/images/service2.jpg'},
                //   ],
                //   serviceListTitle: "Popular Services",
                // ),

                14.height,

                // Featured Services UI
                // ServiceListDashboardComponent3(
                //   serviceList: [
                //     {'id': '1', 'title': 'Featured Service 1', 'image': 'assets/images/featured_service1.jpg'},
                //     {'id': '2', 'title': 'Featured Service 2', 'image': 'assets/images/featured_service2.jpg'},
                //   ],
                //   serviceListTitle: "Featured Services",
                //   isFeatured: true,
                // ),

                16.height,

                // Job Request UI (if applicable)
                JobRequestDashboardComponent3(),
              ],
            ),
          ),

          // Loader
          // Observer(builder: (context) => LoaderWidget().visible(appStore.isLoading)),
        ],
      ),
    );
  }
}
