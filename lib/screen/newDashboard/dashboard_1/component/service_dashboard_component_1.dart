import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ServiceDashboardComponent1 extends StatelessWidget {
  final Map<String, dynamic> serviceData;
  final double? width;
  final bool isFavouriteService;

  ServiceDashboardComponent1({
    required this.serviceData,
    this.width,
    this.isFavouriteService = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toast("Navigating to Service Details...");
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2)],
        ),
        width: width ?? 280,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service Image
            Stack(
              children: [
                Image.asset(serviceData["image"], height: 180, width: double.infinity, fit: BoxFit.cover)
                    .cornerRadiusWithClipRRectOnly(topLeft: 8, topRight: 8),
                if (isFavouriteService)
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Icon(Icons.favorite, color: Colors.red, size: 24),
                  ),
              ],
            ),
            12.height,

            // Service Name
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(serviceData["name"], style: boldTextStyle(size: 14), maxLines: 2, overflow: TextOverflow.ellipsis),
            ),
            8.height,

            // Rating & Price
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Rating
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      4.width,
                      Text(serviceData["rating"].toString(), style: primaryTextStyle(size: 14)),
                    ],
                  ),
                  // Price
                  Text("\$${serviceData["price"]}", style: boldTextStyle(color: Colors.green, size: 14)),
                ],
              ),
            ),
            12.height,
          ],
        ),
      ),
    );
  }
}
