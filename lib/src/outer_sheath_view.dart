import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/removable_grounds_data.dart';
import 'package:flutter_app/src/forms/removable_grounds_form.dart';

class OuterSheathView extends StatelessWidget {
  const OuterSheathView({super.key, required this.removableGroundsData});

  final RemovableGroundsData removableGroundsData;

  @override
  Widget build(BuildContext context) {
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      children: [
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
        Align(
          alignment: Alignment.topLeft,
          child: RemovableGroundsForm(data: removableGroundsData),
        ),
      ],
    );
  }
}
