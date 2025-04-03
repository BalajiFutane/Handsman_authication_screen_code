import 'package:flutter/material.dart';

class CategoryData {
  final String id;
  final String name;
  final String categoryImage;
  final String color;

  CategoryData({
    required this.id,
    required this.name,
    required this.categoryImage,
    required this.color,
  });
}

class CategoryDashboardComponent4 extends StatelessWidget {
  final CategoryData categoryData;

  CategoryDashboardComponent4({required this.categoryData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // Set the width of the category container
      height: 100, // Set the height of the category container
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          categoryData.name,
          style: TextStyle(color: Colors.black, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class CategoryListDashboardComponent4 extends StatelessWidget {
  final List<CategoryData> categoryList;
  final String listTiTle;

  CategoryListDashboardComponent4({required this.categoryList, required this.listTiTle});

  @override
  Widget build(BuildContext context) {
    if (categoryList.isEmpty) return Offstage();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // View all label
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                listTiTle,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              TextButton(
                onPressed: () {
                  // Navigation action when 'View All' is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CategoryScreen()),
                  );
                },
                child: Text(
                  'View All',
                  style: TextStyle(color: Colors.blue, fontSize: 12),
                ),
              ),
            ],
          ),
        ),

        // Category grid
        if (categoryList.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              direction: Axis.horizontal,
              children: categoryList
                  .map((e) => CategoryDashboardComponent4(categoryData: e))
                  .take(8)
                  .toList(),
            ),
          ),
      ],
    );
  }
}

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categories')),
      body: Center(child: Text('Category Screen')),
    );
  }
}

void main() {
  // Sample categories
  final List<CategoryData> categoryList = [
    CategoryData(id: '1', name: 'Cleaning', categoryImage: '', color: 'FF5733'),
    CategoryData(id: '2', name: 'Plumbing', categoryImage: '', color: '33FF57'),
    CategoryData(id: '3', name: 'Electrician', categoryImage: '', color: '3357FF'),
    CategoryData(id: '4', name: 'Pest Control', categoryImage: '', color: '57FF33'),
    CategoryData(id: '5', name: 'Landscaping', categoryImage: '', color: '5733FF'),
    CategoryData(id: '6', name: 'Security', categoryImage: '', color: 'FF5733'),
    CategoryData(id: '7', name: 'Moving', categoryImage: '', color: '33FF99'),
    CategoryData(id: '8', name: 'Carpet Cleaning', categoryImage: '', color: 'FF9933'),
  ];

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Category List Dashboard')),
      body: CategoryListDashboardComponent4(
        categoryList: categoryList,
        listTiTle: 'Popular Categories',
      ),
    ),
  ));
}
