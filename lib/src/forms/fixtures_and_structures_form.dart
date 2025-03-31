import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/fixtures_and_structures_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_app/src/data/form_header.dart';
import 'package:flutter_app/src/data/empty_cell.dart';
import 'package:bl_demolition_materials/src/large_properties/hvac_electrical_and_other_equipment/fixtures_and_structures.dart';

/// Fixtures and Structures Form
class FixturesAndStructuresForm extends StatelessWidget {
  const FixturesAndStructuresForm({super.key});

  @override
  Widget build(BuildContext context) {
    final fixturesBloc = context.read<FixturesAndStructuresBloc>();

    return BlocBuilder<FixturesAndStructuresBloc, FixturesAndStructures>(
        builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormHeader(
              text: 'Rakennukseen liittyvät kiintokalusteet ja rakenteet'),
          const SizedBox(height: 20),
          LayoutGrid(
            columnSizes: [200.px, 120.px, 120.px, 120.px, 120.px],
            rowSizes: [50.px, 50.px, 50.px, 50.px, 50.px],
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
            ],
          ),
        ],
      );
    });
  }
}
