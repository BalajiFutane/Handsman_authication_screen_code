import 'package:flutter/material.dart';

class AppBarDashboardComponent4 extends StatefulWidget {
  final List<ServiceData>? featuredList;
  final VoidCallback? callback;

  AppBarDashboardComponent4({this.callback, this.featuredList});

  @override
  _AppBarDashboardComponent4State createState() => _AppBarDashboardComponent4State();
}

class _AppBarDashboardComponent4State extends State<AppBarDashboardComponent4> {
  String lastWords = '';
  bool isSpeechActivated = false;

  // Mock Data for featuredList
  List<ServiceData> staticFeaturedList = [
    ServiceData(name: "Cleaning", description: "Cleaning Services", imageUrl: "url_to_image"),
    ServiceData(name: "Plumber", description: "Plumbing Services", imageUrl: "url_to_image"),
    ServiceData(name: "Pest Control", description: "Pest Control Services", imageUrl: "url_to_image"),
  ];

  void startListening() {
    setState(() {
      isSpeechActivated = true;
    });
    // Simulate speech recognition
    print("Listening started...");
  }

  void stopListening() {
    setState(() {
      isSpeechActivated = false;
    });
    print("Listening stopped...");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.18,
          decoration: BoxDecoration(color: Colors.blue),
          padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              Image.asset("assets/app_logo.png", height: 35, width: 35),

              // Location Button (Static Example)
              GestureDetector(
                onTap: widget.callback,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(36)),
                  child: Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.black),
                      SizedBox(width: 8),
                      Text("Current Location", style: TextStyle(color: Colors.black)),
                      SizedBox(width: 8),
                      Icon(Icons.keyboard_arrow_down, size: 24, color: Colors.black),
                    ],
                  ),
                ),
              ),

              // Notification Button (Static Example)
              GestureDetector(
                onTap: () {
                  print("Notification clicked");
                },
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(Icons.notifications, color: Colors.white, size: 22),
                      // Simulating unread count
                      Positioned(
                        top: -16,
                        right: -1,
                        child: Container(
                          padding: EdgeInsets.all(3),
                          child: FittedBox(
                            child: Text("3", style: TextStyle(color: Colors.white, fontSize: 12)),
                          ),
                          decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // Search Bar
        Positioned(
          bottom: -26,
          left: 16,
          right: 16,
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white),
            child: TextField(
              readOnly: true,
              onTap: () {
                // Navigate to Search Screen with static data
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchServiceScreen(featuredList: staticFeaturedList),
                  ),
                );
              },
              decoration: InputDecoration(
                hintText: "Search services...",
                prefixIcon: Icon(Icons.search, size: 20),
                suffixIcon: IconButton(
                  icon: isSpeechActivated
                      ? Icon(Icons.stop, color: Colors.black)
                      : Icon(Icons.mic_none_outlined, color: Colors.black),
                  onPressed: () {
                    if (isSpeechActivated) {
                      stopListening();
                    } else {
                      startListening();
                    }
                  },
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(36)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ServiceData {
  final String name;
  final String description;
  final String imageUrl;

  ServiceData({required this.name, required this.description, required this.imageUrl});
}

// Simulate SearchServiceScreen using static data
class SearchServiceScreen extends StatelessWidget {
  final List<ServiceData>? featuredList;

  SearchServiceScreen({this.featuredList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Results")),
      body: ListView.builder(
        itemCount: featuredList?.length ?? 0,
        itemBuilder: (context, index) {
          var service = featuredList![index];
          return ListTile(
            title: Text(service.name),
            subtitle: Text(service.description),
            leading: Image.network(service.imageUrl),
          );
        },
      ),
    );
  }
}
