import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ServiceListComponent extends StatelessWidget {
  final List<Map<String, String>> serviceList = [
    {"name": "Plumbing", "image": "https://via.placeholder.com/100"},
    {"name": "Cleaning", "image": "https://via.placeholder.com/100"},
    {"name": "Electrical", "image": "https://via.placeholder.com/100"},
    {"name": "Painting", "image": "https://via.placeholder.com/100"},
  ]; // ✅ Dummy service data

  ServiceListComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Our Services", style: boldTextStyle(size: 18)), // ✅ Dummy text
            TextButton(
              onPressed: () {
                toast("View All Services Clicked"); // ✅ Dummy action
              },
              child: Text("View All", style: primaryTextStyle(color: Colors.blue)),
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
        8.height,
        serviceList.isNotEmpty
            ? Wrap(
          spacing: 16,
          runSpacing: 16,
          children: List.generate(serviceList.length, (index) {
            return Container(
              width: context.width() / 2 - 26,
              padding: EdgeInsets.all(8),
              decoration: boxDecorationWithRoundedCorners(
                borderRadius: BorderRadius.circular(8),
                backgroundColor: context.cardColor,
              ),
              child: Column(
                children: [
                  Image.network(serviceList[index]["image"]!, height: 80, width: 80, fit: BoxFit.cover),
                  8.height,
                  Text(serviceList[index]["name"]!, style: primaryTextStyle(size: 14)),
                ],
              ),
            );
          }),
        ).paddingSymmetric(horizontal: 16, vertical: 8)
            : Center(
          child: Text("No Services Found", style: primaryTextStyle(color: Colors.red)),
        ).paddingSymmetric(vertical: 32),
      ],
    );
  }
}
