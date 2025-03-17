import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/total_roofs_bloc.dart';
import 'package:flutter_app/src/bloc/total_roofs_event.dart';
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
    final totalRoofsBloc = context.read<TotalRoofsBloc>();

    return BlocBuilder<TotalRoofsBloc, TotalRoofs>(
      builder: (context, state) {
        return LayoutGrid(
          columnSizes: [
            400.px,
            160.px,
            160.px,
            160.px,
            160.px,
            160.px,
            160.px,
          ],
          rowSizes: [
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
            50.px,
            50.px,
            50.px,
            50.px,
          ],
          children: [
            Cell(type: CellType.header, initialValue: 'Perustyyppi ja lattiat'),
            Cell(
              type: CellType.column,
              initialValue: 'Valesokkeli',
            ),
            Cell(type: CellType.column, initialValue: 'Rossipohja'),
            Cell(type: CellType.column, initialValue: 'Matalaperustus'),
            Cell(type: CellType.column, initialValue: 'Pilariperustus'),
            Cell(type: CellType.column, initialValue: 'Ontelolaattaperustus'),
            Cell(type: CellType.column, initialValue: 'Koko rakennus yht.'),
            Cell(type: CellType.header, initialValue: 'Monivalinta'),
            MenuCell<FoundationMaterial>(
              setter: (FoundationMaterial? value) {
                totalRoofsBloc.add(
                  TotalRoofsChanged(
                    state.copyWith.totalFoundations!.falsePlinth!.call(
                      material: value,
                    ),
                  ),
                );
              },
              initialValue: state.totalFoundations?.falsePlinth?.material,
              items: toList(),
            ),
            MenuCell<FoundationMaterial>(
              setter: (FoundationMaterial? value) {
                totalRoofsBloc.add(
                  TotalRoofsChanged(
                    state.copyWith.totalFoundations!.crawlSpace!.call(
                      material: value,
                    ),
                  ),
                );
              },
              initialValue: state.totalFoundations?.crawlSpace?.material,
              items: toList(),
            ),
            Cell(
              type: CellType.empty,
            ),
            MenuCell<FoundationMaterial>(
              setter: (FoundationMaterial? value) {
                totalRoofsBloc.add(
                  TotalRoofsChanged(
                    state.copyWith.totalFoundations!.pillar!.call(
                      material: value,
                    ),
                  ),
                );
              },
              initialValue: state.totalFoundations?.pillar?.material,
              items: toList(),
            ),
            MenuCell<FoundationMaterial>(
              setter: (FoundationMaterial? value) {
                totalRoofsBloc.add(
                  TotalRoofsChanged(
                    state.copyWith.totalFoundations!.hollowCoreSlab!.call(
                      material: value,
                    ),
                  ),
                );
              },
              initialValue: state.totalFoundations?.hollowCoreSlab?.material,
              items: toList(),
            ),
            Cell(
              type: CellType.empty,
            ),
            Cell(
                type: CellType.header,
                initialValue: 'Perustuksen pinta-ala (m2)'),
            Cell(
              type: CellType.input,
              initialValue: state.totalFoundations?.falsePlinth?.area,
              setter: (value) {
                totalRoofsBloc.add(
                  TotalRoofsChanged(
                    state.copyWith.totalFoundations!.falsePlinth!.call(
                      area: value,
                    ),
                  ),
                );
              },
            ),
            Cell(
              type: CellType.input,
              initialValue: state.totalFoundations?.crawlSpace?.area,
              setter: (value) {
                totalRoofsBloc.add(
                  TotalRoofsChanged(
                    state.copyWith.totalFoundations!.crawlSpace!.call(
                      area: value,
                    ),
                  ),
                );
              },
            ),
            Cell(
              type: CellType.input,
              initialValue: state.totalFoundations?.shallow?.area,
              setter: (value) {
                totalRoofsBloc.add(
                  TotalRoofsChanged(
                    state.copyWith.totalFoundations!.shallow!.call(
                      area: value,
                    ),
                  ),
                );
              },
            ),
            Cell(
              type: CellType.input,
              initialValue: state.totalFoundations?.pillar?.area,
              setter: (value) {
                totalRoofsBloc.add(
                  TotalRoofsChanged(
                    state.copyWith.totalFoundations!.pillar!.call(
                      area: value,
                    ),
                  ),
                );
              },
            ),
            Cell(
              type: CellType.input,
              initialValue: state.totalFoundations?.hollowCoreSlab?.area,
              setter: (value) {
                totalRoofsBloc.add(
                  TotalRoofsChanged(
                    state.copyWith.totalFoundations!.hollowCoreSlab!.call(
                      area: value,
                    ),
                  ),
                );
              },
            ),
            OutputCell(
              getter: () => state.totalFoundations?.area,
            ),
            Cell(
                type: CellType.header,
                initialValue: 'Perustuksen kehämitta (jm)'),
            Cell(
              type: CellType.input,
              initialValue: state.totalFoundations?.falsePlinth?.circumference,
              setter: (value) {
                totalRoofsBloc.add(
                  TotalRoofsChanged(
                    state.copyWith.totalFoundations!.falsePlinth!.call(
                      circumference: value,
                    ),
                  ),
                );
              },
            ),
            Cell(
              type: CellType.input,
              initialValue: state.totalFoundations?.crawlSpace?.circumference,
              setter: (value) {
                totalRoofsBloc.add(
                  TotalRoofsChanged(
                    state.copyWith.totalFoundations!.crawlSpace!.call(
                      circumference: value,
                    ),
                  ),
                );
              },
            ),
            Cell(
              type: CellType.input,
              initialValue: state.totalFoundations?.shallow?.circumference,
              setter: (value) {
                totalRoofsBloc.add(
                  TotalRoofsChanged(
                    state.copyWith.totalFoundations!.shallow!.call(
                      circumference: value,
                    ),
                  ),
                );
              },
            ),
            Cell(
              type: CellType.input,
              initialValue: state.totalFoundations?.pillar?.circumference,
              setter: (value) {
                totalRoofsBloc.add(
                  TotalRoofsChanged(
                    state.copyWith.totalFoundations!.pillar!.call(
                      circumference: value,
                    ),
                  ),
                );
              },
            ),
            Cell(
              type: CellType.input,
              initialValue:
                  state.totalFoundations?.hollowCoreSlab?.circumference,
              setter: (value) {
                totalRoofsBloc.add(
                  TotalRoofsChanged(
                    state.copyWith.totalFoundations!.hollowCoreSlab!.call(
                      circumference: value,
                    ),
                  ),
                );
              },
            ),
            OutputCell(
              getter: () => state.totalFoundations?.circumference,
            ),
            Cell(
                type: CellType.header,
                initialValue: "Perustusten purkumateriaalimäärät"),
            Cell(type: CellType.empty),
            Cell(type: CellType.empty),
            Cell(type: CellType.empty),
            Cell(type: CellType.empty),
            Cell(type: CellType.empty),
            Cell(type: CellType.empty),
            // TODO: needs check button!
            Cell(
              type: CellType.row,
              initialValue: "Betonia (m3)",
              checkbox: true,
              checkboxValue: state.totalFoundations?.bituminousWaterProofing,
              checkboxTitle: "Kosteussuojana bitumisively",
              checkboxSetter: (value) {
                totalRoofsBloc.add(
                  BituminousWaterProofingChanged(value),
                );
              },
            ),
            OutputCell(
              getter: () => state.totalFoundations?.falsePlinth?.concreteVolume,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.crawlSpace?.concreteVolume,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.shallow?.concreteVolume,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.pillar?.concreteVolume,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.hollowCoreSlab?.concreteVolume,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.concreteVolume,
            ),
            Cell(type: CellType.row, initialValue: "Betonia (tonnia)"),
            OutputCell(
              getter: () => state.totalFoundations?.falsePlinth?.concreteTons,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.crawlSpace?.concreteTons,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.shallow?.concreteTons,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.pillar?.concreteTons,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.hollowCoreSlab?.concreteTons,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.concreteTons,
            ),
            Cell(type: CellType.row, initialValue: "Betoniterästä (tonnia)"),
            OutputCell(
              getter: () => state.totalFoundations?.falsePlinth?.rebarTons,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.crawlSpace?.rebarTons,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.shallow?.rebarTons,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.pillar?.rebarTons,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.hollowCoreSlab?.rebarTons,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.rebarTons,
            ),
            Cell(type: CellType.row, initialValue: "Betoniharkot (m3)"),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.falsePlinth?.concreteBlockVolume,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.crawlSpace?.concreteBlockVolume,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.shallow?.concreteBlockVolume,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.pillar?.concreteBlockVolume,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.hollowCoreSlab?.concreteBlockVolume,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.concreteBlockVolume,
            ),
            Cell(type: CellType.row, initialValue: "Betoniharkot (tonnia)"),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.falsePlinth?.concreteBlockTons,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.crawlSpace?.concreteBlockTons,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.shallow?.concreteBlockTons,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.pillar?.concreteBlockTons,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.hollowCoreSlab?.concreteBlockTons,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.concreteBlockTons,
            ),
            Cell(
                type: CellType.row,
                initialValue: "Lasi- ja mineraalieristevilla (m3)"),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.falsePlinth?.mineralWoolVolume,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.crawlSpace?.mineralWoolVolume,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.shallow?.mineralWoolVolume,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.pillar?.mineralWoolVolume,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.hollowCoreSlab?.mineralWoolVolume,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.mineralWoolVolume,
            ),
            Cell(
                type: CellType.row,
                initialValue: "Lasi- ja mineraalieristevilla (tonnia)"),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.falsePlinth?.mineralWoolTons,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.crawlSpace?.mineralWoolTons,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.shallow?.mineralWoolTons,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.pillar?.mineralWoolTons,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.hollowCoreSlab?.mineralWoolTons,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.mineralWoolTons,
            ),
            Cell(
                type: CellType.row,
                initialValue: "Muovijäte, styrox, kosteuseriste yms. (m3)"),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.falsePlinth?.plasticWasteVolume,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.crawlSpace?.plasticWasteVolume,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.shallow?.plasticWasteVolume,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.pillar?.plasticWasteVolume,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.hollowCoreSlab?.plasticWasteVolume,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.plasticWasteVolume,
            ),
            Cell(
                type: CellType.row,
                initialValue: "Muovijäte, styrox, kosteuseriste yms. (tonnia)"),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.falsePlinth?.plasticWasteTons,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.crawlSpace?.plasticWasteTons,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.shallow?.plasticWasteTons,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.pillar?.plasticWasteTons,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.hollowCoreSlab?.plasticWasteTons,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.plasticWasteTons,
            ),
            Cell(
                type: CellType.row,
                initialValue: "Kutterinpuru yms. polttokelpoinen puujäte (m3)"),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.falsePlinth?.woodShavingsVolume,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.crawlSpace?.woodShavingsVolume,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.shallow?.woodShavingsVolume,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.pillar?.woodShavingsVolume,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.hollowCoreSlab?.woodShavingsVolume,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.woodShavingsVolume,
            ),
            Cell(
                type: CellType.row,
                initialValue:
                    "Kutterinpuru yms. polttokelpoinen puujäte (tonnia)"),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.falsePlinth?.woodShavingsTons,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.crawlSpace?.woodShavingsTons,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.shallow?.woodShavingsTons,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.pillar?.woodShavingsTons,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.hollowCoreSlab?.woodShavingsTons,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.woodShavingsTons,
            ),
            Cell(
                type: CellType.row,
                initialValue: "Runkopuu ja umpilaudoitus (m3)"),
            OutputCell(
              getter: () => state.totalFoundations?.falsePlinth
                  ?.solidBoardingAndWoodFrameVolume,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.crawlSpace
                  ?.solidBoardingAndWoodFrameVolume,
            ),
            OutputCell(
              getter: () => state
                  .totalFoundations?.shallow?.solidBoardingAndWoodFrameVolume,
            ),
            OutputCell(
              getter: () => state
                  .totalFoundations?.pillar?.solidBoardingAndWoodFrameVolume,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.hollowCoreSlab
                  ?.solidBoardingAndWoodFrameVolume,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.solidBoardingAndWoodFrameVolume,
            ),
            Cell(
                type: CellType.row,
                initialValue: "Runkopuu ja umpilaudoitus (tonnia)"),
            OutputCell(
              getter: () => state
                  .totalFoundations?.falsePlinth?.solidBoardingAndWoodFrameTons,
            ),
            OutputCell(
              getter: () => state
                  .totalFoundations?.crawlSpace?.solidBoardingAndWoodFrameTons,
            ),
            OutputCell(
              getter: () => state
                  .totalFoundations?.shallow?.solidBoardingAndWoodFrameTons,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.pillar?.solidBoardingAndWoodFrameTons,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.hollowCoreSlab
                  ?.solidBoardingAndWoodFrameTons,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.solidBoardingAndWoodFrameTons,
            ),
            Cell(
                type: CellType.row,
                initialValue:
                    "Polttokelpoinen jäte, tervapaperi, rakennuspahvi yms. (m3)"),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.falsePlinth?.combustibleWasteVolume,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.crawlSpace?.combustibleWasteVolume,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.shallow?.combustibleWasteVolume,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.pillar?.combustibleWasteVolume,
            ),
            OutputCell(
              getter: () => state
                  .totalFoundations?.hollowCoreSlab?.combustibleWasteVolume,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.combustibleWasteVolume,
            ),
            Cell(
                type: CellType.row,
                initialValue:
                    "Polttokelpoinen jäte, tervapaperi, rakennuspahvi yms. (tonnia)"),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.falsePlinth?.combustibleWasteTons,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.crawlSpace?.combustibleWasteTons,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.shallow?.combustibleWasteTons,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.pillar?.combustibleWasteTons,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.hollowCoreSlab?.combustibleWasteTons,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.combustibleWasteTons,
            ),
            Cell(type: CellType.row, initialValue: "Kuumabitumisively (m3)"),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.falsePlinth?.hotBitumenCoatingVolume,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.crawlSpace?.hotBitumenCoatingVolume,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.shallow?.hotBitumenCoatingVolume,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.pillar?.hotBitumenCoatingVolume,
            ),
            OutputCell(
              getter: () => state
                  .totalFoundations?.hollowCoreSlab?.hotBitumenCoatingVolume,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.hotBitumenCoatingVolume,
            ),
            Cell(
                type: CellType.row, initialValue: "Kuumabitumisively (tonnia)"),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.falsePlinth?.hotBitumenCoatingTons,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.crawlSpace?.hotBitumenCoatingTons,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.shallow?.hotBitumenCoatingTons,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.pillar?.hotBitumenCoatingTons,
            ),
            OutputCell(
              getter: () =>
                  state.totalFoundations?.hollowCoreSlab?.hotBitumenCoatingTons,
            ),
            OutputCell(
              getter: () => state.totalFoundations?.hotBitumenCoatingTons,
            ),
          ],
        );
      },
    );
  }
}
