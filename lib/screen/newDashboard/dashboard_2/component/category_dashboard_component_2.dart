import 'package:auth_project/colour/colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CategoryDashboardComponent2 extends StatelessWidget {
  final String categoryName;
  final bool isSelected;

  CategoryDashboardComponent2({required this.categoryName, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width() / 4,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      alignment: Alignment.center,
      decoration: boxDecorationDefault(
        color: isSelected ? primaryColor : context.cardColor,
        borderRadius: BorderRadius.circular(defaultRadius + 16),
      ),
      child: Marquee(
        child: Text(
          categoryName,
          style: isSelected ? primaryTextStyle(color: Colors.white, size: 12) : primaryTextStyle(size: 12),
        ),
      ),
    );
  }
}
