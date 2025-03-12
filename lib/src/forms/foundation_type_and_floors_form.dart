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

  List<DropdownMenuItem> toList() {
    List<DropdownMenuItem<FoundationMaterial?>> list = [];
    list.add(
      DropdownMenuItem<FoundationMaterial?>(
        value: null,
        child: Text('Valitse'),
      ),
    );
    for (final type in FoundationMaterial.values) {
      list.add(
        DropdownMenuItem<FoundationMaterial>(
          value: type,
          child: Text(
            typeToString(type),
          ),
        ),
      );
    }
    return list;
  }

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

    return BlocBuilder<FoundationsBloc, Foundations>(builder: (context, state) {
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
          MenuCell(
            setter: (value) =>
                foundationsBloc.add(FalsePlinthMaterialChanged(value)),
            initialValue: state.falsePlinth?.material,
            items: toList(),
          ),
          MenuCell(
            setter: (value) =>
                foundationsBloc.add(CrawlSpaceMaterialChanged(value)),
            initialValue: state.crawlSpace?.material,
            items: toList(),
          ),
          Cell(
            type: CellType.empty,
          ),
          MenuCell(
            setter: (value) =>
                foundationsBloc.add(PillarMaterialChanged(value)),
            initialValue: state.pillar?.material,
            items: toList(),
          ),
          MenuCell(
            setter: (value) =>
                foundationsBloc.add(HollowCoreSlabMaterialChanged(value)),
            initialValue: state.hollowCoreSlab?.material,
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
            setter: (value) => foundationsBloc.add(ShallowAreaChanged(value)),
          ),
          Cell(
            type: CellType.input,
            initialValue: state.pillar?.area,
            setter: (value) => foundationsBloc.add(PillarAreaChanged(value)),
          ),
          Cell(
            type: CellType.input,
            initialValue: state.hollowCoreSlab?.area,
            setter: (value) =>
                foundationsBloc.add(HollowCoreSlabAreaChanged(value)),
          ),
          OutputCell(
            getter: () => state.area,
          ),
          Cell(
              type: CellType.header,
              initialValue: 'Perustuksen kehämitta (jm)'),
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
          OutputCell(
            getter: () => state.circumference,
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
            checkboxValue: state.bituminousWaterProofing,
            checkboxTitle: "Kosteussuojana bitumisively",
            checkboxSetter: (value) => foundationsBloc.add(
              BituminousWaterProofingChanged(value),
            ),
          ),
          OutputCell(
            getter: () => state.falsePlinth?.concreteVolume,
          ),
          OutputCell(
            getter: () => state.crawlSpace?.concreteVolume,
          ),
          OutputCell(
            getter: () => state.shallow?.concreteVolume,
          ),
          OutputCell(
            getter: () => state.pillar?.concreteVolume,
          ),
          OutputCell(
            getter: () => state.hollowCoreSlab?.concreteVolume,
          ),
          OutputCell(
            getter: () => state.concreteVolume,
          ),
          Cell(type: CellType.row, initialValue: "Betonia (tonnia)"),
          OutputCell(
            getter: () => state.falsePlinth?.concreteTons,
          ),
          OutputCell(
            getter: () => state.crawlSpace?.concreteTons,
          ),
          OutputCell(
            getter: () => state.shallow?.concreteTons,
          ),
          OutputCell(
            getter: () => state.pillar?.concreteTons,
          ),
          OutputCell(
            getter: () => state.hollowCoreSlab?.concreteTons,
          ),
          OutputCell(
            getter: () => state.concreteTons,
          ),
          Cell(type: CellType.row, initialValue: "Betoniterästä (tonnia)"),
          OutputCell(
            getter: () => state.falsePlinth?.rebarTons,
          ),
          OutputCell(
            getter: () => state.crawlSpace?.rebarTons,
          ),
          OutputCell(
            getter: () => state.shallow?.rebarTons,
          ),
          OutputCell(
            getter: () => state.pillar?.rebarTons,
          ),
          OutputCell(
            getter: () => state.hollowCoreSlab?.rebarTons,
          ),
          OutputCell(
            getter: () => state.rebarTons,
          ),
          Cell(type: CellType.row, initialValue: "Betoniharkot (m3)"),
          OutputCell(
            getter: () => state.falsePlinth?.concreteBlockVolume,
          ),
          OutputCell(
            getter: () => state.crawlSpace?.concreteBlockVolume,
          ),
          OutputCell(
            getter: () => state.shallow?.concreteBlockVolume,
          ),
          OutputCell(
            getter: () => state.pillar?.concreteBlockVolume,
          ),
          OutputCell(
            getter: () => state.hollowCoreSlab?.concreteBlockVolume,
          ),
          OutputCell(
            getter: () => state.concreteBlockVolume,
          ),
          Cell(type: CellType.row, initialValue: "Betoniharkot (tonnia)"),
          OutputCell(
            getter: () => state.falsePlinth?.concreteBlockTons,
          ),
          OutputCell(
            getter: () => state.crawlSpace?.concreteBlockTons,
          ),
          OutputCell(
            getter: () => state.shallow?.concreteBlockTons,
          ),
          OutputCell(
            getter: () => state.pillar?.concreteBlockTons,
          ),
          OutputCell(
            getter: () => state.hollowCoreSlab?.concreteBlockTons,
          ),
          OutputCell(
            getter: () => state.concreteBlockTons,
          ),
          Cell(
              type: CellType.row,
              initialValue: "Lasi- ja mineraalieristevilla (m3)"),
          OutputCell(
            getter: () => state.falsePlinth?.concreteVolume,
          ),
          OutputCell(
            getter: () => state.crawlSpace?.concreteVolume,
          ),
          OutputCell(
            getter: () => state.shallow?.concreteVolume,
          ),
          OutputCell(
            getter: () => state.pillar?.concreteVolume,
          ),
          OutputCell(
            getter: () => state.hollowCoreSlab?.concreteVolume,
          ),
          OutputCell(
            getter: () => state.concreteVolume,
          ),
          Cell(
              type: CellType.row,
              initialValue: "Lasi- ja mineraalieristevilla (tonnia)"),
          OutputCell(
            getter: () => state.falsePlinth?.mineralWoolVolume,
          ),
          OutputCell(
            getter: () => state.crawlSpace?.mineralWoolVolume,
          ),
          OutputCell(
            getter: () => state.shallow?.mineralWoolVolume,
          ),
          OutputCell(
            getter: () => state.pillar?.mineralWoolVolume,
          ),
          OutputCell(
            getter: () => state.hollowCoreSlab?.mineralWoolVolume,
          ),
          OutputCell(
            getter: () => state.mineralWoolVolume,
          ),
          Cell(
              type: CellType.row,
              initialValue: "Muovijäte, styrox, kosteuseriste yms. (m3)"),
          OutputCell(
            getter: () => state.falsePlinth?.mineralWoolTons,
          ),
          OutputCell(
            getter: () => state.crawlSpace?.mineralWoolTons,
          ),
          OutputCell(
            getter: () => state.shallow?.mineralWoolTons,
          ),
          OutputCell(
            getter: () => state.pillar?.mineralWoolTons,
          ),
          OutputCell(
            getter: () => state.hollowCoreSlab?.mineralWoolTons,
          ),
          OutputCell(
            getter: () => state.mineralWoolTons,
          ),
          Cell(
              type: CellType.row,
              initialValue: "Muovijäte, styrox, kosteuseriste yms. (tonnia)"),
          OutputCell(
            getter: () => state.falsePlinth?.plasticWasteVolume,
          ),
          OutputCell(
            getter: () => state.crawlSpace?.plasticWasteVolume,
          ),
          OutputCell(
            getter: () => state.shallow?.plasticWasteVolume,
          ),
          OutputCell(
            getter: () => state.pillar?.plasticWasteVolume,
          ),
          OutputCell(
            getter: () => state.hollowCoreSlab?.plasticWasteVolume,
          ),
          OutputCell(
            getter: () => state.plasticWasteVolume,
          ),
          Cell(
              type: CellType.row,
              initialValue: "Kutterinpuru yms. polttokelpoinen puujäte (m3)"),
          OutputCell(
            getter: () => state.falsePlinth?.plasticWasteTons,
          ),
          OutputCell(
            getter: () => state.crawlSpace?.plasticWasteTons,
          ),
          OutputCell(
            getter: () => state.shallow?.plasticWasteTons,
          ),
          OutputCell(
            getter: () => state.pillar?.plasticWasteTons,
          ),
          OutputCell(
            getter: () => state.hollowCoreSlab?.plasticWasteTons,
          ),
          OutputCell(
            getter: () => state.plasticWasteTons,
          ),
          Cell(
              type: CellType.row,
              initialValue:
                  "Kutterinpuru yms. polttokelpoinen puujäte (tonnia)"),
          OutputCell(
            getter: () => state.falsePlinth?.woodShavingsVolume,
          ),
          OutputCell(
            getter: () => state.crawlSpace?.woodShavingsVolume,
          ),
          OutputCell(
            getter: () => state.shallow?.woodShavingsVolume,
          ),
          OutputCell(
            getter: () => state.pillar?.woodShavingsVolume,
          ),
          OutputCell(
            getter: () => state.hollowCoreSlab?.woodShavingsVolume,
          ),
          OutputCell(
            getter: () => state.woodShavingsVolume,
          ),
          Cell(
              type: CellType.row,
              initialValue: "Runkopuu ja umpilaudoitus (m3)"),
          OutputCell(
            getter: () => state.falsePlinth?.solidBoardingAndWoodFrameVolume,
          ),
          OutputCell(
            getter: () => state.crawlSpace?.solidBoardingAndWoodFrameVolume,
          ),
          OutputCell(
            getter: () => state.shallow?.solidBoardingAndWoodFrameVolume,
          ),
          OutputCell(
            getter: () => state.pillar?.solidBoardingAndWoodFrameVolume,
          ),
          OutputCell(
            getter: () => state.hollowCoreSlab?.solidBoardingAndWoodFrameVolume,
          ),
          OutputCell(
            getter: () => state.solidBoardingAndWoodFrameVolume,
          ),
          Cell(
              type: CellType.row,
              initialValue: "Runkopuu ja umpilaudoitus (tonnia)"),
          OutputCell(
            getter: () => state.falsePlinth?.solidBoardingAndWoodFrameTons,
          ),
          OutputCell(
            getter: () => state.crawlSpace?.solidBoardingAndWoodFrameTons,
          ),
          OutputCell(
            getter: () => state.shallow?.solidBoardingAndWoodFrameTons,
          ),
          OutputCell(
            getter: () => state.pillar?.solidBoardingAndWoodFrameTons,
          ),
          OutputCell(
            getter: () => state.hollowCoreSlab?.solidBoardingAndWoodFrameTons,
          ),
          OutputCell(
            getter: () => state.solidBoardingAndWoodFrameTons,
          ),
          Cell(
              type: CellType.row,
              initialValue:
                  "Polttokelpoinen jäte, tervapaperi, rakennuspahvi yms. (m3)"),
          OutputCell(
            getter: () => state.falsePlinth?.combustibleWasteVolume,
          ),
          OutputCell(
            getter: () => state.crawlSpace?.combustibleWasteVolume,
          ),
          OutputCell(
            getter: () => state.shallow?.combustibleWasteVolume,
          ),
          OutputCell(
            getter: () => state.pillar?.combustibleWasteVolume,
          ),
          OutputCell(
            getter: () => state.hollowCoreSlab?.combustibleWasteVolume,
          ),
          OutputCell(
            getter: () => state.combustibleWasteVolume,
          ),
          Cell(
              type: CellType.row,
              initialValue:
                  "Polttokelpoinen jäte, tervapaperi, rakennuspahvi yms. (tonnia)"),
          OutputCell(
            getter: () => state.falsePlinth?.combustibleWasteTons,
          ),
          OutputCell(
            getter: () => state.crawlSpace?.combustibleWasteTons,
          ),
          OutputCell(
            getter: () => state.shallow?.combustibleWasteTons,
          ),
          OutputCell(
            getter: () => state.pillar?.combustibleWasteTons,
          ),
          OutputCell(
            getter: () => state.hollowCoreSlab?.combustibleWasteTons,
          ),
          OutputCell(
            getter: () => state.combustibleWasteTons,
          ),
          Cell(type: CellType.row, initialValue: "Kuumabitumisively (m3)"),
          OutputCell(
            getter: () => state.falsePlinth?.hotBitumenCoatingVolume,
          ),
          OutputCell(
            getter: () => state.crawlSpace?.hotBitumenCoatingVolume,
          ),
          OutputCell(
            getter: () => state.shallow?.hotBitumenCoatingVolume,
          ),
          OutputCell(
            getter: () => state.pillar?.hotBitumenCoatingVolume,
          ),
          OutputCell(
            getter: () => state.hollowCoreSlab?.hotBitumenCoatingVolume,
          ),
          OutputCell(
            getter: () => state.hotBitumenCoatingVolume,
          ),
          Cell(type: CellType.row, initialValue: "Kuumabitumisively (tonnia)"),
          OutputCell(
            getter: () => state.falsePlinth?.hotBitumenCoatingTons,
          ),
          OutputCell(
            getter: () => state.crawlSpace?.hotBitumenCoatingTons,
          ),
          OutputCell(
            getter: () => state.shallow?.hotBitumenCoatingTons,
          ),
          OutputCell(
            getter: () => state.pillar?.hotBitumenCoatingTons,
          ),
          OutputCell(
            getter: () => state.hollowCoreSlab?.hotBitumenCoatingTons,
          ),
          OutputCell(
            getter: () => state.hotBitumenCoatingTons,
          ),
        ],
      );
    });
  }
}
