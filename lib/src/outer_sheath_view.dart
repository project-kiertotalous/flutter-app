import 'package:flutter/material.dart';
import 'package:flutter_app/src/forms/basic_information_form.dart';
import 'package:flutter_app/src/forms/foundation_type_and_floors_form.dart';
import 'package:flutter_app/src/forms/removable_grounds_form.dart';
import 'package:flutter_app/src/home_view.dart';
import 'package:flutter_app/src/navigation_buttons.dart';
import 'package:flutter_app/src/partitions_and_windows_view.dart';

class OuterSheathView extends StatelessWidget {
  const OuterSheathView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      // this allows for horizontal scrolling
      scrollDirection: Axis.horizontal,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          // this width should match width of widest widget
          width: 2200,
          // this ListView allows for vertical scrolling by default
          child: ListView(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: BasicInformationForm(), // Add this form
              ),
              Align(
                alignment: Alignment.topLeft,
                child: RemovableGroundsForm(),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: FoundationTypeAndFloorsForm(),
              ),
              const SizedBox(height: 20),

                // Navigation buttons are part of the scrollable content
                Align(
                alignment: Alignment.bottomCenter,
                child: NavigationButtons(
                  onPrevious: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeView()),
                  );
                  },
                  onNext: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const PartitionsAndWindowsView()),
                  );
                  },
                ),
                ),

              // Extra spacing at the bottom to prevent buttons from sticking
              const SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }
}
