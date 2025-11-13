import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 40)),
            const Center(
              child: Text(
                'Smart Pet',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffd09035),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/Getstart-dog-image.jpeg',
              height: 300,
              fit: BoxFit.contain,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xffd09035),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Happy Pets, Happy You',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Keep your furry friends healthy, happy, and cared for with smart tools and trusted pet services.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                      Navigator.pushReplacementNamed(context, '/root');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(25),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsGeometry.symmetric(
                        horizontal: 60,
                        vertical: 12,
                      ),
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          color: Color(0xffd09035),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
