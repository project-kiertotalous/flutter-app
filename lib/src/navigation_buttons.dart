import 'package:flutter/material.dart';
import 'package:flutter_app/src/home_view.dart';

class NavigationButtons extends StatelessWidget {
  const NavigationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = DefaultTabController.of(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center buttons
        children: [
          // "Edellinen" button - Goes back or to HomeView if first tab
          ElevatedButton(
            onPressed: tabController.index == 0
                ? () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeView()),
                    );
                  }
                : () => tabController.animateTo(tabController.index - 1),
            child: const Text("Edellinen"),
          ),
          const SizedBox(width: 100), // Space  between the buttons

          // "Seuraava" button - Goes to the next tab //TODO: Implement the logic for the last tab
          ElevatedButton(
            onPressed: () => tabController.animateTo(tabController.index + 1),
            child: const Text("Seuraava"),
          ),
        ],
      ),
    );
  }
}
