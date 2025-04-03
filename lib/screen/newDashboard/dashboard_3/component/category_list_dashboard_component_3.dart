import 'package:auth_project/colour/colors.dart';
import 'package:auth_project/screen/dashboard/component/featured_service_list_component.dart';
import 'package:auth_project/screen/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../category/category_screen.dart';
import 'category_dashboard_component_3.dart';

// Dummy data to replace backend dependency
class CategoryData {
  final int id;
  final String name;
  final String image;

  CategoryData({required this.id, required this.name, required this.image});
}

class CategoryListDashboardComponent3 extends StatelessWidget {
  // Hardcoded mock data to replace the backend dependency
  final List<CategoryData> categoryList = [
    CategoryData(id: 1, name: 'Category 1', image: 'https://example.com/image1.png'),
    CategoryData(id: 2, name: 'Category 2', image: 'https://example.com/image2.png'),
    CategoryData(id: 3, name: 'Category 3', image: 'https://example.com/image3.png'),
    CategoryData(id: 4, name: 'Category 4', image: 'https://example.com/image4.png'),
  ];

  final String listTiTle;

  // Constructor with optional title
  CategoryListDashboardComponent3({this.listTiTle = ''});

  @override
  Widget build(BuildContext context) {
    if (categoryList.isEmpty) return Offstage();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.height,
        ViewAllLabel(
          label: listTiTle,
          list: categoryList,
         // trailingTextStyle: boldTextStyle(color: primaryColor, size: 12),
          onTap: () {
            CategoryScreen().launch(context).then((value) {
              setStatusBarColor(Colors.transparent, statusBarIconBrightness: Brightness.dark);
            });
          },
        ).paddingSymmetric(horizontal: 16),
        // if (categoryList.isNotEmpty)
          // HorizontalList(
          //   itemCount: categoryList.length,
          //   spacing: 16,
          //   padding: EdgeInsets.symmetric(horizontal: 16),
          //   itemBuilder: (context, index) {
          //     return CategoryDashboardComponent3(
          //       categoryData: categoryList[index],
          //     );
          //   },
          // ),
      ],
    );
  }
}
