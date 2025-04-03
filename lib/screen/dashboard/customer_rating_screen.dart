import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomerRatingScreen extends StatefulWidget {
  @override
  State<CustomerRatingScreen> createState() => _CustomerRatingScreenState();
}

class _CustomerRatingScreenState extends State<CustomerRatingScreen> {
  List<RatingData> ratings = [];

  @override
  void initState() {
    super.initState();
    loadDummyData();
  }

  void loadDummyData() {
    ratings = List.generate(
      5,
          (index) => RatingData(
        id: index,
        serviceName: "Service ${index + 1}",
        review: "This is a sample review for service ${index + 1}.",
        rating: (index % 5) + 1.0,
        serviceId: index,
        attachments: [],
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Reviews")),
      body: Stack(
        children: [
          ratings.isNotEmpty
              ? ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: ratings.length,
            itemBuilder: (context, index) {
              RatingData data = ratings[index];

              return Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 5),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.grey.shade300,
                          child: Icon(Icons.image, size: 30, color: Colors.white),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data.serviceName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              TextButton(
                                onPressed: () {
                                  // Navigate to service details (dummy action)
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("View details clicked")));
                                },
                                child: Text("View Detail", style: TextStyle(color: Colors.blue)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Your Comment", style: TextStyle(fontWeight: FontWeight.bold)),
                              Spacer(),
                              IconButton(
                                icon: Icon(Icons.edit, size: 18, color: Colors.blue),
                                onPressed: () {
                                  // Edit review (dummy action)
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Edit clicked")));
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, size: 18, color: Colors.red),
                                onPressed: () {
                                  // Delete review
                                  setState(() {
                                    ratings.removeAt(index);
                                  });
                                },
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: List.generate(
                              5,
                                  (i) => Icon(
                                Icons.star,
                                color: i < data.rating ? Colors.amber : Colors.grey,
                                size: 20,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(data.review, style: TextStyle(color: Colors.black87)),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )
              : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star_border, size: 50, color: Colors.grey),
                SizedBox(height: 8),
                Text("No Ratings Yet", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("You have not given any ratings yet.", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RatingData {
  final int id;
  final String serviceName;
  final String review;
  final double rating;
  final int serviceId;
  final List<String> attachments;

  RatingData({
    required this.id,
    required this.serviceName,
    required this.review,
    required this.rating,
    required this.serviceId,
    required this.attachments,
  });
}
