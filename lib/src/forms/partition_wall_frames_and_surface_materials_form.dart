import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/cell.dart';
import 'package:flutter_app/src/data/cell_type.dart';
import 'package:flutter_app/src/data/form_header.dart';
import 'package:flutter_app/src/data/output_cell.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class PartitionWallFramesAndSurfaceMaterials extends StatelessWidget {
  const PartitionWallFramesAndSurfaceMaterials({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormHeader(
          text: 'Sisäseinien rungot ja pintamateriaalit',
        ),
        LayoutGrid(
          columnSizes: [
            400.px,
            120.px,
          ],
          rowSizes: [50.px, 50.px, 50.px],
          children: [
            Cell(
                type: CellType.row,
                initialValue:
                    'Sisäseinien kokonaispituus, kaikki kerrokset (jm)'),
            Cell(
              type: CellType.input,
              initialValue: '0.0',
            ),
            Cell(
              type: CellType.row,
              initialValue: 'Sisäseinien keskikorkeus (m)'
              ),
            Cell(
              type: CellType.input,
              initialValue: '0.0',
            ),
            Cell( type: CellType.row,
              initialValue: 'Sisäseinien kokonaispinta-ala (m2)'
              ),
            Cell( type: CellType.output,
              initialValue: '0.0',
            ),
          ],
        ),
      ],
    );
  }
}
