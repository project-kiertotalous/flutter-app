import 'package:flutter/material.dart';

/// This view is for estimating smaller row houses and blocks of flats.
class SmallerBuildingsView extends StatefulWidget {
  const SmallerBuildingsView({super.key});

  @override
  State<SmallerBuildingsView> createState() => _SmallerBuildingsViewState();
}

class _SmallerBuildingsViewState extends State<SmallerBuildingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              // back
              child: Text("Takaisin"),
            ),
          ],
        ),
      ),
    );
  }
}
