import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class SliderDashboardComponent2 extends StatefulWidget {
  final List<Map<String, dynamic>> sliderList;

  SliderDashboardComponent2({required this.sliderList});

  @override
  _SliderDashboardComponent2State createState() => _SliderDashboardComponent2State();
}

class _SliderDashboardComponent2State extends State<SliderDashboardComponent2> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.sliderList.isNotEmpty
            ? CarouselSlider(
          items: widget.sliderList.map((data) {
            return GestureDetector(
              onTap: () {
                toast("Slider Clicked: ${data['title']}");
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(data['sliderImage']),
                    fit: BoxFit.cover,
                  ),
                ),
                width: context.width(),
                height: 200,
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 200,
            enlargeCenterPage: true,
            viewportFraction: 0.8,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
        )
            : Container(
          height: 200,
          width: context.width(),
          color: Colors.grey.shade300,
          alignment: Alignment.center,
          child: Text("No Images Available", style: secondaryTextStyle()),
        ),
        if (widget.sliderList.length > 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.sliderList.length,
                  (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 2),
                height: 8,
                width: _currentPage == index ? 24 : 8,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ).paddingTop(16),
      ],
    );
  }
}
