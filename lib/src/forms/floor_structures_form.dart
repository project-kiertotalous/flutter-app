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
                percentage: true,
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
                percentage: true,
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
                percentage: true,
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
                percentage: true,
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
                percentage: true,
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
                percentage: true,
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
                percentage: true,
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
                    state.officeSpaces?.plasticCarpetOrPlasticTileFloorPortion,
                percentage: true,
                setter: (value) {
                  floorStructuresBloc.add(
                    OfficeSpacesChanged(
                      state.officeSpaces!.copyWith(
                          plasticCarpetOrPlasticTileFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue: state.lobbiesAndOtherCommonAreas
                    ?.plasticCarpetOrPlasticTileFloorPortion,
                percentage: true,
                setter: (value) {
                  floorStructuresBloc.add(
                    LobbiesAndOtherCommonAreasChanged(
                      state.lobbiesAndOtherCommonAreas!.copyWith(
                          plasticCarpetOrPlasticTileFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue: state.restroomsAndWashingFacilities
                    ?.plasticCarpetOrPlasticTileFloorPortion,
                percentage: true,
                setter: (value) {
                  floorStructuresBloc.add(
                    RestRoomsAndWashingFacilitiesChanged(
                      state.restroomsAndWashingFacilities!.copyWith(
                          plasticCarpetOrPlasticTileFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue:
                    state.kitchens?.plasticCarpetOrPlasticTileFloorPortion,
                percentage: true,
                setter: (value) {
                  floorStructuresBloc.add(
                    KitchensChanged(
                      state.kitchens!.copyWith(
                          plasticCarpetOrPlasticTileFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue: state.teachingAndTreatmentSpaces
                    ?.plasticCarpetOrPlasticTileFloorPortion,
                percentage: true,
                setter: (value) {
                  floorStructuresBloc.add(
                    TeachingAndTreatmentSpacesChanged(
                      state.teachingAndTreatmentSpaces!.copyWith(
                          plasticCarpetOrPlasticTileFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue: state.storageAndWorkspaces
                    ?.plasticCarpetOrPlasticTileFloorPortion,
                percentage: true,
                setter: (value) {
                  floorStructuresBloc.add(
                    StorageAndWorkspacesChanged(
                      state.storageAndWorkspaces!.copyWith(
                          plasticCarpetOrPlasticTileFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue:
                    state.otherSpaces?.plasticCarpetOrPlasticTileFloorPortion,
                percentage: true,
                setter: (value) {
                  floorStructuresBloc.add(
                    OtherSpacesChanged(
                      state.otherSpaces!.copyWith(
                          plasticCarpetOrPlasticTileFloorPortion: value),
                    ),
                  );
                },
              ),
              OutputCell(
                getter: () => state.plasticCarpetOrPlasticTileFloorTons,
              ),
              OutputCell(
                getter: () => state.plasticCarpetOrPlasticTileFloorTons,
              ),
              Cell(type: CellType.row, initialValue: 'Parketti'),
              Cell(
                type: CellType.input,
                initialValue: state.officeSpaces?.parquetFloorPortion,
                percentage: true,
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
                percentage: true,
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
                percentage: true,
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
                percentage: true,
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
                percentage: true,
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
                percentage: true,
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
                percentage: true,
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
                initialValue: state.officeSpaces?.ceramicTileFloorPortion,
                percentage: true,
                setter: (value) {
                  floorStructuresBloc.add(
                    OfficeSpacesChanged(
                      state.officeSpaces!
                          .copyWith(ceramicTileFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue:
                    state.lobbiesAndOtherCommonAreas?.ceramicTileFloorPortion,
                percentage: true,
                setter: (value) {
                  floorStructuresBloc.add(
                    LobbiesAndOtherCommonAreasChanged(
                      state.lobbiesAndOtherCommonAreas!
                          .copyWith(ceramicTileFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue: state
                    .restroomsAndWashingFacilities?.ceramicTileFloorPortion,
                percentage: true,
                setter: (value) {
                  floorStructuresBloc.add(
                    RestRoomsAndWashingFacilitiesChanged(
                      state.restroomsAndWashingFacilities!
                          .copyWith(ceramicTileFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue: state.kitchens?.ceramicTileFloorPortion,
                percentage: true,
                setter: (value) {
                  floorStructuresBloc.add(
                    KitchensChanged(
                      state.kitchens!.copyWith(ceramicTileFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue:
                    state.teachingAndTreatmentSpaces?.ceramicTileFloorPortion,
                percentage: true,
                setter: (value) {
                  floorStructuresBloc.add(
                    TeachingAndTreatmentSpacesChanged(
                      state.teachingAndTreatmentSpaces!
                          .copyWith(ceramicTileFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue:
                    state.storageAndWorkspaces?.ceramicTileFloorPortion,
                percentage: true,
                setter: (value) {
                  floorStructuresBloc.add(
                    StorageAndWorkspacesChanged(
                      state.storageAndWorkspaces!
                          .copyWith(ceramicTileFloorPortion: value),
                    ),
                  );
                },
              ),
              Cell(
                type: CellType.input,
                initialValue: state.otherSpaces?.ceramicTileFloorPortion,
                percentage: true,
                setter: (value) {
                  floorStructuresBloc.add(
                    OtherSpacesChanged(
                      state.otherSpaces!
                          .copyWith(ceramicTileFloorPortion: value),
                    ),
                  );
                },
              ),
              OutputCell(
                getter: () => state.ceramicTileFloorVolume,
              ),
              OutputCell(
                getter: () => state.ceramicTileFloorTons,
              ),
              Cell(
                type: CellType.row,
                initialValue: 'Pintamateriaalit yhteensä (%)',
              ),
              OutputCell(
                getter: () => state.officeSpaces?.floorPortionTotal,
                percentage: true,
              ),
              OutputCell(
                getter: () =>
                    state.lobbiesAndOtherCommonAreas?.floorPortionTotal,
                percentage: true,
              ),
              OutputCell(
                getter: () =>
                    state.restroomsAndWashingFacilities?.floorPortionTotal,
                percentage: true,
              ),
              OutputCell(
                getter: () => state.kitchens?.floorPortionTotal,
                percentage: true,
              ),
              OutputCell(
                getter: () =>
                    state.teachingAndTreatmentSpaces?.floorPortionTotal,
                percentage: true,
              ),
              OutputCell(
                getter: () => state.storageAndWorkspaces?.floorPortionTotal,
                percentage: true,
              ),
              OutputCell(
                getter: () => state.otherSpaces?.floorPortionTotal,
                percentage: true,
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
