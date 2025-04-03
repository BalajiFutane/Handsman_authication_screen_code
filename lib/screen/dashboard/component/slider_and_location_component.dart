import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class SliderLocationComponent extends StatefulWidget {
  @override
  State<SliderLocationComponent> createState() => _SliderLocationComponentState();
}

class _SliderLocationComponentState extends State<SliderLocationComponent> {
  PageController sliderPageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;

  final List<Map<String, String>> sliderList = [
    {"image": "https://via.placeholder.com/350x150", "type": "service"},
    {"image": "https://via.placeholder.com/350x150", "type": "offer"},
    {"image": "https://via.placeholder.com/350x150", "type": "event"},
  ]; // ✅ Dummy slider data

  @override
  void initState() {
    super.initState();
    if (sliderList.length >= 2) {
      _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
        if (_currentPage < sliderList.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        sliderPageController.animateToPage(_currentPage, duration: Duration(milliseconds: 950), curve: Curves.easeOutQuart);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    sliderPageController.dispose();
  }

  Widget getSliderWidget() {
    return SizedBox(
      height: 250,
      width: context.width(),
      child: Stack(
        children: [
          PageView(
            controller: sliderPageController,
            children: sliderList.map((data) {
              return Image.network(data["image"]!, height: 250, width: context.width(), fit: BoxFit.cover).onTap(() {
                toast("Clicked on ${data["type"]}");
              });
            }).toList(),
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: DotIndicator(
              pageController: sliderPageController,
              pages: sliderList,
              indicatorColor: Colors.white,
              unselectedIndicatorColor: Colors.grey,
              currentBoxShape: BoxShape.rectangle,
              boxShape: BoxShape.rectangle,
              borderRadius: radius(2),
              currentBorderRadius: radius(3),
              currentDotSize: 18,
              currentDotWidth: 6,
              dotSize: 6,
            ),
          ),
          Positioned(
            top: context.statusBarHeight + 16,
            right: 16,
            child: Container(
              decoration: boxDecorationDefault(color: context.cardColor, shape: BoxShape.circle),
              height: 36,
              width: 36,
              padding: EdgeInsets.all(8),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(Icons.notifications, size: 24, color: Colors.blue).center(),
                  Positioned(
                    top: -4,
                    right: -4,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: boxDecorationDefault(color: Colors.red, shape: BoxShape.circle),
                      child: Text("3", style: primaryTextStyle(size: 12, color: Colors.white)), // ✅ Static notification count
                    ),
                  ),
                ],
              ),
            ).onTap(() {
              toast("Notifications Clicked");
            }),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        getSliderWidget(),
        Positioned(
          bottom: -24,
          right: 16,
          left: 16,
          child: Row(
            children: [
              Expanded(
                child: AppButton(
                  padding: EdgeInsets.all(0),
                  width: context.width(),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: boxDecorationDefault(color: context.cardColor),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on, color: Colors.black),
                        8.width,
                        Text("Current Location: New York", style: secondaryTextStyle()), // ✅ Dummy location text
                        8.width,
                        Icon(Icons.my_location, color: Colors.grey),
                      ],
                    ),
                  ),
                  onTap: () {
                    toast("Change Location Clicked");
                  },
                ),
              ),
              16.width,
              GestureDetector(
                onTap: () {
                  toast("Search Clicked");
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: boxDecorationDefault(color: context.cardColor),
                  child: Icon(Icons.search, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
