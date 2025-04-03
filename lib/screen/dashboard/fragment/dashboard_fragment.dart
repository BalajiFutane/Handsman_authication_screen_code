import 'package:flutter/material.dart';

class DashboardFragment extends StatefulWidget {
  @override
  _DashboardFragmentState createState() => _DashboardFragmentState();
}

class _DashboardFragmentState extends State<DashboardFragment> {
  List<Category> categories = [];
  List<Service> featuredServices = [];
  List<Service> allServices = [];
  List<Booking> upcomingBookings = [];

  @override
  void initState() {
    super.initState();
    loadDummyData();
  }

  void loadDummyData() {
    categories = [
      Category(name: "Plumbing", icon: Icons.plumbing),
      Category(name: "Electrical", icon: Icons.electrical_services),
      Category(name: "Cleaning", icon: Icons.cleaning_services),
      Category(name: "Carpentry", icon: Icons.handyman),
    ];

    featuredServices = [
      Service(name: "AC Repair", provider: "CoolFix Experts", price: 100.0, rating: 4.5),
      Service(name: "House Cleaning", provider: "Sparkle Cleaners", price: 80.0, rating: 4.2),
    ];

    allServices = [
      Service(name: "Plumbing", provider: "John's Plumbing", price: 60.0, rating: 4.0),
      Service(name: "Electrical Repair", provider: "Elite Electricians", price: 120.0, rating: 4.7),
      Service(name: "Car Wash", provider: "QuickWash", price: 50.0, rating: 3.9),
      Service(name: "Painting", provider: "ColorSplash Painters", price: 150.0, rating: 4.3),
    ];

    upcomingBookings = [
      Booking(service: "Plumbing Fix", date: "2025-03-20", status: "Confirmed"),
      Booking(service: "AC Repair", date: "2025-03-21", status: "Pending"),
    ];

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(16),
        children: [
          SliderComponent(featuredServices: featuredServices),
          SizedBox(height: 20),
          UpcomingBookingsComponent(upcomingBookings: upcomingBookings),
          SizedBox(height: 20),
          CategoryComponent(categories: categories),
          SizedBox(height: 20),
          FeaturedServiceListComponent(featuredServices: featuredServices),
          SizedBox(height: 20),
          ServiceListComponent(services: allServices),
        ],
      ),
    );
  }
}

/// Dummy **Category** Model
class Category {
  final String name;
  final IconData icon;

  Category({required this.name, required this.icon});
}

/// Dummy **Service** Model
class Service {
  final String name;
  final String provider;
  final double price;
  final double rating;

  Service({required this.name, required this.provider, required this.price, required this.rating});
}

/// Dummy **Booking** Model
class Booking {
  final String service;
  final String date;
  final String status;

  Booking({required this.service, required this.date, required this.status});
}

/// **Category Component**
class CategoryComponent extends StatelessWidget {
  final List<Category> categories;

  CategoryComponent({required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: categories.map((category) {
            return Chip(
              label: Text(category.name),
              avatar: Icon(category.icon),
              backgroundColor: Colors.blue.shade100,
            );
          }).toList(),
        ),
      ],
    );
  }
}

/// **Featured Services Component**
class FeaturedServiceListComponent extends StatelessWidget {
  final List<Service> featuredServices;

  FeaturedServiceListComponent({required this.featuredServices});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Featured Services", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Column(
          children: featuredServices.map((service) => ServiceTile(service: service)).toList(),
        ),
      ],
    );
  }
}

/// **All Services Component**
class ServiceListComponent extends StatelessWidget {
  final List<Service> services;

  ServiceListComponent({required this.services});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("All Services", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Column(
          children: services.map((service) => ServiceTile(service: service)).toList(),
        ),
      ],
    );
  }
}

/// **Slider Component**
class SliderComponent extends StatelessWidget {
  final List<Service> featuredServices;

  SliderComponent({required this.featuredServices});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: PageView.builder(
        itemCount: featuredServices.length,
        itemBuilder: (_, index) {
          final service = featuredServices[index];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue.shade300,
            ),
            child: Center(
              child: Text(service.name, style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          );
        },
      ),
    );
  }
}

/// **Upcoming Bookings Component**
class UpcomingBookingsComponent extends StatelessWidget {
  final List<Booking> upcomingBookings;

  UpcomingBookingsComponent({required this.upcomingBookings});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Upcoming Bookings", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Column(
          children: upcomingBookings.map((booking) => BookingTile(booking: booking)).toList(),
        ),
      ],
    );
  }
}

/// **Service Tile (Common Widget)**
class ServiceTile extends StatelessWidget {
  final Service service;

  ServiceTile({required this.service});

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
            Text(service.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text("Provider: ${service.provider}", style: TextStyle(fontSize: 14, color: Colors.grey)),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$${service.price.toStringAsFixed(2)}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
                Text("⭐ ${service.rating}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.orange)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// **Booking Tile (Common Widget)**
class BookingTile extends StatelessWidget {
  final Booking booking;

  BookingTile({required this.booking});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(booking.service),
      subtitle: Text("Date: ${booking.date}"),
      trailing: Text(booking.status, style: TextStyle(color: booking.status == "Confirmed" ? Colors.green : Colors.orange)),
    );
  }
}
