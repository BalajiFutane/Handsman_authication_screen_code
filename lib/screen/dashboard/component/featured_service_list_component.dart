import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// 📌 Dummy service model
class ServiceData {
  int? id;
  String? name;
  int? categoryId;

  ServiceData({this.id, this.name, this.categoryId});
}

// 📌 "View All Services" Screen (Placeholder)
class ViewAllServiceScreen extends StatelessWidget {
  final String? isFeatured;

  ViewAllServiceScreen({this.isFeatured});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Services")),
      body: Center(child: Text("All services will be displayed here.")),
    );
  }
}

// 📌 "No Data Found" Widget
class NoDataWidget extends StatelessWidget {
  final String title;
  final Widget? imageWidget;

  NoDataWidget({required this.title, this.imageWidget});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        imageWidget ?? Icon(Icons.error, size: 60, color: Colors.grey),
        16.height,
        Text(title, style: primaryTextStyle()),
      ],
    );
  }
}

// 📌 "View All" Label Component
class ViewAllLabel extends StatelessWidget {
  final String label;
  final List<dynamic> list;
  final VoidCallback onTap;

  ViewAllLabel({required this.label, required this.list, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: boldTextStyle(size: 18)),
        if (list.isNotEmpty)
          TextButton(
            onPressed: onTap,
            child: Text("View All", style: primaryTextStyle(color: Colors.blue)),
          ),
      ],
    );
  }
}

// 📌 Service Component
class ServiceComponent extends StatelessWidget {
  final ServiceData serviceData;
  final double width;
  final bool isBorderEnabled;

  ServiceComponent({required this.serviceData, required this.width, this.isBorderEnabled = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.cardColor,
        borderRadius: BorderRadius.circular(10),
        border: isBorderEnabled ? Border.all(color: Colors.grey) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.miscellaneous_services, size: 40),
          8.height,
          Text(serviceData.name ?? "Unknown Service", style: boldTextStyle(size: 14)),
        ],
      ),
    );
  }
}

// 📌 Featured Service List Component
class FeaturedServiceListComponent extends StatelessWidget {
  final List<ServiceData> serviceList;

  FeaturedServiceListComponent({required this.serviceList});

  // Dummy featured services if no data is available
  final List<ServiceData> dummyServices = [
    ServiceData(id: 1, name: "Haircut", categoryId: 1),
    ServiceData(id: 2, name: "Plumbing Repair", categoryId: 2),
    ServiceData(id: 3, name: "Electrician", categoryId: 3),
    ServiceData(id: 4, name: "House Cleaning", categoryId: 4),
  ];

  @override
  Widget build(BuildContext context) {
    List<ServiceData> finalServiceList = serviceList.isNotEmpty ? serviceList : dummyServices;

    return Container(
      padding: EdgeInsets.only(bottom: 16),
      width: context.width(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.height,
          ViewAllLabel(
            label: "Featured Services",
            list: finalServiceList,
            onTap: () {
              ViewAllServiceScreen(isFeatured: "1").launch(context);
            },
          ).paddingSymmetric(horizontal: 16),
          if (finalServiceList.isNotEmpty)
            HorizontalList(
              itemCount: finalServiceList.length,
              spacing: 16,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              itemBuilder: (context, index) => ServiceComponent(
                serviceData: finalServiceList[index],
                width: 280,
                isBorderEnabled: true,
              ),
            )
          else
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: NoDataWidget(
                title: "No Featured Services Available",
                imageWidget: Icon(Icons.warning, size: 60, color: Colors.orange),
              ),
            ).center(),
        ],
      ),
    );
  }
}
