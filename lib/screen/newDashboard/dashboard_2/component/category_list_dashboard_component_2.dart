import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'category_dashboard_component_2.dart'; // Import the modified UI component

class CategoryListDashboardComponent2 extends StatefulWidget {
  @override
  _CategoryListDashboardComponent2State createState() => _CategoryListDashboardComponent2State();
}

class _CategoryListDashboardComponent2State extends State<CategoryListDashboardComponent2> {
  int currentIndex = 0;

  // Dummy Data for Categories
  List<String> categoryList = ["Plumbing", "Electrician", "Cleaning", "Carpentry", "Painting"];

  @override
  Widget build(BuildContext context) {
    if (categoryList.isEmpty) return Offstage(); // Hide component if empty

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // View All Label
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Categories", style: boldTextStyle(size: 16)),
              GestureDetector(
                onTap: () {
                  toast("View All Categories Clicked!");
                },
                child: Text("View All", style: boldTextStyle(color: Colors.blue, size: 12)),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),

        // Horizontal Category List
        HorizontalList(
          itemCount: categoryList.length,
          padding: EdgeInsets.only(left: 16, right: 16),
          runSpacing: 8,
          spacing: 12,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                setState(() => currentIndex = i);
                toast("Selected Category: ${categoryList[i]}");
              },
              child: CategoryDashboardComponent2(
                categoryName: categoryList[i],
                isSelected: currentIndex == i,
              ),
            );
          },
        ),
      ],
    );
  }
}
