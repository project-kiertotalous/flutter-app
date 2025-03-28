import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/room_space_bloc.dart';
import 'package:flutter_app/src/bloc/room_space_event.dart';
import 'package:flutter_app/src/data/column_cell.dart';
import 'package:flutter_app/src/data/empty_cell.dart';
import 'package:flutter_app/src/data/form_header.dart';
import 'package:flutter_app/src/data/grey_cell.dart';
import 'package:flutter_app/src/data/input_cell.dart';
import 'package:flutter_app/src/data/output_cell.dart';
import 'package:flutter_app/src/data/row_cell.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';

class RoomSpaceForm extends StatelessWidget {
  const RoomSpaceForm({super.key});

  @override
  Widget build(BuildContext context) {
    final roomSpaceBloc = context.read<RoomSpaceBloc>();

    return BlocBuilder<RoomSpaceBloc, RoomSpaces>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            FormHeader(
              text:
                  'Erilaiset tilat kuten toimistot, aulat, luokkahuoneet, asuintilat ja muut vastaavat huoneet',
            ),
            LayoutGrid(
              columnSizes: [
                335.px,
                110.px,
                110.px,
                110.px,
                110.px,
                110.px,
                110.px,
                110.px,
                120.px,
                120.px,
                120.px,
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
                50.px
              ],
              children: [
                RowCell(
                  initialValue:
                      'Erilaiset tilat, kuten toimistot, aulat, luokkahuoneet, asuintilat ja muut vastaavat huoneet',
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
                ),
                ColumnCell(
                  initialValue: 'Varastot ja työtilat',
                ),
                ColumnCell(
                  initialValue: 'Muut tilat',
                ),
                ColumnCell(
                  initialValue: 'Kaikki tilat yhteensä (m2)',
                ),
                ColumnCell(
                  initialValue: 'Materiaalimäärä yhteensä (m3)',
                ),
                ColumnCell(
                  initialValue: 'Materiaalimäärä yhteensä (t)',
                ),
                RowCell(
                  initialValue: 'Puurunkoiset seinät (jm)',
                ),
                InputCell(
                  initialValue: state.officeSpaces?.woodFramedWallsLinearMeters,
                  setter: (value) => roomSpaceBloc.add(OfficeSpaceChanged(
                    (state.officeSpaces ?? RoomSpace()).copyWith(
                      woodFramedWallsLinearMeters: value,
                    ),
                  )),
                ),
                InputCell(
                  initialValue: state
                      .lobbiesAndOtherCommonAreas?.woodFramedWallsLinearMeters,
                  setter: (value) => roomSpaceBloc.add(LobbiesChanged(
                    (state.lobbiesAndOtherCommonAreas ?? RoomSpace()).copyWith(
                      woodFramedWallsLinearMeters: value,
                    ),
                  )),
                ),
                InputCell(
                  initialValue: state.restroomsAndWashingFacilities
                      ?.woodFramedWallsLinearMeters,
                  setter: (value) => roomSpaceBloc.add(RestroomsChanged(
                    (state.restroomsAndWashingFacilities ?? RoomSpace())
                        .copyWith(
                      woodFramedWallsLinearMeters: value,
                    ),
                  )),
                ),
                InputCell(
                  initialValue: state.kitchens?.woodFramedWallsLinearMeters,
                  setter: (value) => roomSpaceBloc.add(KitchensChanged(
                    (state.kitchens ?? RoomSpace()).copyWith(
                      woodFramedWallsLinearMeters: value,
                    ),
                  )),
                ),
                InputCell(
                  initialValue: state
                      .teachingAndTreatmentSpaces?.woodFramedWallsLinearMeters,
                  setter: (value) => roomSpaceBloc.add(TeachingSpacesChanged(
                    (state.teachingAndTreatmentSpaces ?? RoomSpace()).copyWith(
                      woodFramedWallsLinearMeters: value,
                    ),
                  )),
                ),
                InputCell(
                  initialValue:
                      state.storageAndWorkspaces?.woodFramedWallsLinearMeters,
                  setter: (value) => roomSpaceBloc.add(StorageChanged(
                    (state.storageAndWorkspaces ?? RoomSpace()).copyWith(
                      woodFramedWallsLinearMeters: value,
                    ),
                  )),
                ),
                InputCell(
                  initialValue: state.otherSpaces?.woodFramedWallsLinearMeters,
                  setter: (value) => roomSpaceBloc.add(OtherSpacesChanged(
                    (state.otherSpaces ?? RoomSpace()).copyWith(
                      woodFramedWallsLinearMeters: value,
                    ),
                  )),
                ),
                OutputCell(
                  getter: () => state.totalWoodFramedWallsInSquareMeters,
                ),
                OutputCell(
                  getter: () => state.totalWoodFramedWallsVolume,
                ),
                OutputCell(
                  getter: () => state.totalWoodFramedWallsTons,
                ),
                RowCell(
                  initialValue: 'Tiiliseinät (jm)',
                ),
                InputCell(
                  initialValue: state.officeSpaces?.brickWallsLinearMeters,
                  setter: (value) => roomSpaceBloc.add(OfficeSpaceChanged(
                    (state.officeSpaces ?? RoomSpace()).copyWith(
                      brickWallsLinearMeters: value,
                    ),
                  )),
                ),
                InputCell(
                  initialValue:
                      state.lobbiesAndOtherCommonAreas?.brickWallsLinearMeters,
                  setter: (value) => roomSpaceBloc.add(LobbiesChanged(
                    (state.lobbiesAndOtherCommonAreas ?? RoomSpace()).copyWith(
                      brickWallsLinearMeters: value,
                    ),
                  )),
                ),
                InputCell(
                  initialValue: state
                      .restroomsAndWashingFacilities?.brickWallsLinearMeters,
                  setter: (value) => roomSpaceBloc.add(RestroomsChanged(
                    (state.restroomsAndWashingFacilities ?? RoomSpace())
                        .copyWith(
                      brickWallsLinearMeters: value,
                    ),
                  )),
                ),
                InputCell(
                  initialValue: state.kitchens?.brickWallsLinearMeters,
                  setter: (value) => roomSpaceBloc.add(KitchensChanged(
                    (state.kitchens ?? RoomSpace()).copyWith(
                      brickWallsLinearMeters: value,
                    ),
                  )),
                ),
                InputCell(
                  initialValue:
                      state.teachingAndTreatmentSpaces?.brickWallsLinearMeters,
                  setter: (value) => roomSpaceBloc.add(TeachingSpacesChanged(
                    (state.teachingAndTreatmentSpaces ?? RoomSpace()).copyWith(
                      brickWallsLinearMeters: value,
                    ),
                  )),
                ),
                InputCell(
                  initialValue:
                      state.storageAndWorkspaces?.brickWallsLinearMeters,
                  setter: (value) => roomSpaceBloc.add(StorageChanged(
                    (state.storageAndWorkspaces ?? RoomSpace()).copyWith(
                      brickWallsLinearMeters: value,
                    ),
                  )),
                ),
                InputCell(
                  initialValue: state.otherSpaces?.brickWallsLinearMeters,
                  setter: (value) => roomSpaceBloc.add(OtherSpacesChanged(
                    (state.otherSpaces ?? RoomSpace()).copyWith(
                      brickWallsLinearMeters: value,
                    ),
                  )),
                ),
                OutputCell(
                  getter: () => state.totalBrickWallsInSquareMeters,
                ),
                OutputCell(
                  getter: () => state.totalBrickWallsVolume,
                ),
                OutputCell(
                  getter: () => state.totalBrickWallsTons,
                ),
                RowCell(
                  initialValue: 'Betonielementti-/Valuseinät (jm)',
                ),
                InputCell(
                  initialValue: state
                      .officeSpaces?.concreteElementOrCastingWallsLinearMeters,
                  setter: (value) => roomSpaceBloc.add(OfficeSpaceChanged(
                    (state.officeSpaces ?? RoomSpace()).copyWith(
                      concreteElementOrCastingWallsLinearMeters: value,
                    ),
                  )),
                ),
                InputCell(
                  initialValue: state.lobbiesAndOtherCommonAreas
                      ?.concreteElementOrCastingWallsLinearMeters,
                  setter: (value) => roomSpaceBloc.add(LobbiesChanged(
                    (state.lobbiesAndOtherCommonAreas ?? RoomSpace()).copyWith(
                        concreteElementOrCastingWallsLinearMeters: value),
                  )),
                ),
                InputCell(
                  initialValue: state.restroomsAndWashingFacilities
                      ?.concreteElementOrCastingWallsLinearMeters,
                  setter: (value) => roomSpaceBloc.add(RestroomsChanged(
                    (state.restroomsAndWashingFacilities ?? RoomSpace())
                        .copyWith(
                            concreteElementOrCastingWallsLinearMeters: value),
                  )),
                ),
                InputCell(
                  initialValue:
                      state.kitchens?.concreteElementOrCastingWallsLinearMeters,
                  setter: (value) => roomSpaceBloc.add(KitchensChanged(
                    (state.kitchens ?? RoomSpace()).copyWith(
                      concreteElementOrCastingWallsLinearMeters: value,
                    ),
                  )),
                ),
                InputCell(
                  initialValue: state.teachingAndTreatmentSpaces
                      ?.concreteElementOrCastingWallsLinearMeters,
                  setter: (value) => roomSpaceBloc.add(TeachingSpacesChanged(
                    (state.teachingAndTreatmentSpaces ?? RoomSpace()).copyWith(
                        concreteElementOrCastingWallsLinearMeters: value),
                  )),
                ),
                InputCell(
                  initialValue: state.storageAndWorkspaces
                      ?.concreteElementOrCastingWallsLinearMeters,
                  setter: (value) => roomSpaceBloc.add(StorageChanged(
                    (state.storageAndWorkspaces ?? RoomSpace()).copyWith(
                      concreteElementOrCastingWallsLinearMeters: value,
                    ),
                  )),
                ),
                InputCell(
                  initialValue: state
                      .otherSpaces?.concreteElementOrCastingWallsLinearMeters,
                  setter: (value) => roomSpaceBloc.add(OtherSpacesChanged(
                    (state.otherSpaces ?? RoomSpace()).copyWith(
                      concreteElementOrCastingWallsLinearMeters: value,
                    ),
                  )),
                ),
                OutputCell(
                  getter: () =>
                      state.totalConcreteElementOrCastingWallsInSquareMeters,
                ),
                OutputCell(
                  getter: () => state.totalConcreteElementOrCastingWallsVolume,
                ),
                OutputCell(
                  getter: () => state.totalConcreteElementOrCastingWallsTons,
                ),
                RowCell(
                  initialValue: 'Tilan seinäpituus yhteensä (jm)',
                ),
                OutputCell(
                  getter: () =>
                      state.officeSpaces?.overallWallLengthLinearMeters,
                ),
                OutputCell(
                  getter: () => state.lobbiesAndOtherCommonAreas
                      ?.overallWallLengthLinearMeters,
                ),
                OutputCell(
                  getter: () => state.restroomsAndWashingFacilities
                      ?.overallWallLengthLinearMeters,
                ),
                OutputCell(
                  getter: () => state.kitchens?.overallWallLengthLinearMeters,
                ),
                OutputCell(
                  getter: () => state.teachingAndTreatmentSpaces
                      ?.overallWallLengthLinearMeters,
                ),
                OutputCell(
                  getter: () =>
                      state.storageAndWorkspaces?.overallWallLengthLinearMeters,
                ),
                OutputCell(
                  getter: () =>
                      state.otherSpaces?.overallWallLengthLinearMeters,
                ),
                OutputCell(
                  getter: () => state
                      .totalSpacesWallLengthInSquareMeters, //this is actually linear meters
                ),
                GreyCell(),
                GreyCell(),
                RowCell(
                  initialValue: 'Tilan seinäpinta-ala yhteensä (m2)',
                ),
                OutputCell(
                  getter: () => state.officeSpaces?.overallWallArea,
                ),
                OutputCell(
                  getter: () =>
                      state.lobbiesAndOtherCommonAreas?.overallWallArea,
                ),
                OutputCell(
                  getter: () =>
                      state.restroomsAndWashingFacilities?.overallWallArea,
                ),
                OutputCell(
                  getter: () => state.kitchens?.overallWallArea,
                ),
                OutputCell(
                  getter: () =>
                      state.teachingAndTreatmentSpaces?.overallWallArea,
                ),
                OutputCell(
                  getter: () => state.storageAndWorkspaces?.overallWallArea,
                ),
                OutputCell(
                  getter: () => state.otherSpaces?.overallWallArea,
                ),
                OutputCell(
                  getter: () => state.totalSpacesWallArea,
                ),
                GreyCell(),
                GreyCell(),
                RowCell(
                  initialValue: 'Tilan osuus seinien kokonaispinta-alasta (m)',
                ),
                OutputCell(
                  getter: () =>
                      state.officeSpaces?.partOfAllPartitionWallsInPercents,
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state.lobbiesAndOtherCommonAreas
                      ?.partOfAllPartitionWallsInPercents,
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state.restroomsAndWashingFacilities
                      ?.partOfAllPartitionWallsInPercents,
                  percentage: true,
                ),
                OutputCell(
                  getter: () =>
                      state.kitchens?.partOfAllPartitionWallsInPercents,
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state.teachingAndTreatmentSpaces
                      ?.partOfAllPartitionWallsInPercents,
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state
                      .storageAndWorkspaces?.partOfAllPartitionWallsInPercents,
                  percentage: true,
                ),
                OutputCell(
                  getter: () =>
                      state.otherSpaces?.partOfAllPartitionWallsInPercents,
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state
                      .otherSpaces?.partOfAllPartitionWallsInPercents, //fix
                ),
                GreyCell(),
                GreyCell(),
                FormHeader(
                    text:
                        'Seinien pintarakenteen %-osuus kaikista väliseinistä (seinäpinta-alasta)'),
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
                RowCell(
                  checkbox: true,
                  checkboxTitle: 'Pinnoite sisältää asbestia',
                  checkboxValue: state.surfaceMaterialCoatingContainsAsbestos,
                  checkboxSetter: (value) =>
                      roomSpaceBloc.add(SurfaceMaterialCoatingChanged(value)),
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
                ),
                ColumnCell(
                  initialValue: 'Varastot ja työtilat',
                ),
                ColumnCell(
                  initialValue: 'Muut tilat',
                ),
                ColumnCell(
                  initialValue: 'Kaikki tilat yhteensä (m2)',
                ),
                ColumnCell(
                  initialValue: 'Materiaalimäärä yhteensä (m3)',
                ),
                ColumnCell(
                  initialValue: 'Materiaalimäärä yhteensä (t)',
                ),
                RowCell(
                  initialValue: 'Lastulevy',
                ),
                InputCell(
                  initialValue: state.officeSpaces?.chipboard,
                  setter: (value) => roomSpaceBloc.add(OfficeSpaceChanged(
                    (state.officeSpaces ?? RoomSpace()).copyWith(
                      chipboard: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.lobbiesAndOtherCommonAreas?.chipboard,
                  setter: (value) => roomSpaceBloc.add(LobbiesChanged(
                    (state.lobbiesAndOtherCommonAreas ?? RoomSpace()).copyWith(
                      chipboard: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.restroomsAndWashingFacilities?.chipboard,
                  setter: (value) => roomSpaceBloc.add(RestroomsChanged(
                    (state.restroomsAndWashingFacilities ?? RoomSpace())
                        .copyWith(
                      chipboard: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.kitchens?.chipboard,
                  setter: (value) => roomSpaceBloc.add(KitchensChanged(
                    (state.kitchens ?? RoomSpace()).copyWith(
                      chipboard: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.teachingAndTreatmentSpaces?.chipboard,
                  setter: (value) => roomSpaceBloc.add(TeachingSpacesChanged(
                    (state.teachingAndTreatmentSpaces ?? RoomSpace()).copyWith(
                      chipboard: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.storageAndWorkspaces?.chipboard,
                  setter: (value) => roomSpaceBloc.add(StorageChanged(
                    (state.storageAndWorkspaces ?? RoomSpace()).copyWith(
                      chipboard: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.otherSpaces?.chipboard,
                  setter: (value) => roomSpaceBloc.add(OtherSpacesChanged(
                    (state.otherSpaces ?? RoomSpace()).copyWith(
                      chipboard: value,
                    ),
                  )),
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state.totalChipboardArea,
                ),
                OutputCell(
                  getter: () => state.totalChipboardVolume,
                ),
                OutputCell(
                  getter: () => state.totalChipboardTons,
                ),
                RowCell(
                  initialValue: 'Kipsilevy (Cybroc)',
                ),
                InputCell(
                  initialValue: state.officeSpaces?.cybroc,
                  setter: (value) => roomSpaceBloc.add(OfficeSpaceChanged(
                    (state.officeSpaces ?? RoomSpace()).copyWith(
                      cybroc: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.lobbiesAndOtherCommonAreas?.cybroc,
                  setter: (value) => roomSpaceBloc.add(LobbiesChanged(
                    (state.lobbiesAndOtherCommonAreas ?? RoomSpace()).copyWith(
                      cybroc: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.restroomsAndWashingFacilities?.cybroc,
                  setter: (value) => roomSpaceBloc.add(RestroomsChanged(
                    (state.restroomsAndWashingFacilities ?? RoomSpace())
                        .copyWith(
                      cybroc: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.kitchens?.cybroc,
                  setter: (value) => roomSpaceBloc.add(KitchensChanged(
                    (state.kitchens ?? RoomSpace()).copyWith(
                      cybroc: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.teachingAndTreatmentSpaces?.cybroc,
                  setter: (value) => roomSpaceBloc.add(TeachingSpacesChanged(
                    (state.teachingAndTreatmentSpaces ?? RoomSpace()).copyWith(
                      cybroc: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.storageAndWorkspaces?.cybroc,
                  setter: (value) => roomSpaceBloc.add(StorageChanged(
                    (state.storageAndWorkspaces ?? RoomSpace()).copyWith(
                      cybroc: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.otherSpaces?.cybroc,
                  setter: (value) => roomSpaceBloc.add(OtherSpacesChanged(
                    (state.otherSpaces ?? RoomSpace()).copyWith(
                      cybroc: value,
                    ),
                  )),
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state.totalCybrocArea,
                ),
                OutputCell(
                  getter: () => state.totalCybrocVolume,
                ),
                OutputCell(
                  getter: () => state.totalCybrocTons,
                ),
                RowCell(
                  initialValue: 'Lautapaneeli',
                ),
                InputCell(
                  initialValue: state.officeSpaces?.boardPanel,
                  setter: (value) => roomSpaceBloc.add(OfficeSpaceChanged(
                    (state.officeSpaces ?? RoomSpace()).copyWith(
                      boardPanel: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.lobbiesAndOtherCommonAreas?.boardPanel,
                  setter: (value) => roomSpaceBloc.add(LobbiesChanged(
                    (state.lobbiesAndOtherCommonAreas ?? RoomSpace()).copyWith(
                      boardPanel: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.restroomsAndWashingFacilities?.boardPanel,
                  setter: (value) => roomSpaceBloc.add(RestroomsChanged(
                    (state.restroomsAndWashingFacilities ?? RoomSpace())
                        .copyWith(
                      boardPanel: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.kitchens?.boardPanel,
                  setter: (value) => roomSpaceBloc.add(KitchensChanged(
                    (state.kitchens ?? RoomSpace()).copyWith(
                      boardPanel: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.teachingAndTreatmentSpaces?.boardPanel,
                  setter: (value) => roomSpaceBloc.add(TeachingSpacesChanged(
                    (state.teachingAndTreatmentSpaces ?? RoomSpace()).copyWith(
                      boardPanel: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.storageAndWorkspaces?.boardPanel,
                  setter: (value) => roomSpaceBloc.add(StorageChanged(
                    (state.storageAndWorkspaces ?? RoomSpace()).copyWith(
                      boardPanel: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.otherSpaces?.boardPanel,
                  setter: (value) => roomSpaceBloc.add(OtherSpacesChanged(
                    (state.otherSpaces ?? RoomSpace()).copyWith(
                      boardPanel: value,
                    ),
                  )),
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state.totalBoardPanelArea,
                ),
                OutputCell(
                  getter: () => state.totalBoardPanelVolume,
                ),
                OutputCell(
                  getter: () => state.totalBoardPanelTons,
                ),
                RowCell(
                  initialValue: 'Kaakeliseinä',
                ),
                InputCell(
                  initialValue: state.officeSpaces?.ceramicTileWalls,
                  setter: (value) => roomSpaceBloc.add(OfficeSpaceChanged(
                    (state.officeSpaces ?? RoomSpace()).copyWith(
                      ceramicTileWalls: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue:
                      state.lobbiesAndOtherCommonAreas?.ceramicTileWalls,
                  setter: (value) => roomSpaceBloc.add(LobbiesChanged(
                    (state.lobbiesAndOtherCommonAreas ?? RoomSpace()).copyWith(
                      ceramicTileWalls: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue:
                      state.restroomsAndWashingFacilities?.ceramicTileWalls,
                  setter: (value) => roomSpaceBloc.add(RestroomsChanged(
                    (state.restroomsAndWashingFacilities ?? RoomSpace())
                        .copyWith(
                      ceramicTileWalls: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.kitchens?.ceramicTileWalls,
                  setter: (value) => roomSpaceBloc.add(KitchensChanged(
                    (state.kitchens ?? RoomSpace()).copyWith(
                      ceramicTileWalls: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue:
                      state.teachingAndTreatmentSpaces?.ceramicTileWalls,
                  setter: (value) => roomSpaceBloc.add(TeachingSpacesChanged(
                    (state.teachingAndTreatmentSpaces ?? RoomSpace()).copyWith(
                      ceramicTileWalls: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.storageAndWorkspaces?.ceramicTileWalls,
                  setter: (value) => roomSpaceBloc.add(StorageChanged(
                    (state.storageAndWorkspaces ?? RoomSpace()).copyWith(
                      ceramicTileWalls: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.otherSpaces?.ceramicTileWalls,
                  setter: (value) => roomSpaceBloc.add(OtherSpacesChanged(
                    (state.otherSpaces ?? RoomSpace()).copyWith(
                      ceramicTileWalls: value,
                    ),
                  )),
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state.totalCeramicTileWallsArea,
                ),
                OutputCell(
                  getter: () => state.totalCeramicTileWallsVolume,
                ),
                OutputCell(
                  getter: () => state.totalCeramicTileWallsTons,
                ),
                RowCell(
                  initialValue: 'Maalattu rapattu tiiliseinä',
                ),
                InputCell(
                  initialValue: state.officeSpaces?.paintedPlasteredBrickWall,
                  setter: (value) => roomSpaceBloc.add(OfficeSpaceChanged(
                    (state.officeSpaces ?? RoomSpace()).copyWith(
                      paintedPlasteredBrickWall: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state
                      .lobbiesAndOtherCommonAreas?.paintedPlasteredBrickWall,
                  setter: (value) => roomSpaceBloc.add(LobbiesChanged(
                    (state.lobbiesAndOtherCommonAreas ?? RoomSpace()).copyWith(
                      paintedPlasteredBrickWall: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state
                      .restroomsAndWashingFacilities?.paintedPlasteredBrickWall,
                  setter: (value) => roomSpaceBloc.add(RestroomsChanged(
                    (state.restroomsAndWashingFacilities ?? RoomSpace())
                        .copyWith(
                      paintedPlasteredBrickWall: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.kitchens?.paintedPlasteredBrickWall,
                  setter: (value) => roomSpaceBloc.add(KitchensChanged(
                    (state.kitchens ?? RoomSpace()).copyWith(
                      paintedPlasteredBrickWall: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state
                      .teachingAndTreatmentSpaces?.paintedPlasteredBrickWall,
                  setter: (value) => roomSpaceBloc.add(TeachingSpacesChanged(
                    (state.teachingAndTreatmentSpaces ?? RoomSpace()).copyWith(
                      paintedPlasteredBrickWall: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue:
                      state.storageAndWorkspaces?.paintedPlasteredBrickWall,
                  setter: (value) => roomSpaceBloc.add(StorageChanged(
                    (state.storageAndWorkspaces ?? RoomSpace()).copyWith(
                      paintedPlasteredBrickWall: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.otherSpaces?.paintedPlasteredBrickWall,
                  setter: (value) => roomSpaceBloc.add(OtherSpacesChanged(
                    (state.otherSpaces ?? RoomSpace()).copyWith(
                      paintedPlasteredBrickWall: value,
                    ),
                  )),
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state.totalPaintedPlasteredBrickWallArea,
                ),
                OutputCell(
                  getter: () => state.totalPaintedPlasteredBrickWallVolume,
                ),
                OutputCell(
                  getter: () => state.totalBoardPanelTons,
                ),
                RowCell(
                  initialValue: 'Muovimatto',
                ),
                InputCell(
                  initialValue: state.officeSpaces?.plasticCarpet,
                  setter: (value) => roomSpaceBloc.add(OfficeSpaceChanged(
                    (state.officeSpaces ?? RoomSpace()).copyWith(
                      plasticCarpet: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.lobbiesAndOtherCommonAreas?.plasticCarpet,
                  setter: (value) => roomSpaceBloc.add(LobbiesChanged(
                    (state.lobbiesAndOtherCommonAreas ?? RoomSpace()).copyWith(
                      plasticCarpet: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue:
                      state.restroomsAndWashingFacilities?.plasticCarpet,
                  setter: (value) => roomSpaceBloc.add(RestroomsChanged(
                    (state.restroomsAndWashingFacilities ?? RoomSpace())
                        .copyWith(
                      plasticCarpet: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.kitchens?.plasticCarpet,
                  setter: (value) => roomSpaceBloc.add(KitchensChanged(
                    (state.kitchens ?? RoomSpace()).copyWith(
                      plasticCarpet: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.teachingAndTreatmentSpaces?.plasticCarpet,
                  setter: (value) => roomSpaceBloc.add(TeachingSpacesChanged(
                    (state.teachingAndTreatmentSpaces ?? RoomSpace()).copyWith(
                      plasticCarpet: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.storageAndWorkspaces?.plasticCarpet,
                  setter: (value) => roomSpaceBloc.add(StorageChanged(
                    (state.storageAndWorkspaces ?? RoomSpace()).copyWith(
                      plasticCarpet: value,
                    ),
                  )),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.otherSpaces?.plasticCarpet,
                  setter: (value) => roomSpaceBloc.add(OtherSpacesChanged(
                    (state.otherSpaces ?? RoomSpace()).copyWith(
                      plasticCarpet: value,
                    ),
                  )),
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state.totalPlasticCarpetArea,
                ),
                OutputCell(
                  getter: () => state.totalPlasticCarpetVolume,
                ),
                OutputCell(
                  getter: () => state.totalPlasticCarpetTons,
                ),
                RowCell(
                  initialValue: "Väliseinien rakenteet yhteensä (%)",
                ),
                OutputCell(
                  getter: () => state
                      .officeSpaces?.overallPartitionWallsStructuresInPercents,
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state
                      .lobbiesAndOtherCommonAreas?.overallPartitionWallsStructuresInPercents,
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state
                      .restroomsAndWashingFacilities?.overallPartitionWallsStructuresInPercents,
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state
                      .kitchens?.overallPartitionWallsStructuresInPercents,
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state
                      .teachingAndTreatmentSpaces?.overallPartitionWallsStructuresInPercents,
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state
                      .storageAndWorkspaces?.overallPartitionWallsStructuresInPercents,
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state
                      .otherSpaces?.overallPartitionWallsStructuresInPercents,
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state
                      .overallPartitionWallsStructuresInPercents,
                  percentage: true,
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
