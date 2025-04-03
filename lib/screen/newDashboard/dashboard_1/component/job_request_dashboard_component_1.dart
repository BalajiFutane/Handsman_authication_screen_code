import 'package:flutter/material.dart';

class NewJobRequestDashboardComponent1 extends StatelessWidget {
  const NewJobRequestDashboardComponent1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueAccent, // Background color
        borderRadius: BorderRadius.circular(8),
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Text(
            "Post Your Job Request",
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            "Find professionals for your work by posting a request!",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            icon: Icon(Icons.add, color: Colors.white),
            label: Text("New Request", style: TextStyle(color: Colors.white, fontSize: 14)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            ),
            onPressed: () {
              _showDummyRequestDialog(context);
            },
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  void _showDummyRequestDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("New Job Request"),
        content: Text("This is a dummy request screen. Implement actual functionality here."),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("Close")),
        ],
      ),
    );
  }
}
