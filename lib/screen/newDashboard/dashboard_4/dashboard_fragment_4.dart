import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'component/app_bar_dashboard_component_4.dart';
import 'component/service_list_dashboard_component_4.dart';
import 'component/upcoming_booking_dashboard_component_4.dart';
import 'component/category_list_dashboard_component_4.dart';
import 'component/job_request_dashboard_component_4.dart';
import 'component/slider_dashboard_component_4.dart';
import 'shimmer/dashboard_shimmer_4.dart';

class DashboardFragment4 extends StatefulWidget {
  @override
  _DashboardFragment4State createState() => _DashboardFragment4State();
}

class _DashboardFragment4State extends State<DashboardFragment4> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Dummy Data for UI
    var featuredServices = List.generate(5, (index) => "Featured Service ${index + 1}");
    var categories = List.generate(5, (index) => "Category ${index + 1}");
    var upcomingBookings = List.generate(3, (index) => "Upcoming Booking ${index + 1}");
    var sliders = List.generate(3, (index) => "Slider Item ${index + 1}");
    var services = List.generate(10, (index) => "Service ${index + 1}");
    var featuredServicesList = List.generate(5, (index) => "Featured Service ${index + 6}");

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                AppBarDashboardComponent4(
            //      featuredList: featuredServices,
                  callback: () {
                    setState(() {});
                  },
                ),
                40.height,
                // CategoryListDashboardComponent4(
                //  // categoryList: categories,
                //   listTiTle: 'Category',
               // ),
                // UpComingBookingDashboardComponent4(
                //   upComingBookingData: upcomingBookings,
                // ),
                30.height,
                // SliderDashboardComponent4(
                //   sliderList: sliders,
                // ),
                30.height,
                // ServiceListDashboardComponent4(
                //   serviceList: services,
                //   serviceListTitle: 'Services',
                // ),
                16.height,
                // ServiceListDashboardComponent4(
                //   serviceList: featuredServicesList,
                //   serviceListTitle: 'Featured Services',
                //   isFeatured: true,
                // ),
                16.height,
                if (true) JobRequestDashboardComponent4(), // Dummy conditional for UI
              ],
            ),
          ),
          // Observer(builder: (context) => LoaderWidget().visible(false)), // Assuming loading is false for dummy UI
        ],
      ),
    );
  }
}
