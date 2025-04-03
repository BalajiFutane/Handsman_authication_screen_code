import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

import 'component/category_list_dashboard_component_2.dart';
import 'component/confirm_dashboard_booking_component_2.dart';
import 'component/custom_appbar_dashboard_component_2.dart';
import 'component/job_request_dashboard_component_2.dart';
import 'component/service_list_dashboard_component_2.dart';
import 'component/slider_dashboard_component_2.dart';
import 'shimmer/dashboard_shimmer_2.dart';

class DashboardFragment2 extends StatefulWidget {
  @override
  _DashboardFragment2State createState() => _DashboardFragment2State();
}

class _DashboardFragment2State extends State<DashboardFragment2> {
  bool isLoading = true;

  List<Map<String, String>> sliderData = [
    {"sliderImage": "https://via.placeholder.com/400", "type": "SERVICE", "typeId": "1"},
    {"sliderImage": "https://via.placeholder.com/400", "type": "SERVICE", "typeId": "2"},
    {"sliderImage": "https://via.placeholder.com/400", "type": "SERVICE", "typeId": "3"},
  ];

  List<Map<String, String>> serviceData = [
    {"serviceName": "Plumbing", "image": "https://via.placeholder.com/150"},
    {"serviceName": "Cleaning", "image": "https://via.placeholder.com/150"},
    {"serviceName": "Electrical", "image": "https://via.placeholder.com/150"},
  ];

  List<Map<String, String>> categoryData = [
    {"categoryName": "Home Services", "icon": "https://via.placeholder.com/100"},
    {"categoryName": "Automobile", "icon": "https://via.placeholder.com/100"},
    {"categoryName": "Health", "icon": "https://via.placeholder.com/100"},
  ];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(Duration(seconds: 2)); // Simulating network delay
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? DashboardShimmer2()
          : AnimatedScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        listAnimationType: ListAnimationType.FadeIn,
        fadeInConfiguration: FadeInConfiguration(duration: 2.seconds),
        onSwipeRefresh: _loadData,
        children: [
          CustomAppbarDashboardComponent2(),
          SizedBox(height: 16),
          SliderDashboardComponent2(sliderList: sliderData),
          ConfirmDashboardBookingComponent2(),
          SizedBox(height: 16),
          CategoryListDashboardComponent2(),
          SizedBox(height: 20),
          ServiceListDashboardComponent2(serviceList: serviceData, serviceListTitle: "Services"),
          SizedBox(height: 16),
          ServiceListDashboardComponent2(serviceList: serviceData, serviceListTitle: "Featured Services", isFeatured: true),
          SizedBox(height: 16),
          JobRequestDashboardComponent2(),
        ],
      ),
    );
  }
}
