import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/form_header.dart';
import 'package:flutter_app/src/data/empty_cell.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

/// HVAC and Electrical Installations UI Form
class HVACAndElectricalInstallationsForm extends StatelessWidget {
  const HVACAndElectricalInstallationsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormHeader(text: "LVI- ja sähköasennukset"),

        // Grid: 6 columns, 9 rows
        LayoutGrid(
          columnSizes: [150.px, 150.px, 150.px, 150.px, 150.px, 150.px],
          rowSizes: [
            50.px,
            50.px,
            50.px,
            50.px,
            50.px,
            50.px,
            50.px,
            50.px,
            50.px
          ],
          children: [
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
          ],
        ),
      ],
    );
  }
}
