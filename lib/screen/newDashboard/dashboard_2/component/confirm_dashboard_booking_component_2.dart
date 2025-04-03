import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ConfirmDashboardBookingComponent2 extends StatefulWidget {
  @override
  _ConfirmDashboardBookingComponent2State createState() => _ConfirmDashboardBookingComponent2State();
}

class _ConfirmDashboardBookingComponent2State extends State<ConfirmDashboardBookingComponent2> {
  bool isClosed = false;

  // ✅ Dummy Booking Data
  Map<String, dynamic> bookingData = {
    "serviceName": "Plumbing Repair",
    "date": "2025-03-25 10:30 AM",
    "status": "Accepted",
    "paymentStatus": "Paid",
    "paymentMethod": "Online",
    "imageUrl": "assets/images/service1.jpg",
  };

  @override
  Widget build(BuildContext context) {
    if (isClosed) return Offstage();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        26.height,
        Text("Upcoming Booking", style: boldTextStyle()).paddingSymmetric(horizontal: 16),
        16.height,
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: boxDecorationRoundedWithShadow(10),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(bookingData["serviceName"], maxLines: 1, overflow: TextOverflow.ellipsis, style: boldTextStyle()),
                            8.height,
                            Text(bookingData["date"], style: secondaryTextStyle()),
                          ],
                        ).expand(),
                        16.width,
                        CircleAvatar(
                          backgroundImage: AssetImage(bookingData["imageUrl"]),
                          radius: 25,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: boxDecorationDefault(color: context.cardColor, borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Booking Status", style: primaryTextStyle(size: 10)),
                            10.height,
                            Text(bookingData["status"], style: boldTextStyle(color: Colors.green, size: 12)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Payment Status", style: primaryTextStyle(size: 10)),
                            10.height,
                            Text(
                              "${bookingData["paymentStatus"]} (${bookingData["paymentMethod"]})",
                              style: boldTextStyle(color: bookingData["paymentStatus"] == "Paid" ? Colors.green : Colors.red, size: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ).paddingSymmetric(horizontal: 16),
                ],
              ),
            ).paddingSymmetric(horizontal: 16),
            Positioned(
              top: -8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  setState(() => isClosed = true);
                  toast("Booking dismissed");
                },
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(6), color: Colors.red),
                  child: Icon(Icons.close, color: Colors.white, size: 12),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
