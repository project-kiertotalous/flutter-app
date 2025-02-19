import 'package:flutter/material.dart';

/// Main screen where users land upon starting the application.
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 40.0,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/large_buildings');
              },
              // large buildings
              child: Text("Suuret rakennukset"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/smaller_buildings');
              },
              // row houses and small flats
              child: Text("Rivi- ja pienkerrostalot"),
            ),
          ],
        ),
      ),
    );
  }
}
