import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shimmer/shimmer.dart';

class DashboardShimmer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Custom Appbar UI
          _buildShimmerBox(context.height() * 0.22, context.width())
              .cornerRadiusWithClipRRectOnly(bottomLeft: 30, bottomRight: 30),
          SizedBox(height: 16),

          /// Slider UI
          CarouselSlider(
            items: List.generate(3, (index) {
              return _buildShimmerBox(200, context.width(), borderRadius: 8);
            }),
            options: CarouselOptions(
              height: 200,
              enlargeCenterPage: true,
              viewportFraction: 0.8,
            ),
          ),
          SizedBox(height: 26),

          /// Upcoming Booking UI
          _buildShimmerBox(16, context.width() * 0.5).paddingLeft(16),
          _buildShimmerBox(200, context.width()).paddingSymmetric(vertical: 16, horizontal: 16),
          SizedBox(height: 16),

          /// Category UI
          _buildSectionShimmer(context),
          SizedBox(height: 20),

          /// Service List UI
          _buildSectionShimmer(context),
          SizedBox(height: 16),

          /// Featured Service List UI
          _buildSectionShimmer(context),
          SizedBox(height: 16),

          /// Post Job UI
          SizedBox(height: 16),
          _buildShimmerBox(160, context.width()),
        ],
      ),
    );
  }

  /// Reusable shimmer box
  Widget _buildShimmerBox(double height, double width, {double borderRadius = 0}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }

  /// Reusable section shimmer (for categories, services, featured services)
  Widget _buildSectionShimmer(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildShimmerBox(20, context.width() * 0.25),
            _buildShimmerBox(20, context.width() * 0.15),
          ],
        ).paddingSymmetric(horizontal: 16, vertical: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: List.generate(
              10,
                  (index) => Padding(
                padding: const EdgeInsets.only(right: 16),
                child: _buildShimmerBox(200, 280, borderRadius: 8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
