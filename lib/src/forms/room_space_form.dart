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
                  getter: () =>
                      state.otherSpaces?.overallWallLengthLinearMeters, //fix
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
                  getter: () => state.otherSpaces?.overallWallArea, //fix
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
                RowCell(checkbox: true,
                checkboxTitle: 'Pinnoite sisältää asbestia',
                checkboxValue: state.surfaceMaterialCoatingContainsAsbestos,
                checkboxSetter: (value) => roomSpaceBloc.add(SurfaceMaterialCoatingChanged(value)),
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
                  initialValue: 'Kipsilevy (Cybroc)',
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
                  initialValue: 'Lautapaneeli',
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
                  initialValue: 'Kaakeliseinä',
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
                  initialValue: 'Maalattu rapattu tiiliseinä',
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
                  initialValue: 'Muovimatto',
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
                RowCell( initialValue: "Väliseinien rakenteet yhteensä (%)",)
              ],
            ),
          ],
        ),
      );
    });
  }
}
