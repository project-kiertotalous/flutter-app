import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/empty_cell.dart';
import 'package:flutter_app/src/data/form_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

//Recyclable Materials UI Form
class RecyclableMaterialsForm extends StatelessWidget {
  const RecyclableMaterialsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FormHeader(
          text: 'Kierrätettävät rakenneosat ja kalusteet',
        ),
        LayoutGrid(
          columnSizes: [
            150.px,
            150.px,
            150.px,
            150.px,
            150.px,
            150.px,
          ],
          rowSizes: List.generate(36, (_) => 50.px),
          children: [
            // Row 1
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),

            // Row 2
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),

            // Row 3
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),

            // Row 4
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),

            // Row 5
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),

            // Row 6
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),

            // Row 7
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),

            // Row 8
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),

            // Row 9
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),

            // Row 10
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),

            // Row 11
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),

            // Row 12
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),

            // Row 13
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),

            // Row 14
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),

            // Row 15
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),

            // Row 16
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),

            // Row 17
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),

            // Row 18
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),

            // Row 19
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),

            // Row 20
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),

            // Row 21
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),

            // Row 22
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),

            // Row 23
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            // Row 24
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            // Row 25
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            // Row 26
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            // Row 27
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            // Row 28
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            // Row 29
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            // Row 30
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            // Row 31
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            // Row 32
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            // Row 33
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            // Row 34
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            // Row 35
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            // Row 36
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
            const EmptyCell(),
          ],
        ),
      ],
    );
  }
}
