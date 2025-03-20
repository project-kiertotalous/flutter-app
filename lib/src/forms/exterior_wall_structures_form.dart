import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_app/src/data/form_header.dart';
import 'package:flutter_app/src/data/cell.dart';
import 'package:flutter_app/src/data/cell_type.dart';
import 'package:flutter_app/src/data/output_cell.dart';

class ExteriorWallStructuresForm extends StatelessWidget {
  const ExteriorWallStructuresForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormHeader(text: 'Ulkoseinärakenteiden osuus ja pinta-ala'),
        LayoutGrid(
          columnSizes: [150.px, 120.px, 120.px],
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
            Cell(
              type: CellType.header,
              initialValue: 'Seinärakenne',
            ),
            Cell(
              type: CellType.header,
              initialValue: "Osuus (%)",
            ),
            Cell(
              type: CellType.header,
              initialValue: "Pinta-ala (m²)",
            ),
            Cell(
              type: CellType.row,
              initialValue: 'Kaksinkertainen tiiliseinä',
            ),
            Cell(
              type: CellType.output,
              initialValue: '0',
            ),
            Cell(
              type: CellType.output,
              initialValue: '0',
            ),
            Cell(
              type: CellType.row,
              initialValue: 'Betonielementtiseinä',
            ),
            Cell(
              type: CellType.output,
              initialValue: '0',
            ),
            Cell(
              type: CellType.output,
              initialValue: '0',
            ),
            Cell(
              type: CellType.row,
              initialValue: 'Tiiliverhoiltu seinä',
            ),
            Cell(
              type: CellType.input,
              initialValue: '0%',
            ),
            Cell(
              type: CellType.output,
              initialValue: '0',
            ),
            Cell(
              type: CellType.row,
              initialValue: 'Lautaseinä',
            ),
            Cell(
              type: CellType.input,
              initialValue: '0%',
            ),
            Cell(
              type: CellType.output,
              initialValue: '0',
            ),
            Cell(
              type: CellType.row,
              initialValue: 'Profiilipelti',
            ),
            Cell(
              type: CellType.input,
              initialValue: '0%',
            ),
            Cell(
              type: CellType.output,
              initialValue: '0',
            ),
            Cell(
              type: CellType.row,
              initialValue: 'Teräsprofiili sandwich-rakenne',
            ),
            Cell(
              type: CellType.input,
              initialValue: '0%',
            ),
            Cell(
              type: CellType.output,
              initialValue: '0',
            ),
            Cell(
              type: CellType.row,
              initialValue: 'Mineriitti tai muu kivilevy',
            ),
            Cell(
              type: CellType.input,
              initialValue: '0%',
            ),
            Cell(
              type: CellType.output,
              initialValue: '0',
            ),
            Cell(
              type: CellType.row,
              initialValue: 'YHTEENSÄ',
            ),
            Cell(
              type: CellType.output,
              initialValue: '0',
            ),
            Cell(
              type: CellType.output,
              initialValue: '0',
            ),
          ],
        ),
      ],
    );
  }
}
