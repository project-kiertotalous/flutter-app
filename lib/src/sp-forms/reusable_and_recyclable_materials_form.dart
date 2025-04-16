import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/shared/cell.dart';
import 'package:flutter_app/src/sp-bloc/reusable_and_recyclable_materials_bloc.dart';
import 'package:flutter_app/src/sp-bloc/total_reusable_and_recyclable_materials_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class ReusableAndRecyclableMaterialsForm extends StatelessWidget {
  const ReusableAndRecyclableMaterialsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc =
        context.read<SmallPropertiesReusableAndRecyclableMaterialsBloc>();

    return BlocBuilder<SmallPropertiesTotalReusableAndRecyclableMaterialsBloc,
            SmallPropertiesTotalReusableAndRecyclableMaterials>(
        builder: (context, state) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        LayoutGrid(columnSizes: [
          210.px,
          120.px,
          210.px,
          120.px,
          120.px,
          120.px,
          120.px,
        ], rowSizes: [
          75.px,
          50.px,
          50.px,
          50.px,
          50.px,
          50.px,
          50.px,
          50.px,
          50.px,
          50.px,
          50.px,
          50.px,
          50.px,
          50.px,
          50.px,
          50.px,
          50.px,
          50.px,
          50.px,
        ], children: [
          Cell.header(
            initialValue: 'Hyödyntämiskelpoiset ja kierrätettävät materiaalit',
          ),
          Cell.column(initialValue: 'Määräarvio (tonnia)'),
          Cell.column(
              initialValue: 'Hyödyntäminen, käsittely tai loppusijoituspaikka'),
          Cell.column(initialValue: 'Käsittely- ja prukukustannus (€/tonni)'),
          Cell.column(initialValue: 'Purkukustannus/materiaalierä (€)'),
          Cell.column(initialValue: 'Materiaalin arvo (€/tonni)'),
          Cell.column(initialValue: 'materiaalierän hinta (€)'),
        ])
      ]);
    });
  }
}
