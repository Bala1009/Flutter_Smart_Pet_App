import 'package:flutter/material.dart';
import '../Screens/home_screen.dart';
import '../Screens/saved_screen.dart';
import '../Screens/map_screen.dart';
import '../Screens//profile_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;

  // list of pages shown for each tab
  final List<Widget> _pages = const [
    HomeScreen(),
    SavedScreen(),
    MapScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      backgroundColor: Colors.white,

      // ✅ This keeps HomeScreen scroll separate & nav bar fixed
      body: IndexedStack(index: _currentIndex, children: _pages),

      // custom bottom nav bar (use same design you made)
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.only(bottom: 8), // small lift
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.1),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home_filled, 0),
                _buildNavItem(Icons.favorite_border, 1),
                _buildNavItem(Icons.location_on_outlined, 2),
                _buildNavItem(Icons.person_outline, 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // helper for nav items
  Widget _buildNavItem(IconData icon, int index) {
    final bool isActive = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() => _currentIndex = index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xffd09035) : Colors.transparent,
          shape: BoxShape.circle,
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: const Color(0xffd09035).withOpacity(0.4),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: Icon(
          icon,
          color: isActive ? Colors.white : Colors.grey[600],
          size: isActive ? 28 : 26,
        ),
      ),
    );
  }
}
