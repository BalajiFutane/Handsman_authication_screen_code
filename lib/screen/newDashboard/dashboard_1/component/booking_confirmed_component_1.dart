import 'package:flutter/material.dart';

class BookingConfirmedComponent1 extends StatefulWidget {
  final BookingData? upcomingConfirmedBooking;

  BookingConfirmedComponent1({this.upcomingConfirmedBooking});

  @override
  _BookingConfirmedComponent1State createState() => _BookingConfirmedComponent1State();
}

class _BookingConfirmedComponent1State extends State<BookingConfirmedComponent1> {
  bool isClosed = false;

  @override
  Widget build(BuildContext context) {
    if (widget.upcomingConfirmedBooking == null || isClosed) return SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text("Your Booking", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        SizedBox(height: 16),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(widget.upcomingConfirmedBooking!.serviceImage ?? ""),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.upcomingConfirmedBooking!.serviceName ?? "Service Name",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Text(
                          widget.upcomingConfirmedBooking!.date ?? "Date Not Available",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.grey),
                    onPressed: () {
                      setState(() {
                        isClosed = true;
                      });
                    },
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Expanded(child: Text("Booking Status:", style: TextStyle(fontSize: 12))),
                  Text(
                    widget.upcomingConfirmedBooking!.status ?? "Pending",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(child: Text("Payment Status:", style: TextStyle(fontSize: 12))),
                  Text(
                    widget.upcomingConfirmedBooking!.paymentStatus ?? "Unpaid",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.red),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _handleCancelClick();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: Text("Cancel Booking", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _handleCancelClick() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Cancel Booking"),
        content: Text("Are you sure you want to cancel this booking?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("No")),
          TextButton(
            onPressed: () {
              setState(() {
                isClosed = true;
              });
              Navigator.pop(context);
            },
            child: Text("Yes", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

class BookingData {
  String? serviceName;
  String? serviceImage;
  String? date;
  String? status;
  String? paymentStatus;

  BookingData({this.serviceName, this.serviceImage, this.date, this.status, this.paymentStatus});
}
