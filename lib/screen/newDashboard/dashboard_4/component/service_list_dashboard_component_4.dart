// import 'package:booking_system_flutter/screens/newDashboard/dashboard_4/component/service_dashboard_component_4.dart';
// import 'package:flutter/material.dart';
// import 'package:nb_utils/nb_utils.dart';
//
// import '../../../../component/empty_error_state_widget.dart';
// import '../../../../component/view_all_label_component.dart';
// import '../../../../main.dart';
// import '../../../../model/service_data_model.dart';
// import '../../../../utils/colors.dart';
// import '../../../service/view_all_service_screen.dart';
//
// class ServiceListDashboardComponent4 extends StatelessWidget {
//   final List<ServiceData> serviceList;
//   final String serviceListTitle;
//   final bool isFeatured;
//
//   ServiceListDashboardComponent4({
//     required this.serviceList,
//     this.serviceListTitle = '',
//     this.isFeatured = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     // Return an empty space if the service list is empty
//     if (serviceList.isEmpty) return Offstage();
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Display the title and view all button
//         ViewAllLabel(
//           label: serviceListTitle,
//           list: serviceList,
//           trailingTextStyle: boldTextStyle(color: primaryColor, size: 12),
//           onTap: () {
//             // Launch the ViewAllServiceScreen with the featured flag
//             ViewAllServiceScreen(isFeatured: isFeatured ? '1' : '').launch(context);
//           },
//         ).paddingSymmetric(horizontal: 16),
//
//         // Show horizontal list if there are services
//         if (serviceList.isNotEmpty)
//           HorizontalList(
//             itemCount: serviceList.length,
//             spacing: 16,
//             padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
//             itemBuilder: (context, index) => ServiceDashboardComponent4(
//               serviceData: serviceList[index],
//               width: 280,
//             ),
//           )
//         else
//         // Show empty state if no services found
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
//             child: NoDataWidget(
//               title: language.lblNoServicesFound,
//               // imageWidget: EmptyStateWidget(),
//             ),
//           ).center(),
//       ],
//     );
//   }
// }
