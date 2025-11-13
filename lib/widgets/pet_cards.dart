import 'package:flutter/material.dart';
import 'package:smart_pet_app/Screens/adoption_form_screen.dart';

class PetCards extends StatelessWidget {
  final String image;
  final String name;
  final String distance;
  final VoidCallback? onTap;

  const PetCards({
    super.key,
    required this.image,
    required this.name,
    required this.distance,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          onTap ??
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AdoptionFormScreen(petName: name),
              ),
            );
          },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.78,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
              child: Image.asset(
                image,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            //details
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 14,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 6),
                            Text(
                              distance,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: onTap,
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 18,
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
