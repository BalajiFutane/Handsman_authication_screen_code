import 'package:auth_project/screen/newDashboard/dashboard_1/dashboard_fragment_1.dart';
import 'package:auth_project/screen/newDashboard/dashboard_2/dashboard_fragment_2.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  final bool? redirectToBooking;

  DashboardScreen({this.redirectToBooking});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.redirectToBooking == true) {
      currentIndex = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Handle double press to exit (optional)
        return true;
      },
      child: Scaffold(
        body: [
          DashboardFragment1(), // Static Dashboard
          DashboardFragment2(), // Static Booking Page
          CategoryScreen(), // Static Category Page
          ChatListScreen(), // Static Chat List Page
          ProfileFragment(), // Static Profile Page
        ][currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              label: "Booking",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Category",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: "Chat",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Dashboard Screen"));
  }
}

class BookingFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Booking Screen"));
  }
}

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Category Screen"));
  }
}

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Chat Screen"));
  }
}

class ProfileFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Profile Screen"));
  }
}
