import 'package:flutter/material.dart';

import 'component/booking_confirmed_component_1.dart';
import 'component/feature_services_dashboard_component_1.dart';
import 'component/job_request_dashboard_component_1.dart';
import 'component/service_list_dashboard_component_1.dart';
import 'component/slider_dashboard_component_1.dart';

class DashboardFragment1 extends StatefulWidget {
  @override
  _DashboardFragment1State createState() => _DashboardFragment1State();
}

class _DashboardFragment1State extends State<DashboardFragment1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dummy Slider Component
            SliderDashboardComponent1(
            sliderList: [
            "assets/images/slider1.jpg",
            "assets/images/slider2.jpg",
            "assets/images/slider3.jpg",
            ],
            callback: () {
      print("Location tapped!");
      },),
            SizedBox(height: 16),

            // Dummy Booking Confirmed Component
            BookingConfirmedComponent1(
              upcomingConfirmedBooking: null, // No actual data
            ),
            SizedBox(height: 16),

            // Dummy Service List Component
            ServiceListDashboardComponent1(
              serviceList: [
                {"name": "Plumbing Service", "image": "assets/icon/IMG_8994.JPG"},
                {"name": "Electrician", "image": "assets/images/service2.jpg"},
                {"name": "House Cleaning", "image": "assets/images/service3.jpg"},
              ],
            ),
            SizedBox(height: 16),

            // Dummy Featured Services Component
            FeatureServicesDashboardComponent1(
              serviceList: [
                ServiceData(name: "AC Repair", imageUrl: "assets/icon/IMG_8994.JPG"),
                ServiceData(name: "Carpentry", imageUrl: "assets/images/service5.jpg"),
              ],
            ),

            SizedBox(height: 16),

            // Dummy Job Request Component
            NewJobRequestDashboardComponent1(),

            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
