import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/empty_cell.dart';
import 'package:flutter_app/src/shared/grey_cell.dart';
import 'package:flutter_app/src/shared/header_cell.dart';
import 'package:flutter_app/src/shared/menu_cell.dart';
import 'package:flutter_app/src/sp-bloc/apartment_2room_bloc.dart';
import 'package:flutter_app/src/sp-bloc/apartment_3room_bloc.dart';
import 'package:flutter_app/src/sp-bloc/apartment_4room_bloc.dart';
import 'package:flutter_app/src/sp-bloc/apartment_bloc.dart';
import 'package:flutter_app/src/sp-bloc/apartment_event.dart';
import 'package:flutter_app/src/sp-bloc/apartment_size_bloc.dart';
import 'package:flutter_app/src/sp-bloc/apartment_size_event.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_app/src/sp-bloc/spApartments_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class SPApartmentForm extends StatelessWidget {
  const SPApartmentForm({super.key});

  //Surface material type
  List<DropdownMenuItem<SurfaceMaterial?>> surfaceMaterialToList() {
    return [
      DropdownMenuItem<SurfaceMaterial?>(
        value: null,
        child: Text('Pintamateriaali'),
      ),
      ...SurfaceMaterial.values.map((type) {
        return DropdownMenuItem<SurfaceMaterial?>(
          value: type,
          child: Text(surfaceMaterialToString(type)),
        );
      })
    ];
  }

  String surfaceMaterialToString(SurfaceMaterial type) {
    switch (type) {
      case SurfaceMaterial.plasterBoard:
        return 'Kipsilevy';
      case SurfaceMaterial.chipboard:
        return 'Lastulevy';
      case SurfaceMaterial.woodenPanel:
        return 'Lautapaneeli';
    }
  }

  //Floor material type
  List<DropdownMenuItem<FloorMaterial?>> floorMaterialToList() {
    return [
      DropdownMenuItem<FloorMaterial?>(
        value: null,
        child: Text('Lattiamateriaali'),
      ),
      ...FloorMaterial.values.map((type) {
        return DropdownMenuItem<FloorMaterial?>(
          value: type,
          child: Text(floorMaterialToString(type)),
        );
      })
    ];
  }

  String floorMaterialToString(FloorMaterial type) {
    switch (type) {
      case FloorMaterial.parquet:
        return 'Parketti';
      case FloorMaterial.plasticCarpet:
        return 'Muovimatto';
      case FloorMaterial.woodPanel:
        return 'Puupaneeli';
    }
  }

  //Kitchen wall material type
  List<DropdownMenuItem<KitchenWallMaterial?>> kitchenWallMaterialToList() {
    return [
      DropdownMenuItem<KitchenWallMaterial?>(
        value: null,
        child: Text('Keittiön seinämateriaali'),
      ),
      ...KitchenWallMaterial.values.map((type) {
        return DropdownMenuItem<KitchenWallMaterial?>(
          value: type,
          child: Text(kitchenWallMaterialToString(type)),
        );
      })
    ];
  }

  String kitchenWallMaterialToString(KitchenWallMaterial type) {
    switch (type) {
      case KitchenWallMaterial.ceramicTile:
        return 'Kaakeli';
      case KitchenWallMaterial.plasticCarpet:
        return 'Muovimatto';
    }
  }

  //Bathroom wall material type
  List<DropdownMenuItem<BathroomWallMaterial?>> bathroomWallMaterialToList() {
    return [
      DropdownMenuItem<BathroomWallMaterial?>(
        value: null,
        child: Text('Pesutilojen seinämateriaali'),
      ),
      ...BathroomWallMaterial.values.map((type) {
        return DropdownMenuItem<BathroomWallMaterial?>(
          value: type,
          child: Text(bathroomWallMaterialToString(type)),
        );
      })
    ];
  }

  String bathroomWallMaterialToString(BathroomWallMaterial type) {
    switch (type) {
      case BathroomWallMaterial.ceramicTile:
        return 'Kaakeli';
      case BathroomWallMaterial.plasticCarpet:
        return 'Muovimatto';
    }
  }

  //Bathroom floor material type
  List<DropdownMenuItem<BathroomFloorMaterial?>> bathroomFloorMaterialToList() {
    return [
      DropdownMenuItem<BathroomFloorMaterial?>(
        value: null,
        child: Text('Pesutilojen lattiamateriaali'),
      ),
      ...BathroomFloorMaterial.values.map((type) {
        return DropdownMenuItem<BathroomFloorMaterial?>(
          value: type,
          child: Text(bathroomFloorMaterialToString(type)),
        );
      })
    ];
  }

  String bathroomFloorMaterialToString(BathroomFloorMaterial type) {
    switch (type) {
      case BathroomFloorMaterial.ceramicTile:
        return 'Kaakeli';
      case BathroomFloorMaterial.plasticCarpet:
        return 'Muovimatto';
    }
  }

  @override
  Widget build(BuildContext context) {
    final oneRoomBloc = context.read<ApartmentBloc>();
    final twoRoomsBloc = context.read<Apartment2RoomBloc>();
    final threeRoomsBloc = context.read<Apartment3RoomBloc>();
    final fourRoomsBloc = context.read<Apartment4RoomBloc>();
    return BlocBuilder<SPApartmentsBloc, SPApartmentsState>(
      builder: (context, state) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          FormHeader(text: 'Huoneistot'),
          LayoutGrid(
            columnSizes: [
              300.px,
              100.px,
              100.px,
              100.px,
              100.px,
              150.px,
              100.px,
              220.px,
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
              62.px,
            ],
            children: [
              RowCell(
                initialValue: 'Huoneiston Koko',
              ),
              HeaderCell(initialValue: '1h'),
              HeaderCell(initialValue: '2h'),
              HeaderCell(initialValue: '3h'),
              HeaderCell(initialValue: '4h'),
              HeaderCell(initialValue: 'Pinta-ala yhteensä (m2)'),
              HeaderCell(initialValue: 'Tonneja yhteensä'),
              EmptyCell(),
              RowCell(
                initialValue: 'kpl/talo',
              ),
              InputCell(
                initialValue: state.apartmentSize.oneRoom?.pcsPerHouse,
                integer: true,
                setter: (value) => oneRoomBloc.add(
                  PcsPerHouseChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.apartmentSize.twoRooms?.pcsPerHouse,
                integer: true,
                setter: (value) => twoRoomsBloc.add(
                  PcsPerHouseChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.apartmentSize.threeRooms?.pcsPerHouse,
                integer: true,
                setter: (value) => threeRoomsBloc.add(
                  PcsPerHouseChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.apartmentSize.fourRooms?.pcsPerHouse,
                integer: true,
                setter: (value) => fourRoomsBloc.add(
                  PcsPerHouseChanged(value),
                ),
              ),
              GreyCell(),
              GreyCell(),
              EmptyCell(),
              RowCell(initialValue: 'Lattiapinta-ala/huoneisto (m2)'),
              InputCell(
                initialValue:
                    state.apartmentSize.oneRoom?.floorAreaPerApartment,
                setter: (value) => oneRoomBloc.add(
                  FloorAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.twoRooms?.floorAreaPerApartment,
                setter: (value) => twoRoomsBloc.add(
                  FloorAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.threeRooms?.floorAreaPerApartment,
                setter: (value) => threeRoomsBloc.add(
                  FloorAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.fourRooms?.floorAreaPerApartment,
                setter: (value) => fourRoomsBloc.add(
                  FloorAreaPerApartmentChanged(value),
                ),
              ),
              OutputCell(getter: () => state.apartmentSize.totalFloorArea),
              GreyCell(),
              EmptyCell(),
              RowCell(initialValue: 'Sisäseinät/huoneisto (jm)'),
              InputCell(
                initialValue: state
                    .apartmentSize.oneRoom?.innerWallsPerApartmentLinearMeters,
                setter: (value) => oneRoomBloc.add(
                  InnerWallsPerApartmentLinearMetersChanged(value),
                ),
              ),
              InputCell(
                initialValue: state
                    .apartmentSize.twoRooms?.innerWallsPerApartmentLinearMeters,
                setter: (value) => twoRoomsBloc.add(
                  InnerWallsPerApartmentLinearMetersChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.apartmentSize.threeRooms
                    ?.innerWallsPerApartmentLinearMeters,
                setter: (value) => threeRoomsBloc.add(
                  InnerWallsPerApartmentLinearMetersChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.apartmentSize.fourRooms
                    ?.innerWallsPerApartmentLinearMeters,
                setter: (value) => fourRoomsBloc.add(
                  InnerWallsPerApartmentLinearMetersChanged(value),
                ),
              ),
              GreyCell(),
              GreyCell(),
              EmptyCell(),
              RowCell(initialValue: 'Seinän korkeus (m)'),
              InputCell(
                initialValue: state.apartmentSize.oneRoom?.wallHeight,
                setter: (value) => oneRoomBloc.add(
                  WallHeightChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.apartmentSize.twoRooms?.wallHeight,
                setter: (value) => twoRoomsBloc.add(
                  WallHeightChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.apartmentSize.threeRooms?.wallHeight,
                setter: (value) => threeRoomsBloc.add(
                  WallHeightChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.apartmentSize.fourRooms?.wallHeight,
                setter: (value) => fourRoomsBloc.add(
                  WallHeightChanged(value),
                ),
              ),
              GreyCell(),
              GreyCell(),
              EmptyCell(),
              RowCell(initialValue: 'Seinäpinta-ala/Huoneisto (m2)'),
              OutputCell(
                  getter: () =>
                      state.apartmentSize.oneRoom?.wallAreaPerApartment),
              OutputCell(
                  getter: () =>
                      state.apartmentSize.twoRooms?.wallAreaPerApartment),
              OutputCell(
                  getter: () =>
                      state.apartmentSize.threeRooms?.wallAreaPerApartment),
              OutputCell(
                  getter: () =>
                      state.apartmentSize.fourRooms?.wallAreaPerApartment),
              OutputCell(getter: () => state.apartmentSize.totalWallArea),
              GreyCell(),
              EmptyCell(),
              RowCell(initialValue: 'Runkopuuta/huoneisto (tonnia)'),
              OutputCell(
                  getter: () =>
                      state.apartmentSize.oneRoom?.trunkWoodPerApartmentTons),
              OutputCell(
                  getter: () =>
                      state.apartmentSize.twoRooms?.trunkWoodPerApartmentTons),
              OutputCell(
                  getter: () => state
                      .apartmentSize.threeRooms?.trunkWoodPerApartmentTons),
              OutputCell(
                  getter: () =>
                      state.apartmentSize.fourRooms?.trunkWoodPerApartmentTons),
              GreyCell(),
              OutputCell(getter: () => state.apartmentSize.totalTrunkWoodTons),
              EmptyCell(),
              RowCell(initialValue: 'Pintamateriaalia/huoneisto (tonnia)'),
              OutputCell(
                  getter: () => state
                      .apartmentSize.oneRoomSurfaceMaterialPerApartmentTons),
              OutputCell(
                  getter: () => state
                      .apartmentSize.twoRoomsSurfaceMaterialPerApartmentTons),
              OutputCell(
                  getter: () => state
                      .apartmentSize.threeRoomsSurfaceMaterialPerApartmentTons),
              OutputCell(
                  getter: () => state
                      .apartmentSize.fourRoomsSurfaceMaterialPerApartmentTons),
              GreyCell(),
              OutputCell(
                  getter: () => state.apartmentSize.totalSurfaceMaterialTons),
              MenuCell<SurfaceMaterial?>(
                setter: (value) {
                  // change applies to all apartments
                  oneRoomBloc.add(SurfaceMaterialChanged(value));
                  twoRoomsBloc.add(SurfaceMaterialChanged(value));
                  threeRoomsBloc.add(SurfaceMaterialChanged(value));
                  fourRoomsBloc.add(SurfaceMaterialChanged(value));
                },
                initialValue: state.apartmentSize.oneRoom?.surfaceMaterial,
                items: surfaceMaterialToList(),
              ),
              RowCell(
                initialValue: 'Lattiamateriaali/huoneisto (tonnia)',
              ),
              OutputCell(
                getter: () =>
                    state.apartmentSize.oneRoomFloorMaterialPerApartmentTons,
              ),
              OutputCell(
                getter: () =>
                    state.apartmentSize.twoRoomsFloorMaterialPerApartmentTons,
              ),
              OutputCell(
                getter: () =>
                    state.apartmentSize.threeRoomsFloorMaterialPerApartmentTons,
              ),
              OutputCell(
                getter: () =>
                    state.apartmentSize.fourRoomsFloorMaterialPerApartmentTons,
              ),
              GreyCell(),
              OutputCell(
                  getter: () => state.apartmentSize.totalFloorMaterialTons),
              MenuCell<FloorMaterial?>(
                initialValue: state.apartmentSize.oneRoom?.floorMaterial,
                items: floorMaterialToList(),
                setter: (value) {
                  oneRoomBloc.add(FloorMaterialChanged(value));
                  twoRoomsBloc.add(FloorMaterialChanged(value));
                  threeRoomsBloc.add(FloorMaterialChanged(value));
                  fourRoomsBloc.add(FloorMaterialChanged(value));
                },
              ),
              RowCell(
                initialValue: 'Keittiön seinämateriaali/huoneisto (m2)',
              ),
              InputCell(
                initialValue: state
                    .apartmentSize.oneRoom?.kitchenWallMaterialAreaPerApartment,
                setter: (value) => oneRoomBloc
                    .add(KitchenWallMaterialAreaPerApartmentChanged(value)),
              ),
              InputCell(
                initialValue: state.apartmentSize.twoRooms
                    ?.kitchenWallMaterialAreaPerApartment,
                setter: (value) => twoRoomsBloc
                    .add(KitchenWallMaterialAreaPerApartmentChanged(value)),
              ),
              InputCell(
                initialValue: state.apartmentSize.threeRooms
                    ?.kitchenWallMaterialAreaPerApartment,
                setter: (value) => threeRoomsBloc
                    .add(KitchenWallMaterialAreaPerApartmentChanged(value)),
              ),
              InputCell(
                initialValue: state.apartmentSize.fourRooms
                    ?.kitchenWallMaterialAreaPerApartment,
                setter: (value) => fourRoomsBloc
                    .add(KitchenWallMaterialAreaPerApartmentChanged(value)),
              ),
              OutputCell(
                  getter: () => state.apartmentSize.totalkitchenWallArea),
              OutputCell(
                  getter: () => state.apartmentSize.totalkitchenWallTons),
              MenuCell<KitchenWallMaterial?>(
                initialValue: state.apartmentSize.oneRoom?.kitchenWallMaterial,
                items: kitchenWallMaterialToList(),
                setter: (value) {
                  oneRoomBloc.add(KitchenWallMaterialChanged(value));
                  twoRoomsBloc.add(KitchenWallMaterialChanged(value));
                  threeRoomsBloc.add(KitchenWallMaterialChanged(value));
                  fourRoomsBloc.add(KitchenWallMaterialChanged(value));
                },
              ),
              RowCell(
                initialValue: 'Keittiön kaapistot (jm)',
                checkbox: true,
                checkboxTitle: 'Kierrätettäviä',
                checkboxValue:
                    state.apartmentSize.oneRoom?.areKitchenClosetsRecyclable,
                checkboxSetter: (value) {
                  oneRoomBloc.add(AreKitchenClosetsRecyclableChanged(value));
                  twoRoomsBloc.add(AreKitchenClosetsRecyclableChanged(value));
                  threeRoomsBloc.add(AreKitchenClosetsRecyclableChanged(value));
                  fourRoomsBloc.add(AreKitchenClosetsRecyclableChanged(value));
                },
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.oneRoom?.kitchenClosetsInLinearMeter,
                setter: (value) => oneRoomBloc.add(
                  KitchenClosetsInLinearMeterChanged(value),
                ),
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.twoRooms?.kitchenClosetsInLinearMeter,
                setter: (value) => twoRoomsBloc.add(
                  KitchenClosetsInLinearMeterChanged(value),
                ),
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.threeRooms?.kitchenClosetsInLinearMeter,
                setter: (value) => threeRoomsBloc.add(
                  KitchenClosetsInLinearMeterChanged(value),
                ),
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.fourRooms?.kitchenClosetsInLinearMeter,
                setter: (value) => fourRoomsBloc.add(
                  KitchenClosetsInLinearMeterChanged(value),
                ),
              ),
              GreyCell(),
              OutputCell(
                getter: () => state.apartmentSize.totalkitchenClosetTons,
              ),
              EmptyCell(),
              RowCell(
                initialValue: 'Vaatekomerot (jm)',
                checkbox: true,
                checkboxTitle: 'Kierrätettäviä',
                checkboxSetter: (value) {
                  oneRoomBloc.add(AreDressingClosetsRecyclableChanged(value));
                  twoRoomsBloc.add(AreDressingClosetsRecyclableChanged(value));
                  threeRoomsBloc
                      .add(AreDressingClosetsRecyclableChanged(value));
                  fourRoomsBloc.add(AreDressingClosetsRecyclableChanged(value));
                },
                checkboxValue:
                    state.apartmentSize.oneRoom?.areDressingClosetsRecyclable,
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.oneRoom?.dressingClosetsInLinearMeter,
                setter: (value) => oneRoomBloc.add(
                  DressingClosetsInLinearMeterChanged(value),
                ),
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.twoRooms?.dressingClosetsInLinearMeter,
                setter: (value) => twoRoomsBloc.add(
                  DressingClosetsInLinearMeterChanged(value),
                ),
              ),
              InputCell(
                initialValue: state
                    .apartmentSize.threeRooms?.dressingClosetsInLinearMeter,
                setter: (value) => threeRoomsBloc.add(
                  DressingClosetsInLinearMeterChanged(value),
                ),
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.fourRooms?.dressingClosetsInLinearMeter,
                setter: (value) => fourRoomsBloc.add(
                  DressingClosetsInLinearMeterChanged(value),
                ),
              ),
              GreyCell(),
              OutputCell(
                getter: () => state.apartmentSize.totaldressingClosetTons,
              ),
              EmptyCell(),
              RowCell(
                initialValue: 'WC- ja pesutilojen seinät/huoneisto (m2)',
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.oneRoom?.bathroomWallAreaPerApartment,
                setter: (value) => oneRoomBloc.add(
                  BathroomWallAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.twoRooms?.bathroomWallAreaPerApartment,
                setter: (value) => twoRoomsBloc.add(
                  BathroomWallAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue: state
                    .apartmentSize.threeRooms?.bathroomWallAreaPerApartment,
                setter: (value) => threeRoomsBloc.add(
                  BathroomWallAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.fourRooms?.bathroomWallAreaPerApartment,
                setter: (value) => fourRoomsBloc.add(
                  BathroomWallAreaPerApartmentChanged(value),
                ),
              ),
              OutputCell(
                  getter: () => state.apartmentSize.totalBathroomWallArea),
              OutputCell(
                  getter: () => state.apartmentSize.totalBathroomWallTons),
              MenuCell<BathroomWallMaterial?>(
                initialValue: state.apartmentSize.oneRoom?.bathroomWallMaterial,
                items: bathroomWallMaterialToList(),
                setter: (value) {
                  oneRoomBloc.add(BathroomWallMaterialChanged(value));
                  twoRoomsBloc.add(BathroomWallMaterialChanged(value));
                  threeRoomsBloc.add(BathroomWallMaterialChanged(value));
                  fourRoomsBloc.add(BathroomWallMaterialChanged(value));
                },
              ),
              RowCell(
                initialValue: 'WC- ja pesutilojen lattiat/huoneisto (m2)',
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.oneRoom?.bathroomFloorAreaPerApartment,
                setter: (value) => oneRoomBloc.add(
                  BathroomFloorAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.twoRooms?.bathroomFloorAreaPerApartment,
                setter: (value) => twoRoomsBloc.add(
                  BathroomFloorAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue: state
                    .apartmentSize.threeRooms?.bathroomFloorAreaPerApartment,
                setter: (value) => threeRoomsBloc.add(
                  BathroomFloorAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue: state
                    .apartmentSize.fourRooms?.bathroomFloorAreaPerApartment,
                setter: (value) => fourRoomsBloc.add(
                  BathroomFloorAreaPerApartmentChanged(value),
                ),
              ),
              OutputCell(
                  getter: () => state.apartmentSize.totalBathroomFloorArea),
              OutputCell(
                  getter: () => state.apartmentSize.totalBathroomFloorTons),
              MenuCell<BathroomFloorMaterial?>(
                initialValue:
                    state.apartmentSize.oneRoom?.bathroomFloorMaterial,
                items: bathroomFloorMaterialToList(),
                setter: (value) {
                  oneRoomBloc.add(BathroomFloorMaterialChanged(value));
                  twoRoomsBloc.add(BathroomFloorMaterialChanged(value));
                  threeRoomsBloc.add(BathroomFloorMaterialChanged(value));
                  fourRoomsBloc.add(BathroomFloorMaterialChanged(value));
                },
              ),
              RowCell(initialValue: 'Saunan panelointi/huoneisto (m2)'),
              InputCell(
                initialValue:
                    state.apartmentSize.oneRoom?.saunaPanelingAreaPerApartment,
                setter: (value) => oneRoomBloc.add(
                  SaunaPanelingAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.twoRooms?.saunaPanelingAreaPerApartment,
                setter: (value) => twoRoomsBloc.add(
                  SaunaPanelingAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue: state
                    .apartmentSize.threeRooms?.saunaPanelingAreaPerApartment,
                setter: (value) => threeRoomsBloc.add(
                  SaunaPanelingAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue: state
                    .apartmentSize.fourRooms?.saunaPanelingAreaPerApartment,
                setter: (value) => fourRoomsBloc.add(
                  SaunaPanelingAreaPerApartmentChanged(value),
                ),
              ),
              OutputCell(
                  getter: () => state.apartmentSize.totalSaunaPanelingArea),
              OutputCell(
                  getter: () => state.apartmentSize.totalSaunaPanelingTons),
              EmptyCell(),
            ],
          ),
          FormHeader(
              text: 'Huoneistokohtaiset keittiö-, WC- ja saunakalusteet'),
          LayoutGrid(columnSizes: [
            150.px,
            150.px,
            150.px,
            150.px,
            150.px,
            150.px,
            150.px
          ], rowSizes: [
            50.px,
            50.px,
            50.px
          ], children: [
            RowCell(
              checkbox: true,
              checkboxTitle: 'Kierrätettäviä',
              checkboxValue: state.apartmentSize.oneRoom?.isFurnitureRecyclable,
              checkboxSetter: (value) {
                oneRoomBloc.add(IsFurnitureRecyclableChanged(value));
                twoRoomsBloc.add(IsFurnitureRecyclableChanged(value));
                threeRoomsBloc.add(IsFurnitureRecyclableChanged(value));
                fourRoomsBloc.add(IsFurnitureRecyclableChanged(value));
              },
            ),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            RowCell(
              checkbox: true,
              checkboxTitle: 'WC-istuin',
              checkboxValue: state.apartmentSize.oneRoom?.toiletSeat,
              checkboxSetter: (value) {
                oneRoomBloc.add(ToiletSeatChanged(value));
                twoRoomsBloc.add(ToiletSeatChanged(value));
                threeRoomsBloc.add(ToiletSeatChanged(value));
                fourRoomsBloc.add(ToiletSeatChanged(value));
              },
            ),
            RowCell(
              checkbox: true,
              checkboxTitle: 'Posliiniallas',
              checkboxValue: state.apartmentSize.oneRoom?.ceramicSink,
              checkboxSetter: (value) {
                oneRoomBloc.add(CeramicSinkChanged(value));
                twoRoomsBloc.add(CeramicSinkChanged(value));
                threeRoomsBloc.add(CeramicSinkChanged(value));
                fourRoomsBloc.add(CeramicSinkChanged(value));
              },
            ),
            RowCell(
              checkbox: true,
              checkboxTitle: 'Jääkaappi',
              checkboxValue: state.apartmentSize.oneRoom?.refrigerator,
              checkboxSetter: (value) {
                oneRoomBloc.add(RefrigeratorChanged(value));
                twoRoomsBloc.add(RefrigeratorChanged(value));
                threeRoomsBloc.add(RefrigeratorChanged(value));
                fourRoomsBloc.add(RefrigeratorChanged(value));
              },
            ),
            RowCell(
              checkbox: true,
              checkboxTitle: 'Sähköliesi',
              checkboxValue: state.apartmentSize.oneRoom?.electricStove,
              checkboxSetter: (value) {
                oneRoomBloc.add(ElectricStoveChanged(value));
                twoRoomsBloc.add(ElectricStoveChanged(value));
                threeRoomsBloc.add(ElectricStoveChanged(value));
                fourRoomsBloc.add(ElectricStoveChanged(value));
              },
            ),
            RowCell(
              checkbox: true,
              checkboxTitle: 'Teräspöytä',
              checkboxValue: state.apartmentSize.oneRoom?.steelTable,
              checkboxSetter: (value) {
                oneRoomBloc.add(SteelTableChanged(value));
                twoRoomsBloc.add(SteelTableChanged(value));
                threeRoomsBloc.add(SteelTableChanged(value));
                fourRoomsBloc.add(SteelTableChanged(value));
              },
            ),
            RowCell(
              checkbox: true,
              checkboxTitle: 'Vesivaraaja',
              checkboxValue: state.apartmentSize.oneRoom?.waterHeater,
              checkboxSetter: (value) {
                oneRoomBloc.add(WaterHeaterChanged(value));
                twoRoomsBloc.add(WaterHeaterChanged(value));
                threeRoomsBloc.add(WaterHeaterChanged(value));
                fourRoomsBloc.add(WaterHeaterChanged(value));
              },
            ),
            RowCell(
              checkbox: true,
              checkboxTitle: 'Saunankiuas',
              checkboxValue: state.apartmentSize.oneRoom?.saunaStove,
              checkboxSetter: (value) {
                oneRoomBloc.add(SaunaStoveChanged(value));
                twoRoomsBloc.add(SaunaStoveChanged(value));
                threeRoomsBloc.add(SaunaStoveChanged(value));
                fourRoomsBloc.add(SaunaStoveChanged(value));
              },
            ),
            RowCell(
              initialValue: 'Tonnia yhteensä',
            ),
            OutputCell(
                getter: () =>
                    state.apartmentSize.totalKitchenToiletOrSaunaFurnitureTons),
          ])
        ]);
      },
    );
  }
}
