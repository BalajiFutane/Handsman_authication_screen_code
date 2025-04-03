// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:nb_utils/nb_utils.dart';
//
// class CategoryWidget extends StatelessWidget {
//   final Map<String, dynamic> categoryData;
//   final double? width;
//   final bool? isFromCategory;
//
//   CategoryWidget({required this.categoryData, this.width, this.isFromCategory});
//
//   Widget buildCategoryComponent(BuildContext context) {
//     return SizedBox(
//       width: width ?? context.width() / 4 - 20,
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(14),
//             decoration: BoxDecoration(color: context.cardColor, shape: BoxShape.circle),
//             child: Icon(
//               categoryData['icon'], // Fetch icon from dummy data
//               size: 40,
//               color: Colors.black, // Adjust color as needed
//             ),
//           ),
//           4.height,
//           Text(
//             categoryData['name'], // Fetch name from dummy data
//             style: primaryTextStyle(size: 12),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return buildCategoryComponent(context);
//   }
// }





import 'package:auth_project/colour/colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

/// Dummy Category Model
class CategoryData {
  final String name;
  final String imagePath; // Local asset image path

  CategoryData({required this.name, required this.imagePath});
}

/// Dummy Data for Categories (You can replace with real images)
List<CategoryData> dummyCategories = [
  CategoryData(name: "AC CoolCare", imagePath: "assets/icon/ic_arrow_left.png"),
  CategoryData(name: "Cooking", imagePath: "assets/icon/ic_arrow_left.png"),
  CategoryData(name: "Painter", imagePath: "assets/icon/ic_arrow_left.png"),
  CategoryData(name: "Plumber", imagePath: "assets/icon/ic_arrow_left.png"),
];

/// Category UI Component
class CategoryListComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Header - Categories + View All Button
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Categories", style: boldTextStyle(size: 16)),
              TextButton(
                onPressed: () => toast("View All Clicked"), // Replace with navigation
                child: Text("View All", style: boldTextStyle(color: primaryColor, size: 12)),
              ),
            ],
          ),
        ),

        /// Horizontal Scrollable Category List
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: dummyCategories.map((category) {
              return Column(
                children: [
                  /// Circular Category Icon
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[100], // Background color
                    ),
                    child: Image.asset(category.imagePath, height: 45, width: 45), // Category Image
                  ),

                  8.height, // Spacing

                  /// Category Name
                  Text(category.name, style: primaryTextStyle(size: 12)),
                ],
              ).paddingRight(30); // Add spacing between categories
            }).toList(),
          ),
        ),
      ],
    );
  }
}
