import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';

class CategoryDashboardComponent3 extends StatelessWidget {
  final String categoryImage;
  final String categoryName;
  final double? width;

  CategoryDashboardComponent3({
    required this.categoryImage,
    required this.categoryName,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to a new screen or perform some action on tap
      },
      child: SizedBox(
        width: width ?? context.width() / 4 - 8,
        child: Column(
          children: [
            categoryImage.endsWith('.svg')
                ? Container(
              width: 50, // Adjust icon size
              height: 50, // Adjust icon size
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: context.cardColor,
                shape: BoxShape.rectangle,
                borderRadius: radius(8),
              ),
              child: Column(
                children: [
                  SvgPicture.network(
                    categoryImage,
                    height: 50,
                    width: 50,
                    color: Colors.black,
                    placeholderBuilder: (context) => Placeholder(
                      fallbackHeight: 50,
                      fallbackWidth: 50,
                    ),
                  ).paddingAll(10),
                  SizedBox(height: 6),
                  Marquee(
                    directionMarguee: DirectionMarguee.oneDirection,
                    child: Text(
                      categoryName,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            )
                : Container(
              padding: EdgeInsets.all(14),
              width: width ?? context.width() / 4 - 8,
              decoration: BoxDecoration(
                color: Colors.white24, // Adjust background color
                shape: BoxShape.rectangle,
                borderRadius: radius(8),
              ),
              child: Column(
                children: [
                  Image.network(
                    categoryImage,
                    fit: BoxFit.cover,
                    width: 40,
                    height: 40,
                    // Remove circle: true since it is static now
                  ),
                  SizedBox(height: 16),
                  Marquee(
                    directionMarguee: DirectionMarguee.oneDirection,
                    child: Text(
                      categoryName,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
