import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CategoryShimmer extends StatelessWidget {
  CategoryShimmer({Key? key}) : super(key: key); // Constructor added

  final List<Map<String, dynamic>> dummyCategories = [
    {"name": "Salon", "icon": Icons.cut},
    {"name": "Plumber", "icon": Icons.build},
    {"name": "Electrician", "icon": Icons.electrical_services},
    {"name": "Cleaning", "icon": Icons.cleaning_services},
    {"name": "Painting", "icon": Icons.format_paint},
    {"name": "Car Repair", "icon": Icons.car_repair},
    {"name": "Home Repair", "icon": Icons.home_repair_service},
    {"name": "Laundry", "icon": Icons.local_laundry_service},
    {"name": "Mechanic", "icon": Icons.handyman},
    {"name": "Gardening", "icon": Icons.nature},
    {"name": "Catering", "icon": Icons.restaurant},
    {"name": "Tutoring", "icon": Icons.school},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: AnimatedWrap(
        runSpacing: 16,
        spacing: 16,
        itemCount: dummyCategories.length,
        listAnimationType: ListAnimationType.None,
        scaleConfiguration: ScaleConfiguration(duration: 300.milliseconds, delay: 50.milliseconds),
        itemBuilder: (_, index) {
          return SizedBox(
            width: context.width() / 4 - 20,
            child: Column(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: context.cardColor, shape: BoxShape.circle),
                  child: Icon(dummyCategories[index]["icon"], size: 30, color: Colors.black),
                ),
                4.height,
                Text(dummyCategories[index]["name"], style: primaryTextStyle(), textAlign: TextAlign.center),
              ],
            ),
          );
        },
      ),
    );
  }
}
