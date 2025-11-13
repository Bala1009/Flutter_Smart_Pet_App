import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/category_list.dart';
import '../widgets/pet_cards.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔹 Set status bar to white with dark icons
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );

    final items = <Widget>[
      const Icon(Icons.home, size: 30),
      const Icon(Icons.favorite, size: 30),
      const Icon(Icons.location_city, size: 30),
      const Icon(Icons.person, size: 30),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 AppBar Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage('assets/images/profile.jpeg'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Location',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Row(
                          children: [
                            const Text(
                              'Chicago, US',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 20,
                              color: Colors.grey[700],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.notifications_none),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // 🔹 Search Box
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Colors.grey),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                            isDense: true,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(Icons.tune, size: 18),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // 🔹 Categories Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Categories',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text('See All', style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
                const SizedBox(height: 16),
                const CategoryList(),

                const SizedBox(height: 30),

                // 🔹 Pet Cards Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Trending Pets',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text('See All', style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: const [
                      PetCards(
                        image: 'assets/images/dog1.jpeg',
                        name: 'Golden Retriever',
                        distance: 'Near 15km',
                      ),
                      PetCards(
                        image: 'assets/images/dog2.jpeg',
                        name: 'Beagle',
                        distance: 'Near 12km',
                      ),
                      PetCards(
                        image: 'assets/images/dog3.jpeg',
                        name: 'Labrador',
                        distance: 'Near 20km',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
