import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      {'image': 'assets/images/Dog.jpeg', 'name': 'Dogs'},
      {'image': 'assets/images/Cat.jpeg', 'name': 'Cats'},
      {'image': 'assets/images/Birds.jpeg', 'name': 'Birds'},
      {'image': 'assets/images/Fishes.jpeg', 'name': 'Fishes'},
      {'image': 'assets/images/Rabbits.jpeg', 'name': 'Rabbits'},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return CategoryItem(
            image: category['image']!,
            label: category['name']!,
          );
        }).toList(),
      ),
    );
  }
}

//Reuable categoryItem widget
class CategoryItem extends StatelessWidget {
  final String image;
  final String label;

  const CategoryItem({super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage(image),
              backgroundColor: Colors.transparent,
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
