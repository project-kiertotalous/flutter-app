import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/floor_structures_bloc.dart';
import 'package:flutter_app/src/bloc/floor_structures_event.dart';
import 'package:flutter_app/src/data/cell.dart';
import 'package:flutter_app/src/data/cell_type.dart';
import 'package:flutter_app/src/data/form_header.dart';
import 'package:flutter_app/src/data/output_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class FloorStructuresForm extends StatelessWidget {
  const FloorStructuresForm({super.key});

  @override
  Widget build(BuildContext context) {
    final floorStructuresBloc = context.read<FloorStructuresBloc>();

    return BlocBuilder<FloorStructuresBloc, FloorStructures>(
        builder: (context, state) {
      return Column(
        children: [
          FormHeader(
            text: 'Lattian pintamateriaali',
          ),
          FormHeader(
            text: 'Pinnoitemateriaalin prosenttiosuus tilan lattiapinta-alasta',
          ),
          LayoutGrid(
            columnSizes: [
              220.px,
              140.px,
              140.px,
              140.px,
              140.px,
              140.px,
              140.px,
              140.px,
              140.px,
              140.px,
            ],
            rowSizes: [
              50.px,
              50.px,
              50.px,
              50.px,
              50.px,
              50.px,
            ],
            children: [
              Cell(
                type: CellType.row,
                initialValue: "",
                checkbox: true,
                checkboxValue: state.surfaceMaterialCoatingContainsAsbestos,
                checkboxTitle: "Pinnoite sisältää asbestia",
                checkboxSetter: (value) => floorStructuresBloc.add(
                  SurfaceMaterialCoatingContainsAsbestosChanged(value),
                ),
              ),
              Cell(
                type: CellType.column,
                initialValue: 'Toimistotilat',
              ),
              Cell(
                type: CellType.column,
                initialValue: 'Aulat ja muut yleiset tilat',
              ),
              Cell(
                type: CellType.column,
                initialValue: 'WC ja pesutilat',
              ),
              Cell(
                type: CellType.column,
                initialValue: 'Keittiöt',
              ),
              Cell(
                type: CellType.column,
                initialValue: 'Opetus-/hoitotilat (m2)',
              ),
              Cell(
                type: CellType.column,
                initialValue: 'Varastot ja työtilat',
              ),
              Cell(
                type: CellType.column,
                initialValue: 'Muut tilat',
              ),
              Cell(
                type: CellType.column,
                initialValue: 'Materiaalimäärä yhteensä (m3)',
              ),
              Cell(
                type: CellType.column,
                initialValue: 'Materiaalimäärä yhteensä (tonnia)',
              ),
              Cell(type: CellType.row, initialValue: 'Lattiapaneeli'),
              Cell(
                type: CellType.input,
                initialValue: state.officeSpaces?.floorPanelFloorPortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    OfficeSpacesChanged(
                      state.officeSpaces!
                          .copyWith(floorPanelFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue:
                    state.lobbiesAndOtherCommonAreas?.floorPanelFloorPortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    LobbiesAndOtherCommonAreasChanged(
                      state.lobbiesAndOtherCommonAreas!
                          .copyWith(floorPanelFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue:
                    state.restroomsAndWashingFacilities?.floorPanelFloorPortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    RestRoomsAndWashingFacilitiesChanged(
                      state.restroomsAndWashingFacilities!
                          .copyWith(floorPanelFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue: state.kitchens?.floorPanelFloorPortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    KitchensChanged(
                      state.kitchens!.copyWith(floorPanelFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue:
                    state.teachingAndTreatmentSpaces?.floorPanelFloorPortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    TeachingAndTreatmentSpacesChanged(
                      state.teachingAndTreatmentSpaces!
                          .copyWith(floorPanelFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue:
                    state.storageAndWorkspaces?.floorPanelFloorPortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    StorageAndWorkspacesChanged(
                      state.storageAndWorkspaces!
                          .copyWith(floorPanelFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue: state.otherSpaces?.floorPanelFloorPortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    OtherSpacesChanged(
                      state.otherSpaces!
                          .copyWith(floorPanelFloorPortion: value),
                    ),
                  );
                },
              ),
              OutputCell(
                getter: () => state.floorPanelFloorVolume,
              ),
              OutputCell(
                getter: () => state.floorPanelFloorTons,
              ),
              Cell(
                  type: CellType.row,
                  initialValue: 'Muovimatto tai muovilaatta'),
              Cell(
                type: CellType.input,
                initialValue:
                    state.officeSpaces?.vinylFlooringOrTileFloorPortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    OfficeSpacesChanged(
                      state.officeSpaces!
                          .copyWith(vinylFlooringOrTileFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue: state.lobbiesAndOtherCommonAreas
                    ?.vinylFlooringOrTileFloorPortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    LobbiesAndOtherCommonAreasChanged(
                      state.lobbiesAndOtherCommonAreas!
                          .copyWith(vinylFlooringOrTileFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue: state.restroomsAndWashingFacilities
                    ?.vinylFlooringOrTileFloorPortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    RestRoomsAndWashingFacilitiesChanged(
                      state.restroomsAndWashingFacilities!
                          .copyWith(vinylFlooringOrTileFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue: state.kitchens?.vinylFlooringOrTileFloorPortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    KitchensChanged(
                      state.kitchens!
                          .copyWith(vinylFlooringOrTileFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue: state.teachingAndTreatmentSpaces
                    ?.vinylFlooringOrTileFloorPortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    TeachingAndTreatmentSpacesChanged(
                      state.teachingAndTreatmentSpaces!
                          .copyWith(vinylFlooringOrTileFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue:
                    state.storageAndWorkspaces?.vinylFlooringOrTileFloorPortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    StorageAndWorkspacesChanged(
                      state.storageAndWorkspaces!
                          .copyWith(vinylFlooringOrTileFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue:
                    state.otherSpaces?.vinylFlooringOrTileFloorPortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    OtherSpacesChanged(
                      state.otherSpaces!
                          .copyWith(vinylFlooringOrTileFloorPortion: value),
                    ),
                  );
                },
              ),
              OutputCell(
                getter: () => state.vinylFlooringOrTileFloorVolume,
              ),
              OutputCell(
                getter: () => state.vinylFlooringOrTileFloorTons,
              ),
              Cell(type: CellType.row, initialValue: 'Parketti'),
              Cell(
                type: CellType.input,
                initialValue: state.officeSpaces?.parquetFloorPortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    OfficeSpacesChanged(
                      state.officeSpaces!.copyWith(parquetFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue:
                    state.lobbiesAndOtherCommonAreas?.parquetFloorPortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    LobbiesAndOtherCommonAreasChanged(
                      state.lobbiesAndOtherCommonAreas!
                          .copyWith(parquetFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue:
                    state.restroomsAndWashingFacilities?.parquetFloorPortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    RestRoomsAndWashingFacilitiesChanged(
                      state.restroomsAndWashingFacilities!
                          .copyWith(parquetFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue: state.kitchens?.parquetFloorPortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    KitchensChanged(
                      state.kitchens!.copyWith(parquetFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue:
                    state.teachingAndTreatmentSpaces?.parquetFloorPortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    TeachingAndTreatmentSpacesChanged(
                      state.teachingAndTreatmentSpaces!
                          .copyWith(parquetFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue: state.storageAndWorkspaces?.parquetFloorPortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    StorageAndWorkspacesChanged(
                      state.storageAndWorkspaces!
                          .copyWith(parquetFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue: state.otherSpaces?.parquetFloorPortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    OtherSpacesChanged(
                      state.otherSpaces!.copyWith(parquetFloorPortion: value),
                    ),
                  );
                },
              ),
              OutputCell(
                getter: () => state.parquetFloorVolume,
              ),
              OutputCell(
                getter: () => state.parquetFloorTons,
              ),
              Cell(type: CellType.row, initialValue: 'Kaakelilaatta'),
              Cell(
                type: CellType.input,
                initialValue: state.officeSpaces?.gypsumBoardingMidsolePortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    OfficeSpacesChanged(
                      state.officeSpaces!
                          .copyWith(gypsumBoardingMidsolePortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue: state
                    .lobbiesAndOtherCommonAreas?.gypsumBoardingMidsolePortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    LobbiesAndOtherCommonAreasChanged(
                      state.lobbiesAndOtherCommonAreas!
                          .copyWith(gypsumBoardingMidsolePortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue: state.restroomsAndWashingFacilities
                    ?.gypsumBoardingMidsolePortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    RestRoomsAndWashingFacilitiesChanged(
                      state.restroomsAndWashingFacilities!
                          .copyWith(gypsumBoardingMidsolePortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue: state.kitchens?.gypsumBoardingMidsolePortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    KitchensChanged(
                      state.kitchens!
                          .copyWith(gypsumBoardingMidsolePortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue: state
                    .teachingAndTreatmentSpaces?.gypsumBoardingMidsolePortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    TeachingAndTreatmentSpacesChanged(
                      state.teachingAndTreatmentSpaces!
                          .copyWith(gypsumBoardingMidsolePortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue:
                    state.storageAndWorkspaces?.gypsumBoardingMidsolePortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    StorageAndWorkspacesChanged(
                      state.storageAndWorkspaces!
                          .copyWith(gypsumBoardingMidsolePortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue: state.otherSpaces?.gypsumBoardingMidsolePortion,
                setter: (value) {
                  floorStructuresBloc.add(
                    OtherSpacesChanged(
                      state.otherSpaces!
                          .copyWith(gypsumBoardingMidsolePortion: value),
                    ),
                  );
                },
              ),
              OutputCell(
                getter: () => state.gypsumBoardingMidsoleVolume,
              ),
              OutputCell(
                getter: () => state.gypsumBoardingMidsoleTons,
              ),
              Cell(
                type: CellType.row,
                initialValue: 'Pintamateriaalit yhteensä (%)',
              ),
              OutputCell(
                getter: () => state.officeSpaces?.floorPortionTotal,
              ),
              OutputCell(
                getter: () =>
                    state.lobbiesAndOtherCommonAreas?.floorPortionTotal,
              ),
              OutputCell(
                getter: () =>
                    state.restroomsAndWashingFacilities?.floorPortionTotal,
              ),
              OutputCell(
                getter: () => state.kitchens?.floorPortionTotal,
              ),
              OutputCell(
                getter: () =>
                    state.teachingAndTreatmentSpaces?.floorPortionTotal,
              ),
              OutputCell(
                getter: () => state.storageAndWorkspaces?.floorPortionTotal,
              ),
              OutputCell(
                getter: () => state.otherSpaces?.floorPortionTotal,
              ),
              Cell(
                type: CellType.empty,
              ),
              Cell(
                type: CellType.empty,
              ),
            ],
          ),
        ],
      );
    });
  }
}
