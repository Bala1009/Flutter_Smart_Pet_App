import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: const Color(0xffd09035),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔹 Profile Header Card
            Container(
              padding: const EdgeInsets.all(20),
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
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/images/profile.jpeg'),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Bala M",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Pet Lover ",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildStat("Pets Adopted", "05"),
                      Container(
                        height: 30,
                        width: 1,
                        color: Colors.grey[300],
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      _buildStat("Favorites", "12"),
                      Container(
                        height: 30,
                        width: 1,
                        color: Colors.grey[300],
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      _buildStat("Requests", "03"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // 🔹 Account Settings
            _buildSectionTitle("Account Settings"),
            _buildMenuTile(Icons.person_outline, "Edit Profile"),
            _buildMenuTile(Icons.lock_outline, "Change Password"),
            _buildMenuTile(Icons.notifications_none, "Notifications"),
            _buildMenuTile(Icons.history, "Adoption History"),

            const SizedBox(height: 25),

            // 🔹 App Settings
            _buildSectionTitle("App Settings"),
            _buildMenuTile(Icons.dark_mode_outlined, "Dark Mode"),
            _buildMenuTile(Icons.help_outline, "Help & Support"),
            _buildMenuTile(Icons.info_outline, "About App"),

            const SizedBox(height: 40),

            // 🔹 Logout Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffd09035),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Logged out successfully"),
                    backgroundColor: Colors.redAccent,
                  ),
                );
              },
              child: const Text(
                "Log Out",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Small helper widget for Stats
  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  // 🔹 Section Title
  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xffd09035)),
        ),
      ),
    );
  }

  // 🔹 Reusable Menu Tile
  Widget _buildMenuTile(IconData icon, String title) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xffd09035)),
        title: Text(title, style: const TextStyle(fontSize: 15)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // later connect navigation
        },
      ),
    );
  }
}
