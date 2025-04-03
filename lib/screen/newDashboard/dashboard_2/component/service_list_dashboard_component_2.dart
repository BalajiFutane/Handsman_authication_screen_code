import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'service_dashboard_component_2.dart';

class ServiceListDashboardComponent2 extends StatelessWidget {
  final List<Map<String, dynamic>> serviceList;
  final String serviceListTitle;
  final bool isFeatured;

  ServiceListDashboardComponent2({
    required this.serviceList,
    this.serviceListTitle = '',
    this.isFeatured = false,
  });

  @override
  Widget build(BuildContext context) {
    if (serviceList.isEmpty) return SizedBox.shrink();

    return Container(
      width: context.width(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.height,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(serviceListTitle, style: boldTextStyle(size: 18)),
                TextButton(
                  onPressed: () => toast("View All Clicked"),
                  child: Text("View All", style: boldTextStyle(color: Colors.blue, size: 12)),
                ),
              ],
            ),
          ),
          8.height,
          if (serviceList.isNotEmpty)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 26),
              child: Row(
                children: serviceList.map((service) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: ServiceDashboardComponent2(
                      serviceName: service['name'],
                      serviceCategory: service['category'],
                      servicePrice: service['price'],
                      discount: service['discount'],
                      providerName: service['providerName'],
                      providerImage: service['providerImage'],
                      isFavourite: service['isFavourite'],
                    ),
                  );
                }).toList(),
              ),
            )
          else
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Column(
                  children: [
                    Icon(Icons.error_outline, size: 50, color: Colors.grey),
                    8.height,
                    Text("No services found", style: secondaryTextStyle(size: 16)),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
