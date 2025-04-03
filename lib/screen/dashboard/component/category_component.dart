


import 'package:auth_project/colour/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ServiceList extends StatelessWidget {
  final List<ServiceData> services = [
    ServiceData(
      name: "Filter Replacement",
      category: "AC MAINTENANCE AI",
      price: 15.00,
      rating: 0,
      providerName: "Felix Harris",
    ),
    ServiceData(
      name: "Full Home Cleaning",
      category: "RESIDENTIAL CLEANING",
      price: 43.00,
      rating: 0,
      providerName: "Felix Harris",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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

            ],
          ),
          SizedBox(height: 16),
          Container(
            // color: Colors.black,
            height: 350,

            // ✅ Set fixed height for horizontal scrolling
            child: ListView.builder(

              scrollDirection: Axis.horizontal,
              itemCount: services.length,
              itemBuilder: (context, index) {
                return Container(
                  // padding: EdgeInsets.only(right: 20),

                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.only(right: 5),

                  child: ServiceCard(service: services[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final ServiceData service;

  ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 290,
      // height: 300,// ✅ Matches card width
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Placeholder Image
          Stack(
            children: [
              Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300], // ✅ Light grey placeholder
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Center(
                  child: Icon(Icons.image, size: 50, color: Colors.grey[600]),
                ),
              ),
              // Positioned(
              //   top: 8,
              //   left: 8,
              //     child: Container(
              //     height: 25,
              //     width: 105,
              //     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              //     decoration: BoxDecoration(
              //       color: Colors.black.withOpacity(0.7),
              //       borderRadius: BorderRadius.circular(24),
              //     ),
              //     child: Text(
              //       service.category.toUpperCase(),
              //
              //       style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
              //     ),
              //   ),
              // ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  constraints: BoxConstraints(maxWidth: context.width() * 0.3),
                  decoration: boxDecorationWithShadow(
                    // backgroundColor: context.cardColor.withValues(alpha:0.9),
                    borderRadius: radius(24),
                  ),
                  child: Marquee(
                    directionMarguee: DirectionMarguee.oneDirection,
                    child: Text(
                      "Hello Hello Hello Hello Hello Helo ",
                      // style: boldTextStyle(color: appStore.isDarkMode ? white : Colors.black, size: 10),
                    ).paddingSymmetric(horizontal: 8, vertical: 4),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ Star Rating
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: Colors.amber.shade50, borderRadius: BorderRadius.circular(24)),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          SizedBox(width: 4),
                          Text(service.rating.toString(), style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(service.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text("\$${service.price.toStringAsFixed(2)}", style: TextStyle(fontSize: 16, color: Colors.purple, fontWeight: FontWeight.bold)),
                Divider(height: 20, color: Colors.grey[300]),
                // ✅ Provider Info
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[300], // ✅ Placeholder for profile image
                      radius: 16,
                      child: Icon(Icons.person, color: Colors.grey[600]),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        service.providerName,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceData {
  final String name;
  final String category;
  final double price;
  final double rating;
  final String providerName;

  ServiceData({
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.providerName,
  });
}
