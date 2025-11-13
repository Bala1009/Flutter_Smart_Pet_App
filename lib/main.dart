import 'package:flutter/material.dart';
import 'package:smart_pet_app/Screens/get_started_screen.dart';
// import 'package:smart_pet_app/Screens/home_screen.dart';
import 'package:smart_pet_app/Screens/root_screen.dart';

void main() {
  runApp(const SmartPetApp());
}

class SmartPetApp extends StatelessWidget {
  const SmartPetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Pet App',
      initialRoute: '/',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      // home: const GetStartedScreen(),
      routes: {
        '/': (context) => const GetStartedScreen(),
        '/root' : (context) => RootScreen(),
        // '/home': (context) => const HomeScreen(), 
      },
    );
  }
}
