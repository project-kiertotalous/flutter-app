import 'package:flutter/material.dart';

class NavigationButtons extends StatelessWidget {
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const NavigationButtons({
    super.key,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // "Edellinen" button
          ElevatedButton(
            onPressed: onPrevious,
            child: const Text("Edellinen"),
          ),
          const SizedBox(width: 100.0), // Space between buttons
          // "Seuraava" button
          ElevatedButton(
            onPressed: onNext,
            child: const Text("Seuraava"),
          ),
        ],
      ),
    );
  }
}
