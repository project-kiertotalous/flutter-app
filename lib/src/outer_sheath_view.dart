import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/foundation_type_and_floors_data.dart';
import 'package:flutter_app/src/data/removable_grounds_data.dart';
import 'package:flutter_app/src/forms/basic_information_form.dart';
import 'package:flutter_app/src/forms/foundation_type_and_floors_form.dart';
import 'package:flutter_app/src/forms/removable_grounds_form.dart';
import 'package:flutter_app/src/data/basic_information_data.dart';

class OuterSheathView extends StatelessWidget {
  const OuterSheathView({
    super.key,
    required this.removableGroundsData,
    required this.foundationTypeAndFloorsData,
    required this.basicInformationData,
  });

  final RemovableGroundsData removableGroundsData;
  final FoundationTypeAndFloorsData foundationTypeAndFloorsData;
  final BasicInformationData basicInformationData;

  @override
  Widget build(BuildContext context) {
    return ListView(
      // this allows for horizontal scrolling
      scrollDirection: Axis.horizontal,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          // this width should match width of widest widget
          width: 1200,
          // this ListView allows for vertical scrolling by default
          child: ListView(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: BasicInformationForm(
                  data: basicInformationData,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: RemovableGroundsForm(
                  data: removableGroundsData,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: FoundationTypeAndFloorsForm(
                  data: foundationTypeAndFloorsData,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
