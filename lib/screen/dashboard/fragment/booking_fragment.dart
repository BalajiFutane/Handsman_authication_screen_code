import 'package:flutter/material.dart';

class BookingFragment extends StatefulWidget {
  @override
  _BookingFragmentState createState() => _BookingFragmentState();
}

class _BookingFragmentState extends State<BookingFragment> {
  UniqueKey keyForList = UniqueKey();
  ScrollController scrollController = ScrollController();

  List<BookingData> bookings = [];
  int page = 1;
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    loadDummyData();
  }

  void loadDummyData() {
    bookings = [
      BookingData(id: 1, serviceName: "Plumbing Service", providerName: "John's Plumbing", totalAmount: 100.0, status: "Completed", bookingDate: "2025-03-20"),
      BookingData(id: 2, serviceName: "House Cleaning", providerName: "Sparkle Cleaners", totalAmount: 80.0, status: "Pending", bookingDate: "2025-03-21"),
      BookingData(id: 3, serviceName: "Electrical Repair", providerName: "Elite Electricians", totalAmount: 120.0, status: "In Progress", bookingDate: "2025-03-22"),
      BookingData(id: 4, serviceName: "Car Wash", providerName: "QuickWash Services", totalAmount: 50.0, status: "Cancelled", bookingDate: "2025-03-23"),
      BookingData(id: 5, serviceName: "AC Repair", providerName: "Cool Air Experts", totalAmount: 200.0, status: "Completed", bookingDate: "2025-03-24"),
    ];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bookings", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {
              // Dummy filter action
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          bookings.isEmpty
              ? NoDataWidget()
              : ListView.builder(
            key: keyForList,
            controller: scrollController,
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.all(16),
            itemCount: bookings.length,
            itemBuilder: (_, index) {
              BookingData data = bookings[index];
              return GestureDetector(
                onTap: () {
                  // Dummy onTap action
                },
                child: BookingItemComponent(data),
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Dummy Booking Data Model
class BookingData {
  final int id;
  final String serviceName;
  final String providerName;
  final double totalAmount;
  final String status;
  final String bookingDate;

  BookingData({required this.id, required this.serviceName, required this.providerName, required this.totalAmount, required this.status, required this.bookingDate});
}

/// Dummy No Data Widget
class NoDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.info_outline, size: 80, color: Colors.grey),
          SizedBox(height: 10),
          Text("No Bookings Found", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text("Try adding some new bookings", style: TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }
}

/// Dummy Booking Item Component
class BookingItemComponent extends StatelessWidget {
  final BookingData bookingData;

  BookingItemComponent(this.bookingData);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(bookingData.serviceName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text("Provider: ${bookingData.providerName}", style: TextStyle(fontSize: 14, color: Colors.grey)),
            SizedBox(height: 4),
            Text("Date: ${bookingData.bookingDate}", style: TextStyle(fontSize: 14, color: Colors.grey)),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$${bookingData.totalAmount.toStringAsFixed(2)}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  decoration: BoxDecoration(
                    color: _getStatusColor(bookingData.status),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(bookingData.status, style: TextStyle(fontSize: 12, color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "Completed":
        return Colors.green;
      case "Pending":
        return Colors.orange;
      case "In Progress":
        return Colors.blue;
      case "Cancelled":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
