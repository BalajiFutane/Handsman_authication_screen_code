import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ServiceListDashboardComponent1 extends StatelessWidget {
  final List<Map<String, String>> serviceList;

  ServiceListDashboardComponent1({required this.serviceList});

  @override
  Widget build(BuildContext context) {
    if (serviceList.isEmpty) return Offstage();

    return Container(
      padding: EdgeInsets.only(bottom: 16),
      margin: EdgeInsets.only(top: 16),
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
                Text("Services", style: boldTextStyle(size: 16)),
                Text("View All", style: boldTextStyle(color: Colors.blue, size: 12)).onTap(() {
                  // Implement navigation to all services screen
                }),
              ],
            ),
          ),
          8.height,
          if (serviceList.isNotEmpty)
            HorizontalList(
              itemCount: serviceList.length,
              spacing: 16,
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 26, top: 8),
              itemBuilder: (context, index) {
                var service = serviceList[index];
                return Container(
                  width: 280,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2)],
                  ),
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(service["image"]!, height: 120, width: 280, fit: BoxFit.cover),
                      8.height,
                      Text(service["name"]!, style: boldTextStyle(size: 14)),
                      4.height,
                      Text(service["description"]!, style: secondaryTextStyle(), maxLines: 2, overflow: TextOverflow.ellipsis),
                      8.height,
                      Text("\$${service["price"]}", style: boldTextStyle(color: Colors.green)),
                    ],
                  ),
                );
              },
            )
          else
            Center(
              child: Column(
                children: [
                  Image.asset('assets/images/no_data.png', height: 100),
                  8.height,
                  Text("No Services Found", style: secondaryTextStyle()),
                ],
              ),
            ).paddingSymmetric(horizontal: 16, vertical: 32),
        ],
      ),
    );
  }
}
