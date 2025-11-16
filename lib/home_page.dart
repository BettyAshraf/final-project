import 'package:flutter/material.dart';
import 'package:tourguide/city_page.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Maps',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
            ),
            const Expanded(
              child: CityData(
                lon: 31.2357,
                lat: 30.0444,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

