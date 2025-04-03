import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CategoryDashboardComponent4 extends StatelessWidget {
  final CategoryData categoryData;
  final double? width;

  CategoryDashboardComponent4({required this.categoryData, this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigating to ViewAllServiceScreen with categoryId and categoryName
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewAllServiceScreen(
              categoryId: categoryData.id,
              categoryName: categoryData.name,
              isFromCategory: true,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          // Checking if the category image is an SVG or a regular image
          categoryData.categoryImage.endsWith('.svg')
              ? Container(
            width: width ?? MediaQuery.of(context).size.width / 4 - 22,
            height: 85,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(
              categoryData.categoryImage,
              height: 85,
              width: width ?? MediaQuery.of(context).size.width / 4 - 22,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : _hexToColor(categoryData.color),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(child: CircularProgressIndicator());
              },
            ).paddingAll(10),
          )
              : Container(
            padding: EdgeInsets.only(left: 14, right: 14, bottom: 14),
            height: 85,
            width: width ?? MediaQuery.of(context).size.width / 4 - 22,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white24
                  : Theme.of(context).cardColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
              border: Theme.of(context).brightness == Brightness.dark
                  ? Border.all(color: Colors.grey)
                  : null,
            ),
            child: Image.network(
              categoryData.categoryImage,
              height: 85,
              width: width ?? MediaQuery.of(context).size.width / 4 - 22,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 85,
            width: width ?? MediaQuery.of(context).size.width / 4 - 22,
            decoration: BoxDecoration(
              boxShadow: [],
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black12,
                  Colors.black12,
                  Colors.black12,
                  Colors.black26,
                  Colors.black38,
                  Colors.black45,
                  Colors.black87,
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 6,
            left: 4,
            right: 4,
            child: Marquee(
              child: Text(
                categoryData.name,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
              ),
            ).center(),
          ),
        ],
      ),
    );
  }

  // Helper function to convert hex color strings to Color objects
  Color _hexToColor(String hexColor) {
    hexColor = hexColor.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor; // Adding alpha value
    }
    return Color(int.parse('0x$hexColor'));
  }
}

// Dummy ViewAllServiceScreen to simulate the navigation
class ViewAllServiceScreen extends StatelessWidget {
  final String categoryId;
  final String categoryName;
  final bool isFromCategory;

  ViewAllServiceScreen({
    required this.categoryId,
    required this.categoryName,
    required this.isFromCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      body: Center(child: Text('View all services for $categoryName')),
    );
  }
}

// Sample CategoryData class
class CategoryData {
  final String id;
  final String name;
  final String categoryImage;
  final String color;

  CategoryData({
    required this.id,
    required this.name,
    required this.categoryImage,
    required this.color,
  });
}
