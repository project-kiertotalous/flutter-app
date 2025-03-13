import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/foundations_bloc.dart';
import 'package:flutter_app/src/bloc/foundations_event.dart';
import 'package:flutter_app/src/data/cell.dart';
import 'package:flutter_app/src/data/cell_type.dart';
import 'package:flutter_app/src/data/menu_cell.dart';
import 'package:flutter_app/src/data/output_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

/// Perustyyppi ja lattiat
class FoundationTypeAndFloorsForm extends StatelessWidget {
  const FoundationTypeAndFloorsForm({super.key});

  /// Converts FoundationMaterial enum values to display names
  /// and returns them as a list of DropdownMenuItems.
  List<DropdownMenuItem<FoundationMaterial?>> toList() {
    return [
      DropdownMenuItem<FoundationMaterial?>(
        value: null,
        child: Text('Valitse'),
      ),
      ...FoundationMaterial.values.map((type) {
        return DropdownMenuItem<FoundationMaterial?>(
          value: type,
          child: Text(typeToString(type)),
        );
      }),
    ];
  }

  /// Converts FoundationMaterial enum to a user-friendly display name.
  String typeToString(FoundationMaterial type) {
    switch (type) {
      case FoundationMaterial.concreteCasting:
        return "Betonivalu";
      case FoundationMaterial.concreteBlock:
        return "Harkko";
    }
  }

  @override
  Widget build(BuildContext context) {
    final foundationsBloc = context.read<FoundationsBloc>();

    return BlocBuilder<FoundationsBloc, Foundations>(
      builder: (context, state) {
        return LayoutGrid(
          columnSizes: [
            150.px,
            120.px,
            120.px,
            120.px,
            120.px,
            120.px,
            120.px,
          ],
          rowSizes: [50.px, 50.px, 50.px, 50.px],
          children: [
            Cell(type: CellType.header, initialValue: 'Perustyyppi ja lattiat'),
            Cell(type: CellType.column, initialValue: 'Valesokkeli'),
            Cell(type: CellType.column, initialValue: 'Rossipohja'),
            Cell(type: CellType.column, initialValue: 'Matalaperustus'),
            Cell(type: CellType.column, initialValue: 'Pilariperustus'),
            Cell(type: CellType.column, initialValue: 'Ontelolaattaperustus'),
            Cell(type: CellType.column, initialValue: 'Koko rakennus yht.'),
            
            Cell(type: CellType.header, initialValue: 'Monivalinta'),

            MenuCell<FoundationMaterial?>(
              setter: (FoundationMaterial? value) =>
                  foundationsBloc.add(FalsePlinthMaterialChanged(value)),
              initialValue: state.falsePlinth?.material,
              items: toList(),
            ),
            MenuCell<FoundationMaterial?>(
              setter: (FoundationMaterial? value) =>
                  foundationsBloc.add(CrawlSpaceMaterialChanged(value)),
              initialValue: state.crawlSpace?.material,
              items: toList(),
            ),
            Cell(type: CellType.empty),
            MenuCell<FoundationMaterial?>(
              setter: (FoundationMaterial? value) =>
                  foundationsBloc.add(PillarMaterialChanged(value)),
              initialValue: state.pillar?.material,
              items: toList(),
            ),
            MenuCell<FoundationMaterial?>(
              setter: (FoundationMaterial? value) =>
                  foundationsBloc.add(HollowCoreSlabMaterialChanged(value)),
              initialValue: state.hollowCoreSlab?.material,
              items: toList(),
            ),
            Cell(type: CellType.empty),

            Cell(type: CellType.header, initialValue: 'Perustuksen pinta-ala (m²)'),
            Cell(
              type: CellType.input,
              initialValue: state.falsePlinth?.area,
              setter: (value) =>
                  foundationsBloc.add(FalsePlinthAreaChanged(value)),
            ),
            Cell(
              type: CellType.input,
              initialValue: state.crawlSpace?.area,
              setter: (value) =>
                  foundationsBloc.add(CrawlSpaceAreaChanged(value)),
            ),
            Cell(
              type: CellType.input,
              initialValue: state.shallow?.area,
              setter: (value) =>
                  foundationsBloc.add(ShallowAreaChanged(value)),
            ),
            Cell(
              type: CellType.input,
              initialValue: state.pillar?.area,
              setter: (value) =>
                  foundationsBloc.add(PillarAreaChanged(value)),
            ),
            Cell(
              type: CellType.input,
              initialValue: state.hollowCoreSlab?.area,
              setter: (value) =>
                  foundationsBloc.add(HollowCoreSlabAreaChanged(value)),
            ),
            OutputCell(getter: () => state.area),

            Cell(type: CellType.header, initialValue: 'Perustuksen ympärysmitta (jm)'),
            Cell(
              type: CellType.input,
              initialValue: state.falsePlinth?.circumference,
              setter: (value) =>
                  foundationsBloc.add(FalsePlinthCircumferenceChanged(value)),
            ),
            Cell(
              type: CellType.input,
              initialValue: state.crawlSpace?.circumference,
              setter: (value) =>
                  foundationsBloc.add(CrawlSpaceCircumferenceChanged(value)),
            ),
            Cell(
              type: CellType.input,
              initialValue: state.shallow?.circumference,
              setter: (value) =>
                  foundationsBloc.add(ShallowCircumferenceChanged(value)),
            ),
            Cell(
              type: CellType.input,
              initialValue: state.pillar?.circumference,
              setter: (value) =>
                  foundationsBloc.add(PillarCircumferenceChanged(value)),
            ),
            Cell(
              type: CellType.input,
              initialValue: state.hollowCoreSlab?.circumference,
              setter: (value) =>
                  foundationsBloc.add(HollowCoreSlabCircumferenceChanged(value)),
            ),
            OutputCell(getter: () => state.circumference),
          ],
        );
      },
    );
  }
}
