import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CustomAppbarDashboardComponent2 extends StatefulWidget {
  final VoidCallback? callback;

  CustomAppbarDashboardComponent2({this.callback});

  @override
  State<CustomAppbarDashboardComponent2> createState() => _CustomAppbarDashboardComponent2State();
}

class _CustomAppbarDashboardComponent2State extends State<CustomAppbarDashboardComponent2> {
  bool isSpeechActivated = false;
  String searchQuery = "";

  void startListening() {
    setState(() {
      isSpeechActivated = true;
      searchQuery = "Listening...";
    });

    // Simulating speech recognition (replace with real speech-to-text integration)
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        searchQuery = "Plumbing Services"; // Dummy recognized speech
        isSpeechActivated = false;
      });

      toast("Recognized: $searchQuery");
    });
  }

  void stopListening() {
    setState(() {
      isSpeechActivated = false;
      searchQuery = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      decoration: boxDecorationDefault(color: Colors.blue),
      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          30.height, // Adjust for status bar padding
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.white, size: 22),
                      8.width,
                      Text("Current Location", style: boldTextStyle(color: white)),
                    ],
                  ),
                  8.height,
                  Text(
                    "123, Main Street, City",
                    style: secondaryTextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  toast("Notifications clicked");
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(Icons.notifications, size: 28, color: Colors.white),
                    Positioned(
                      top: -4,
                      right: -4,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: boxDecorationDefault(color: Colors.red, shape: BoxShape.circle),
                        child: Text("2", style: primaryTextStyle(size: 12, color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          8.height,
          Container(
            height: 50,
            width: context.width(),
            decoration: boxDecorationDefault(color: Colors.white),
            child: TextField(
              readOnly: true,
              onTap: () {
                toast("Search tapped");
              },
              decoration: InputDecoration(
                hintText: "e.g., Cleaning, Plumber, Pest Control",
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                suffixIcon: IconButton(
                  icon: Icon(isSpeechActivated ? Icons.stop : Icons.mic, color: Colors.blue),
                  onPressed: () {
                    if (isSpeechActivated) {
                      stopListening();
                    } else {
                      startListening();
                    }
                  },
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          20.height,
        ],
      ),
    ).cornerRadiusWithClipRRectOnly(bottomLeft: 30, bottomRight: 30);
  }
}
