import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/removable_grounds_data.dart';
import 'package:flutter_app/src/forms/removable_grounds_form.dart';

class OuterSheathView extends StatelessWidget {
  const OuterSheathView({super.key, required this.removableGroundsData});

  final RemovableGroundsData removableGroundsData;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: RemovableGroundsForm(
            data: removableGroundsData,
          ),
        ),
      ],
    );
  }
}
