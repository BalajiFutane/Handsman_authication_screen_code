// import 'package:auth_project/colour/colors.dart';
// import 'package:auth_project/component/base_scaffold_widget.dart';
// import 'package:auth_project/screen/dashboard/component/featured_service_list_component.dart';
// import 'package:auth_project/screen/newDashboard/dashboard_3/component/service_dashboard_component_3.dart';
//
// import 'package:flutter/material.dart';
// import 'package:nb_utils/nb_utils.dart';
//
//
// // Manually define the service data and package data for testing
// ServiceData sampleServiceData = ServiceData(
//   id: 1,
//   name: "Example Service",
//   providerName: "John Doe",
//   price: 100.0,
//   discount: 10.0,
//   providerId: 2,
//   providerImage: "https://www.example.com/image.jpg",
//   isFavourite: 0,
//   serviceAttachments: ["https://www.example.com/image1.jpg"],
//   categoryName: "Home Services",
//   subCategoryName: "Cleaning",
//   type: "paid",
//   isOnlineService: true,
// );
//
// BookingPackage sampleBookingPackage = BookingPackage(
//   id: 1,
//   packageName: "Standard Package",
//   packagePrice: 80.0,
//   description: "Basic package for the service",
//   duration: 1.5,
// );
//
//
// class ServiceDashboardExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ServiceDashboardComponent4(
//       serviceData: sampleServiceData,
//       selectedPackage: sampleBookingPackage,
//       width: MediaQuery.of(context).size.width,
//       isFavouriteService: false,
//     );
//   }
// }
//
// class ServiceDashboardComponent4 extends StatefulWidget {
//   final ServiceData serviceData;
//   // final BookingPackage? selectedPackage;
//   final double? width;
//   final bool? isBorderEnabled;
//   final VoidCallback? onUpdate;
//   final bool isFavouriteService;
//   final bool isFromDashboard;
//
//   ServiceDashboardComponent4({
//     required this.serviceData,
//     this.width,
//     this.isBorderEnabled,
//     this.isFavouriteService = false,
//     this.onUpdate,
//     // this.selectedPackage,
//     this.isFromDashboard = false, required selectedPackage,
//   });
//
//   @override
//   State<ServiceDashboardComponent4> createState() =>
//       _ServiceDashboardComponent4State();
// }
//
// class _ServiceDashboardComponent4State extends State<ServiceDashboardComponent4> {
//   num get finalDiscountAmount => widget.serviceData.discount != 0
//       ? ((widget.serviceData.price / 100) * widget.serviceData.discount).toStringAsFixed(2).toDouble()
//       : 0;
//
//   num get discountedAmount => widget.serviceData.price - finalDiscountAmount;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // hideKeyboard(context);
//         // ServiceDetailScreen(
//         //   serviceId: widget.isFavouriteService ? widget.serviceData.serviceId : widget.serviceData.id,
//         // ).launch(context).then((value) {
//         //   setStatusBarColor(context.primaryColor);
//         // });
//       },
//       child: SizedBox(
//         width: widget.width,
//         height: 280,
//         child: Stack(
//           children: [
//             CachedImageWidget(
//               url: widget.isFavouriteService
//                   ? widget.serviceData.serviceAttachments.isNotEmpty
//                   ? widget.serviceData.serviceAttachments.first
//                   : ''
//                   : widget.serviceData.attachments.isNotEmpty
//                   ? widget.serviceData.attachments.first
//                   : '',
//               fit: BoxFit.cover,
//               height: 280,
//               width: widget.width ?? context.width(), circle: false,
//             ).cornerRadiusWithClipRRect(defaultRadius),
//             Container(
//               height: 280,
//               width: widget.width ?? context.width(),
//               decoration: boxDecorationDefault(
//                 boxShadow: [],
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   tileMode: TileMode.mirror,
//                   stops: [0.33, 0.66, 0.99],
//                   colors: [
//                     Colors.transparent,
//                     Colors.black38,
//                     Colors.black87,
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 12,
//               left: 12,
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
//                 constraints: BoxConstraints(maxWidth: context.width() * 0.3),
//                 decoration: boxDecorationWithShadow(
//                   borderRadius: radius(12),
//                 ),
//                 child: Marquee(
//                   directionMarguee: DirectionMarguee.oneDirection,
//                   child: Text(
//                     "${widget.serviceData.subCategoryName.isNotEmpty ? widget.serviceData.subCategoryName : widget.serviceData.categoryName}".toUpperCase(),
//                     // style: boldTextStyle(color: appStore.isDarkMode ? white : primaryColor, size: 12),
//                   ).paddingSymmetric(horizontal: 8, vertical: 4),
//                 ),
//               ),
//             ),
//             if (widget.serviceData.isOnlineService)
//               // Positioned(
//               //   top: 12,
//               //   right: widget.isFavouriteService ? 50 : 12,
//               //   // child: OnlineServiceIconWidget(isShowText: false),
//               // ),
//             Positioned(
//               bottom: 100,
//               // left: isRTL ? 0 : 16,
//               // right: isRTL ? 16 : 0,
//               child: Text(
//                 widget.serviceData.name,
//                 style: boldTextStyle(size: 14, color: Colors.white),
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             Positioned(
//               bottom: 60,
//               // left: isRTL ? 0 : 16,
//               // right: isRTL ? 16 : 0,
//               child: Row(
//                 children: [
//                   ImageBorder(src: widget.serviceData.providerImage, height: 30),
//                   SizedBox(width: 8),
//                   if (widget.serviceData.providerName.isNotEmpty)
//                     Text(
//                       widget.serviceData.providerName,
//                       style: secondaryTextStyle(size: 12, color: Colors.white),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ).expand()
//                 ],
//               ).onTap(() async {
//                 // if (widget.serviceData.providerId != appStore.userId) {
//                 //   await ProviderInfoScreen(providerId: widget.serviceData.providerId).launch(context);
//                 //   setStatusBarColor(Colors.transparent);
//                 // }
//               }),
//             ),
//             if (widget.isFavouriteService)
//               Positioned(
//                 top: 8,
//                 right: 0,
//                 child: Container(
//                   padding: EdgeInsets.all(8),
//                   margin: EdgeInsets.only(right: 8),
//                   decoration: boxDecorationWithShadow(boxShape: BoxShape.circle, backgroundColor: context.cardColor),
//                   // child: widget.serviceData.isFavourite == 1
//                       // ? ic_fill_heart.iconImage(color: favouriteColor, size: 18)
//                       // : ic_heart.iconImage(color: unFavouriteColor, size: 18),
//                 ).onTap(() async {
//                   // if (widget.serviceData.isFavourite != 0) {
//                   //   widget.serviceData.isFavourite = 1;
//                   //   setState(() {});
//                   //
//                   //   await removeToWishList(serviceId: widget.serviceData.id).then((value) {
//                   //     if (!value) {
//                   //       widget.serviceData.isFavourite = 1;
//                   //       setState(() {});
//                   //     }
//                   //   });
//                   // } else {
//                   //   widget.serviceData.isFavourite = 0;
//                   //   setState(() {});
//                   //
//                   //   await addToWishList(serviceId: widget.serviceData.id).then((value) {
//                   //     if (!value) {
//                   //       widget.serviceData.isFavourite = 1;
//                   //       setState(() {});
//                   //     }
//                   //   });
//                   // }
//                   // widget.onUpdate?.call();
//                 }),
//               ),
//             Positioned(
//               bottom: 16,
//               left: 16,
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 decoration: boxDecorationDefault(
//                   shape: BoxShape.rectangle,
//                   color: primaryColor,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Marquee(
//                   directionMarguee: DirectionMarguee.oneDirection,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       if (widget.serviceData.discount != 0)
//                         PriceWidget(
//                           price: widget.selectedPackage,
//                           isHourlyService: widget.serviceData.isHourlyService,
//                           color: Colors.white,
//                           hourlyTextColor: Colors.white,
//                           size: 16, isFreeService: false,
//                           // isFreeService: widget.serviceData.type == SERVICE_TYPE_FREE,
//                         ).paddingRight(8),
//                       PriceWidget(
//                         price: widget.serviceData.price,
//                         isLineThroughEnabled: widget.serviceData.discount != 0 ? true : false,
//                         isHourlyService: widget.serviceData.isHourlyService,
//                         color: Colors.white,
//                         hourlyTextColor: Colors.white,
//                         size: widget.serviceData.discount != 0 ? 12 : 16, isFreeService: false,
//                         // isFreeService: widget.serviceData.type == SERVICE_TYPE_FREE,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
