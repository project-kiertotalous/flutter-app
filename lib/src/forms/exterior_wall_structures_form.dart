import 'package:flutter/widgets.dart';
import 'package:flutter_app/src/bloc/exterior_wall_structures_bloc.dart';
import 'package:flutter_app/src/data/column_cell.dart';
import 'package:flutter_app/src/data/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_app/src/data/form_header.dart';
import 'package:flutter_app/src/data/output_cell.dart';

class OuterWallsForm extends StatelessWidget {
  const OuterWallsForm({super.key});

  /*THIS FORM USES THE PREVIOUS, OLD FIGMA PROTOTYPE VERSION, WHICH WAS MISSING OUTPUT CELLS! 
  REFACTOR THIS FORM TO USE THE NEW FIGMA PROTOTYPES FORM LAYOUT*/

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      return Column(
        children: [
          // Exterior Wall Structures Form
          SizedBox(height: 50), // Space before next grid

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
              ColumnCell(
                initialValue: 'Seinärakenne',
              ),
              ColumnCell(
                initialValue: "Osuus (%)",
              ),
              ColumnCell(
                initialValue: "Pinta-ala (m²)",
              ),
              RowCell(
                initialValue: 'Kaksinkertainen tiiliseinä',
              ),
              OutputCell(
                getter: () => null,
              ),
              OutputCell(
                getter: () => null,
              ),
              RowCell(
                initialValue: 'Betonielementtiseinä',
              ),
              OutputCell(
                getter: () => null,
              ),
              OutputCell(
                getter: () => null,
              ),
              RowCell(
                initialValue: 'Tiiliverhoiltu seinä',
              ),
              OutputCell(
                getter: () => null,
              ),
              OutputCell(
                getter: () => null,
              ),
              RowCell(
                initialValue: 'Lautaseinä',
              ),
              OutputCell(
                getter: () => null,
              ),
              OutputCell(
                getter: () => null,
              ),
              RowCell(
                initialValue: 'Profiiliseinä',
              ),
              OutputCell(
                getter: () => null,
              ),
              OutputCell(
                getter: () => null,
              ),
              RowCell(
                initialValue: 'Teräsprofiili sandwich-rakenne',
              ),
              OutputCell(
                getter: () => null,
              ),
              OutputCell(
                getter: () => null,
              ),
              RowCell(
                initialValue: 'Mineriitti tai muu kivilevy',
              ),
              OutputCell(
                getter: () => null,
              ),
              OutputCell(
                getter: () => null,
              ),
              RowCell(
                initialValue: 'Yhteensä',
              ),
              OutputCell(
                getter: () => null,
              ),
              OutputCell(
                getter: () => null,
              ),
            ],
          ),

          SizedBox(height: 20),

          // Demolition Material Quantities Form
          FormHeader(text: 'Purkumateriaalien määrä'),
          LayoutGrid(
            columnSizes: [150.px, 120.px, 120.px],
            rowSizes: List.filled(12, 50.px),
            children: [
              ColumnCell(
                initialValue: 'Materiaali',
              ),
              ColumnCell(
                initialValue: "Tilavuus (m3)",
              ),
              ColumnCell(
                initialValue: "Paino (tonnia)",
              ),
              RowCell(
                initialValue: 'Tuulensuojalevy (bituliitti, tms)',
              ),
              OutputCell(
                getter: () => null,
              ),
              OutputCell(
                getter: () => null,
              ),
              RowCell(
                initialValue: 'Mineraalivilla',
              ),
              OutputCell(
                getter: () => null,
              ),
              OutputCell(
                getter: () => null,
              ),
              RowCell(
                initialValue: '130 mm kalkki tai punatiili',
              ),
              OutputCell(
                getter: () => null,
              ),
              OutputCell(
                getter: () => null,
              ),
              RowCell(
                initialValue: '20m ulkoverhouslauta',
              ),
              OutputCell(
                getter: () => null,
              ),
              OutputCell(
                getter: () => null,
              ),
              RowCell(
                initialValue: '11 mm kipsilevy',
              ),
              OutputCell(
                getter: () => null,
              ),
              OutputCell(
                getter: () => null,
              ),
              RowCell(
                initialValue: 'Profiilipelti (teräs)',
              ),
              OutputCell(
                getter: () => null,
              ),
              OutputCell(
                getter: () => null,
              ),
              RowCell(
                initialValue: 'Puolikova kuitulevy',
              ),
              OutputCell(
                getter: () => null,
              ),
              OutputCell(
                getter: () => null,
              ),
              RowCell(
                initialValue: 'Styrox',
              ),
              OutputCell(
                getter: () => null,
              ),
              OutputCell(
                getter: () => null,
              ),
              RowCell(
                initialValue: 'Rappaus, sisä -ja ulkoseinät',
              ),
              OutputCell(
                getter: () => null,
              ),
              OutputCell(
                getter: () => null,
              ),
              RowCell(
                initialValue: 'Mineriittilevy',
              ),
              OutputCell(
                getter: () => null,
              ),
              OutputCell(
                getter: () => null,
              ),
              RowCell(
                initialValue: 'Yhteensä',
              ),
              OutputCell(
                getter: () => null,
              ),
              OutputCell(
                getter: () => null,
              ),
            ],
          ),
        ],
      );
    });
  }
}
