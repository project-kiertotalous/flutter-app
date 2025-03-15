import 'package:flutter/material.dart';

class NavigationButtons extends StatelessWidget {
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final bool isFirstTab;
  final bool isLastTab;

  const NavigationButtons({
    super.key,
    required this.onPrevious,
    required this.onNext,
    this.isFirstTab = false,
    this.isLastTab = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // "Edellinen" button (navigates to home if first tab)
          ElevatedButton(
            onPressed: isFirstTab
                ? () {
                    Navigator.pushNamed(context, '/home');
                  }
                : onPrevious,
            child: const Text("Edellinen"),
          ),

          // "Seuraava" button (disabled if last tab)
          ElevatedButton(
            onPressed: isLastTab ? null : onNext,
            child: const Text("Seuraava"),
          ),
        ],
      ),
    );
  }
}