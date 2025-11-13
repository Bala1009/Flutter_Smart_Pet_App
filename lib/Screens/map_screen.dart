import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Pet Finder Map"),
        backgroundColor: const Color(0xffd09035),
        centerTitle: true,
      ),
      body: Stack(
        children: [

          Positioned.fill(
            child: Image.asset(
              'assets/images/Google Maps.jpeg', 
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 Search box on top
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "Search nearby pets...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.filter_alt_outlined,
                        color: Color(0xffd09035)),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),

          // 🔹 Bottom Card - Nearby Pet Info
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/dog2.jpeg',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Beagle",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "2.5 km away",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Available for adoption",
                          style: TextStyle(color: Color(0xffd09035)),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios,
                        color: Color(0xffd09035)),
                    onPressed: () {
                      // Later you can navigate to Pet Detail or AdoptionForm
                    },
                  )
                ],
              ),
            ),
          ),

          // 🔹 Floating current location button
          Positioned(
            bottom: 120,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: const Color(0xffd09035),
              onPressed: () {
                // later integrate with location
              },
              child: const Icon(Icons.my_location, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
