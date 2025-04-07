import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/empty_cell.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class LargePropertiesDisposalMaterialsAndHazardousWasteForm
    extends StatelessWidget {
  const LargePropertiesDisposalMaterialsAndHazardousWasteForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutGrid(
          columnSizes: [
            210.px,
            120.px,
            120.px,
            120.px,
            120.px,
          ],
          rowSizes: [
            50.px,
            50.px,
            50.px,
            50.px,
            50.px,
            50.px,
            50.px,
          ],
          children: [
            // First row
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            // Second row
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            // Third row
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            // Fourth row
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            // Fifth row
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            // Sixth row
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            // Seventh row
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
