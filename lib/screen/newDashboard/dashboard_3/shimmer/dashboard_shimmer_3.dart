import 'package:auth_project/component/base_scaffold_widget.dart';
import 'package:auth_project/screen/dashboard/shimmer/dashboard_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main.dart';

class DashboardShimmer3 extends StatelessWidget {

  // A helper function to simplify shimmer container creation
  Widget _shimmerContainer({required double height, required double width, BorderRadius? borderRadius}) {
    return ShimmerWidget(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          // color: context.cardColor,
          borderRadius: borderRadius ?? BorderRadius.zero,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (context.statusBarHeight).toInt().height,

          /// Custom App Bar UI
          Row(
            children: [
              _shimmerContainer(height: 44, width: 44, borderRadius: BorderRadius.circular(22)),
              16.width,
              _shimmerContainer(height: 16, width: context.width()).expand(),
              16.width,
              _shimmerContainer(
                height: 60,
                width: context.width() / 4,
                borderRadius: BorderRadius.circular(defaultRadius + 16),
              ),
            ],
          ).paddingSymmetric(horizontal: 16, vertical: 16),

          /// Location TextField UI
          _shimmerContainer(height: 60, width: context.width()).cornerRadiusWithClipRRect(28).paddingAll(16),
          16.height,

          /// Slider UI
          _shimmerContainer(height: 190, width: context.width()).paddingSymmetric(horizontal: 16),
          26.height,

          /// Upcoming Booking UI
          _shimmerContainer(height: 16, width: context.width() * 0.5).paddingLeft(16),
          _shimmerContainer(height: 200, width: context.width()).paddingSymmetric(vertical: 16, horizontal: 16),
          16.height,

          /// Category UI
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _shimmerContainer(height: 20, width: context.width() * 0.25),
                  _shimmerContainer(height: 20, width: context.width() * 0.15),
                ],
              ).paddingSymmetric(horizontal: 16, vertical: 16),
              HorizontalList(
                itemCount: 10,
                padding: EdgeInsets.only(left: 16, right: 16),
                runSpacing: 8,
                spacing: 12,
                itemBuilder: (_, i) {
                  return _shimmerContainer(
                    height: 85,
                    width: context.width() / 4 - 24,
                    borderRadius: BorderRadius.circular(8),
                  );
                },
              ),
            ],
          ),
          16.height,

          /// Service List UI
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _shimmerContainer(height: 20, width: context.width() * 0.25),
                  _shimmerContainer(height: 20, width: context.width() * 0.15),
                ],
              ).paddingSymmetric(horizontal: 16, vertical: 8),
              HorizontalList(
                itemCount: 10,
                spacing: 16,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: boxDecorationWithRoundedCorners(
                      borderRadius: radius(),
                      backgroundColor: context.cardColor,
                      // border: appStore.isDarkMode ? Border.all(color: context.dividerColor) : null,
                    ),
                    child: _shimmerContainer(width: 280, height: 200),
                  );
                },
              )
            ],
          ).paddingSymmetric(vertical: 16),

          /// Post Job UI
          16.height,
          _shimmerContainer(height: 180, width: context.width()),
          16.height,

          /// Featured Service List UI
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _shimmerContainer(height: 20, width: context.width() * 0.25),
                  _shimmerContainer(height: 20, width: context.width() * 0.15),
                ],
              ).paddingSymmetric(horizontal: 16, vertical: 8),
              HorizontalList(
                itemCount: 10,
                spacing: 16,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: boxDecorationWithRoundedCorners(
                      borderRadius: radius(),
                      backgroundColor: context.cardColor,
                      // border: appStore.isDarkMode ? Border.all(color: context.dividerColor) : null,
                    ),
                    child: _shimmerContainer(width: 280, height: 200),
                  );
                },
              )
            ],
          ).paddingSymmetric(vertical: 16),
        ],
      ),
    );
  }
}
