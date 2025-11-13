import 'package:flutter/material.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for saved pets
    final savedPets = [
      {
        "image": "assets/images/dog1.jpeg",
        "name": "Golden Retriever",
        "location": "2.5 km away"
      },
      {
        "image": "assets/images/dog2.jpeg",
        "name": "Beagle",
        "location": "3.1 km away"
      },
      {
        "image": "assets/images/dog3.jpeg",
        "name": "Labrador",
        "location": "5.2 km away"
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Saved Pets"),
        backgroundColor: const Color(0xffd09035),
        centerTitle: true,
      ),
      body: savedPets.isEmpty
          ? const Center(
              child: Text(
                "No saved pets yet 🐾",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: savedPets.length,
              itemBuilder: (context, index) {
                final pet = savedPets[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Pet Image
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                        child: Image.asset(
                          pet["image"]!,
                          width: 110,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Pet Info
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pet["name"]!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    pet["location"]!,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xffd09035),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 6),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          "Adoption request for ${pet["name"]} started! 🐶"),
                                      backgroundColor:
                                          const Color(0xffd09035),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Adopt Now",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Favorite (remove icon)
                      IconButton(
                        icon: const Icon(Icons.favorite, color: Colors.redAccent),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "${pet["name"]} removed from favorites 💔"),
                              backgroundColor: Colors.redAccent,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
