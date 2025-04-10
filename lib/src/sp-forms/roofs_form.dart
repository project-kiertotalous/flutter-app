import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/sp-bloc/roofs_bloc.dart';
import 'package:flutter_app/src/sp-bloc/roofs_event.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class SmallPropertiesRoofsForm extends StatelessWidget {
  const SmallPropertiesRoofsForm({super.key});

  @override
  Widget build(BuildContext context) {
  final roofsBloc = context.read<SmallPropertiesRoofsBloc>();
  // Use the roofsBloc variable or remove it if unnecessary.

  return BlocBuilder<SmallPropertiesRoofsBloc, Roof>(builder: (context, state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormHeader(text: 'Katot'),
        LayoutGrid(
          columnSizes: [
            400.px,
            160.px,
          ],
          rowSizes: [
            50.px,
            50.px,
            50.px,
          ],
        ),
      ],
    );
  });
}
}