import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ServiceDashboardComponent2 extends StatelessWidget {
  final String serviceName;
  final String serviceCategory;
  final double servicePrice;
  final double? discount;
  final String providerName;
  final String providerImage;
  final bool isFavourite;

  ServiceDashboardComponent2({
    required this.serviceName,
    required this.serviceCategory,
    required this.servicePrice,
    this.discount,
    required this.providerName,
    required this.providerImage,
    this.isFavourite = false,
  });

  num get discountedAmount => discount != null ? (servicePrice - (servicePrice * (discount! / 100))) : servicePrice;

  void bookNow(BuildContext context) {
    toast("Book Now clicked for $serviceName");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => toast("Service Clicked: $serviceName"),
      child: Container(
        decoration: boxDecorationWithRoundedCorners(
          borderRadius: radius(),
          backgroundColor: context.cardColor,
        ),
        width: context.width(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 180,
              width: context.width(),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 180,
                    width: context.width(),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                    ),
                    child: Center(child: Icon(Icons.image, size: 50, color: Colors.grey.shade600)),
                  ),
                  if (isFavourite)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Icon(Icons.favorite, color: Colors.red, size: 24),
                    ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(serviceName, style: boldTextStyle(), maxLines: 1, overflow: TextOverflow.ellipsis),
                  8.height,
                  Text(serviceCategory.toUpperCase(), style: secondaryTextStyle(size: 12, color: Colors.blue)),
                  8.height,
                  Row(
                    children: [
                      if (discount != null)
                        Text("\$${discountedAmount.toStringAsFixed(2)}", style: boldTextStyle(color: Colors.green, size: 16)),
                      if (discount != null) 8.width,
                      Text("\$${servicePrice.toStringAsFixed(2)}",
                          style: discount != null
                              ? secondaryTextStyle(size: 14, decoration: TextDecoration.lineThrough)
                              : boldTextStyle(color: Colors.green, size: 16)),
                    ],
                  ),
                  16.height,
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(providerImage),
                        radius: 16,
                      ),
                      8.width,
                      Expanded(
                        child: Text(providerName, style: secondaryTextStyle(size: 12)),
                      ),
                    ],
                  ),
                  16.height,
                  AppButton(
                    onTap: () => bookNow(context),
                    color: context.primaryColor,
                    child: Text("Book Now", style: boldTextStyle(color: Colors.white)),
                    width: context.width(),
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
