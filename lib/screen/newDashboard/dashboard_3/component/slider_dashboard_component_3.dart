import 'dart:async';
import 'package:auth_project/colour/colors.dart';
import 'package:auth_project/screen/newDashboard/dashboard_3/component/service_dashboard_component_3.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class SliderDashboardComponent3 extends StatefulWidget {
  // Static mock data for slider list
  final List<Map<String, String>> sliderList = [
    {
      'sliderImage': 'assets/images/slider1.jpg',
      'type': 'service',
      'typeId': '1',
    },
    {
      'sliderImage': 'assets/images/slider2.jpg',
      'type': 'service',
      'typeId': '2',
    },
    {
      'sliderImage': 'assets/images/slider3.jpg',
      'type': 'service',
      'typeId': '3',
    },
  ];

  SliderDashboardComponent3({required List<Map<String, String>> sliderList});

  @override
  _SliderDashboardComponent3State createState() => _SliderDashboardComponent3State();
}

class _SliderDashboardComponent3State extends State<SliderDashboardComponent3> {
  PageController sliderPageController = PageController(initialPage: 0);
  int _currentPage = 0;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    if (widget.sliderList.length >= 2) {
      _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
        if (_currentPage < widget.sliderList.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        sliderPageController.animateToPage(_currentPage, duration: Duration(milliseconds: 950), curve: Curves.easeOutQuart);
      });

      sliderPageController.addListener(() {
        _currentPage = sliderPageController.page!.toInt();
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    sliderPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: context.width(),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          widget.sliderList.isNotEmpty
              ? PageView(
            controller: sliderPageController,
            physics: ClampingScrollPhysics(),
            children: List.generate(
              widget.sliderList.length,
                  (index) {
                Map<String, String> data = widget.sliderList[index];
                return CachedImageWidget(
                  url: data['sliderImage']!,
                  height: 190,
                  width: context.width() - 32,
                  fit: BoxFit.cover, circle: false,
                ).cornerRadiusWithClipRRect(8).onTap(() {
                  // Static interaction; no backend needed
                  print("Tapped on slider ${data['typeId']}");
                }).paddingSymmetric(horizontal: 16);
              },
            ),
          )
              : CachedImageWidget(url: '', height: 175, width: context.width(), fit: BoxFit.cover, circle: false,),
          if (widget.sliderList.length > 1)
            Positioned(
              bottom: -25,
              left: 0,
              right: 0,
              child: DotIndicator(
                pageController: sliderPageController,
                indicatorColor: primaryColor,
                unselectedIndicatorColor: primaryLightColor,
                currentBoxShape: BoxShape.rectangle,
                boxShape: BoxShape.rectangle,
                borderRadius: radius(2),
                currentBorderRadius: radius(3),
                currentDotSize: 18,
                currentDotWidth: 6,
                dotSize: 6, pages: [],
              ),
            ),
        ],
      ),
    );
  }
}
