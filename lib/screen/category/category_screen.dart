// import 'package:auth_project/colour/colors.dart';
// import 'package:auth_project/component/back_widget.dart';
// import 'package:auth_project/screen/dashboard/component/category_widget.dart';
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:nb_utils/nb_utils.dart';
//
//
// class CategoryScreen extends StatefulWidget {
//   @override
//   _CategoryScreenState createState() => _CategoryScreenState();
// }
//
// class _CategoryScreenState extends State<CategoryScreen> {
//   List<Map<String, dynamic>> dummyCategories = [
//     {"id": 1, "name": "Salon", "icon": Icons.cut},
//     {"id": 2, "name": "Plumber", "icon": Icons.build},
//     {"id": 3, "name": "Electrician", "icon": Icons.electrical_services},
//     {"id": 4, "name": "Cleaning", "icon": Icons.cleaning_services},
//     {"id": 5, "name": "Painting", "icon": Icons.format_paint},
//     {"id": 6, "name": "Car Repair", "icon": Icons.car_repair},
//     {"id": 7, "name": "Home Repair", "icon": Icons.home_repair_service},
//     {"id": 8, "name": "Laundry", "icon": Icons.local_laundry_service},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Categories", style: TextStyle(color: Colors.white)),
//         backgroundColor: primaryColor,
//         systemOverlayStyle: SystemUiOverlayStyle(
//           statusBarIconBrightness: Brightness.light,
//           statusBarColor: primaryColor,
//         ),
//         leading: BackWidget(),
//       ),
//       body: Stack(
//         children: [
//           dummyCategories.isEmpty
//               ? NoDataWidget(
//             title: "No Categories Found",
//            // imageWidget: EmptyStateWidget(),
//           )
//               : AnimatedScrollView(
//             physics: AlwaysScrollableScrollPhysics(),
//             padding: EdgeInsets.all(16),
//             listAnimationType: ListAnimationType.FadeIn,
//             fadeInConfiguration: FadeInConfiguration(duration: 2.seconds),
//             children: [
//               AnimatedWrap(
//                 runSpacing: 16,
//                 spacing: 16,
//                 itemCount: dummyCategories.length,
//                 listAnimationType: ListAnimationType.FadeIn,
//                 fadeInConfiguration: FadeInConfiguration(duration: 2.seconds),
//                 scaleConfiguration: ScaleConfiguration(duration: 300.milliseconds, delay: 50.milliseconds),
//                 itemBuilder: (_, index) {
//                   var data = dummyCategories[index];
//
//                   return GestureDetector(
//                     onTap: () {
//                       // ViewAllServiceScreen(categoryId: data["id"], categoryName: data["name"], isFromCategory: true)
//                       //     .launch(context);
//                     },
//                     // child: CategoryWidget(categoryData: data, width: context.width() / 4 - 20),
//                   );
//                 },
//               ).center(),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ServiceDashboardComponent1 extends StatefulWidget {
  final ServiceData serviceData;
  final double? width;
  final bool? isBorderEnabled;
  final VoidCallback? onUpdate;
  final bool isFavouriteService;
  final bool isFromDashboard;

  ServiceDashboardComponent1({
    required this.serviceData,
    this.width,
    this.isBorderEnabled,
    this.isFavouriteService = false,
    this.onUpdate,
    this.isFromDashboard = false,
  });

  @override
  _ServiceDashboardComponent1State createState() => _ServiceDashboardComponent1State();
}

class _ServiceDashboardComponent1State extends State<ServiceDashboardComponent1> {
  late bool isFavourite;

  @override
  void initState() {
    super.initState();
    isFavourite = widget.serviceData.isFavourite == 1;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Clicked ${widget.serviceData.name}"))),
      child: Container(
        decoration: boxDecorationWithRoundedCorners(
          borderRadius: radius(),
          backgroundColor: context.cardColor,
          border: widget.isBorderEnabled.validate(value: false)
              ? Border.all(color: context.dividerColor)
              : null,
        ),
        width: widget.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                // ✅ Image Placeholder Instead of Network Image
                Container(
                  height: 180,
                  width: context.width(),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  ),
                  child: Center(
                    child: Icon(Icons.image, size: 50, color: Colors.grey[600]),
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      widget.serviceData.subCategoryName.toUpperCase(),
                      style: boldTextStyle(color: Colors.white, size: 10),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavourite = !isFavourite;
                      });
                      widget.onUpdate?.call();
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                      ),
                      child: Icon(isFavourite ? Icons.favorite : Icons.favorite_border, color: Colors.red, size: 18),
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: Colors.amber.shade50, borderRadius: BorderRadius.circular(24)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            SizedBox(width: 4),
                            Text(widget.serviceData.totalRating.toString(), style: boldTextStyle(size: 12)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(widget.serviceData.name, style: boldTextStyle(size: 16)),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      if (widget.serviceData.discount > 0)
                        Text("\$${widget.serviceData.price.toStringAsFixed(2)}",
                            style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey, fontSize: 14)),
                      SizedBox(width: 8),
                      Text("\$${discountedAmount.toStringAsFixed(2)}",
                          style: boldTextStyle(size: 16, color: Colors.green)),
                    ],
                  ),
                  Divider(color: context.dividerColor, height: 20),
                  Row(
                    children: [
                      // ✅ Provider Image Placeholder
                      CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        radius: 15,
                        child: Icon(Icons.person, color: Colors.grey[600]),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          widget.serviceData.providerName,
                          style: secondaryTextStyle(size: 12, color: Colors.grey),
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
      ),
    );
  }

  double get discountedAmount =>
      widget.serviceData.price - (widget.serviceData.price * widget.serviceData.discount / 100);
}

class ServiceData {
  final int id;
  final String name;
  final String categoryName;
  final String subCategoryName;
  final double price;
  final double discount;
  final double totalRating;
  final int isFavourite;
  final String providerName;

  ServiceData({
    required this.id,
    required this.name,
    required this.categoryName,
    required this.subCategoryName,
    required this.price,
    required this.discount,
    required this.totalRating,
    required this.isFavourite,
    required this.providerName,
  });
}
