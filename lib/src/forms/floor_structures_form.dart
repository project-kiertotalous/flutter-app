import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/floor_structures_bloc.dart';
import 'package:flutter_app/src/bloc/floor_structures_event.dart';
import 'package:flutter_app/src/data/column_cell.dart';
import 'package:flutter_app/src/data/empty_cell.dart';
import 'package:flutter_app/src/data/form_header.dart';
import 'package:flutter_app/src/data/info_button.dart';
import 'package:flutter_app/src/data/input_cell.dart';
import 'package:flutter_app/src/data/output_cell.dart';
import 'package:flutter_app/src/data/row_cell.dart';
import 'package:flutter_app/src/data/tooltip_texts.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO: why double header? needs fixing
          FormHeader(
            text: 'Lattian pintamateriaali',
          ),
          FormHeader(
            text: 'Pinnoitemateriaalin prosenttiosuus tilan lattiapinta-alasta',
          ),
          LayoutGrid(
            columnSizes: [
              232.px,
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
              RowCell(
                // intentionally empty, at least for now
                initialValue: "",
                checkbox: true,
                checkboxValue: state.surfaceMaterialCoatingContainsAsbestos,
                checkboxTitle: "Pinnoite sisältää asbestia",
                checkboxSetter: (value) => floorStructuresBloc.add(
                  SurfaceMaterialCoatingContainsAsbestosChanged(value),
                ),
              ),
              ColumnCell(
                initialValue: 'Toimistotilat',
              ),
              ColumnCell(
                initialValue: 'Aulat ja muut yleiset tilat',
              ),
              ColumnCell(
                initialValue: 'WC ja pesutilat',
              ),
              ColumnCell(
                initialValue: 'Keittiöt',
              ),
              ColumnCell(
                initialValue: 'Opetus-/hoitotilat (m2)',
                iconButton: InfoButton(
                    text: TooltipTexts.outerSheath.floorStructures
                        .teachingAndTreatmentSpaces),
              ),
              ColumnCell(
                initialValue: 'Varastot ja työtilat',
              ),
              ColumnCell(
                initialValue: 'Muut tilat',
              ),
              ColumnCell(
                initialValue: 'Materiaalimäärä yhteensä (m3)',
              ),
              ColumnCell(
                initialValue: 'Materiaalimäärä yhteensä (tonnia)',
              ),
              RowCell(initialValue: 'Lattiapaneeli'),
              InputCell(
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
              InputCell(
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
              InputCell(
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
              InputCell(
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
              InputCell(
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
              InputCell(
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
              InputCell(
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
              RowCell(initialValue: 'Muovimatto tai muovilaatta'),
              InputCell(
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
              InputCell(
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
              InputCell(
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
              InputCell(
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
              InputCell(
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
              InputCell(
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
              InputCell(
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
              RowCell(initialValue: 'Parketti'),
              InputCell(
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
              InputCell(
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
              InputCell(
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
              InputCell(
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
              InputCell(
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
              InputCell(
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
              InputCell(
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
              RowCell(initialValue: 'Kaakelilaatta'),
              InputCell(
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
              InputCell(
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
              InputCell(
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
              InputCell(
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
              InputCell(
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
              InputCell(
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
              InputCell(
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
              RowCell(
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
              EmptyCell(),
              EmptyCell(),
            ],
          ),
        ],
      );
    });
  }
}
