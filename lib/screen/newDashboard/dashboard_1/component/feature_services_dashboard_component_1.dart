import 'package:flutter/material.dart';

class FeatureServicesDashboardComponent1 extends StatelessWidget {
  final List<ServiceData> serviceList;

  FeatureServicesDashboardComponent1({required this.serviceList});

  @override
  Widget build(BuildContext context) {
    if (serviceList.isEmpty) return SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Featured Services", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllServiceScreen()));
                },
                child: Text("View All", style: TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        if (serviceList.isNotEmpty)
          SizedBox(
            height: 150, // Adjust height based on UI
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: serviceList.length,
              itemBuilder: (context, index) {
                return ServiceDashboardComponent1(serviceData: serviceList[index]);
              },
            ),
          )
        else
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                children: [
                  Icon(Icons.warning, size: 50, color: Colors.grey),
                  SizedBox(height: 8),
                  Text("No Services Found", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class ServiceData {
  String name;
  String imageUrl;

  ServiceData({required this.name, required this.imageUrl});
}

class ServiceDashboardComponent1 extends StatelessWidget {
  final ServiceData serviceData;

  ServiceDashboardComponent1({required this.serviceData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(serviceData.imageUrl, height: 80, width: 120, fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(serviceData.name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

class ViewAllServiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Services")),
      body: Center(child: Text("All Services List")),
    );
  }
}
