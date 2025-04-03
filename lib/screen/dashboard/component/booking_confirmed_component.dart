import 'package:auth_project/colour/colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';



class PendingBookingComponent extends StatefulWidget {
  @override
  State<PendingBookingComponent> createState() => _PendingBookingComponentState();
}

class _PendingBookingComponentState extends State<PendingBookingComponent> {
  bool isBookingClosed = false; // Controls the visibility

  // Dummy Booking Data
  final Map<String, dynamic> dummyBooking = {
    "id": 101,
    "serviceName": "Home Cleaning",
    "date": "2025-03-25 14:30", // Dummy date
    "status": "pending", // Can be "pending" or "accepted"
  };

  @override
  Widget build(BuildContext context) {
    if (isBookingClosed) return Offstage(); // Hide component when closed

    if (dummyBooking["status"] != "pending" && dummyBooking["status"] != "accepted") {
      return Offstage();
    }

    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 26),
      decoration: boxDecorationRoundedWithShadow(defaultRadius.toInt(), backgroundColor: primaryColor),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 3,
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.6), borderRadius: BorderRadius.circular(3)),
                  ),
                  8.width,
                  Text("Your booking is confirmed!", // Dummy text replacing `language.bookingConfirmedMsg`
                      style: primaryTextStyle(color: Colors.white, size: 14, fontStyle: FontStyle.italic))
                      .expand(),
                ],
              ).expand(),
              SizedBox(
                width: 30,
                height: 22,
                child: IconButton(
                  icon: Icon(Icons.cancel, color: Colors.white),
                  visualDensity: VisualDensity.compact,
                  onPressed: () {
                    setState(() {
                      isBookingClosed = true;
                    });
                  },
                ),
              ),
            ],
          ),
          16.height,
          Row(
            children: [
              Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
                child: Icon(Icons.library_add_check_outlined, size: 18, color: Colors.white),
              ),
              8.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dummyBooking["serviceName"], style: boldTextStyle(color: Colors.white)),
                  2.height,
                  Text(dummyBooking["date"], style: primaryTextStyle(color: Colors.white, size: 14)),
                ],
              ).flexible(),
            ],
          )
        ],
      ),
    );
  }
}
