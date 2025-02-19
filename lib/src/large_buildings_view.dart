import 'package:flutter/material.dart';

/// This view is for estimating large buildings.
class LargeBuildingsView extends StatefulWidget {
  const LargeBuildingsView({super.key});

  @override
  State<LargeBuildingsView> createState() => _LargeBuildingsViewState();
}

class _LargeBuildingsViewState extends State<LargeBuildingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // title
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              // information and material of the target of demolition
              Text("Purkukohteen tiedot ja materiaalit"),
            ],
          ),
        ],
      ),
    );
  }
}
