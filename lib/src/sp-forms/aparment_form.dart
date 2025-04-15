import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/empty_cell.dart';
import 'package:flutter_app/src/shared/grey_cell.dart';
import 'package:flutter_app/src/shared/header_cell.dart';
import 'package:flutter_app/src/shared/menu_cell.dart';
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

  @override
  Widget build(BuildContext context) {
    final apartmentSizeBloc = context.read<ApartmentSizeBloc>();
    final apartmentBloc = context.read<ApartmentBloc>();
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
              210.px,
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
                setter: (value) => apartmentSizeBloc.add(
                  OneRoomPcsPerHouseChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.apartmentSize.twoRooms?.pcsPerHouse,
                setter: (value) => apartmentSizeBloc.add(
                  TwoRoomsPcsPerHouseChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.apartmentSize.threeRooms?.pcsPerHouse,
                setter: (value) => apartmentSizeBloc.add(
                  ThreeRoomsPcsPerHouseChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.apartmentSize.fourRooms?.pcsPerHouse,
                setter: (value) => apartmentSizeBloc.add(
                  FourRoomsPcsPerHouseChanged(value),
                ),
              ),
              GreyCell(),
              GreyCell(),
              EmptyCell(),
              RowCell(initialValue: 'Lattiapinta-ala/huoneisto (m2)'),
              InputCell(
                initialValue:
                    state.apartmentSize.oneRoom?.floorAreaPerApartment,
                setter: (value) => apartmentSizeBloc.add(
                  OneRoomFloorAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.twoRooms?.floorAreaPerApartment,
                setter: (value) => apartmentSizeBloc.add(
                  TwoRoomsFloorAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.threeRooms?.floorAreaPerApartment,
                setter: (value) => apartmentSizeBloc.add(
                  ThreeRoomsFloorAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.fourRooms?.floorAreaPerApartment,
                setter: (value) => apartmentSizeBloc.add(
                  FourRoomsFloorAreaPerApartmentChanged(value),
                ),
              ),
              OutputCell(getter: () => state.apartmentSize.totalFloorArea),
              GreyCell(),
              EmptyCell(),
              RowCell(initialValue: 'Sisäseinät/huoneisto (jm)'),
              InputCell(
                initialValue: state
                    .apartmentSize.oneRoom?.innerWallsPerApartmentLinearMeters,
                setter: (value) => apartmentSizeBloc.add(
                  OneRoomInnerWallsPerApartmentLinearMetersChanged(value),
                ),
              ),
              InputCell(
                initialValue: state
                    .apartmentSize.twoRooms?.innerWallsPerApartmentLinearMeters,
                setter: (value) => apartmentSizeBloc.add(
                  TwoRoomsInnerWallsPerApartmentLinearMetersChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.apartmentSize.threeRooms
                    ?.innerWallsPerApartmentLinearMeters,
                setter: (value) => apartmentSizeBloc.add(
                  ThreeRoomsInnerWallsPerApartmentLinearMetersChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.apartmentSize.fourRooms
                    ?.innerWallsPerApartmentLinearMeters,
                setter: (value) => apartmentSizeBloc.add(
                  FourRoomsInnerWallsPerApartmentLinearMetersChanged(value),
                ),
              ),
              GreyCell(),
              GreyCell(),
              EmptyCell(),
              RowCell(initialValue: 'Seinän korkeus (m)'),
              InputCell(
                initialValue: state.apartmentSize.oneRoom?.wallHeight,
                setter: (value) => apartmentSizeBloc.add(
                  OneRoomWallHeightChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.apartmentSize.twoRooms?.wallHeight,
                setter: (value) => apartmentSizeBloc.add(
                  TwoRoomsWallHeightChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.apartmentSize.threeRooms?.wallHeight,
                setter: (value) => apartmentSizeBloc.add(
                  ThreeRoomsWallHeightChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.apartmentSize.fourRooms?.wallHeight,
                setter: (value) => apartmentSizeBloc.add(
                  FourRoomsWallHeightChanged(value),
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
                      .apartmentSize.oneRoom?.surfaceMaterialPerApartmentTons),
              OutputCell(
                  getter: () => state
                      .apartmentSize.twoRooms?.surfaceMaterialPerApartmentTons),
              OutputCell(
                  getter: () => state.apartmentSize.threeRooms
                      ?.surfaceMaterialPerApartmentTons),
              OutputCell(
                  getter: () => state.apartmentSize.fourRooms
                      ?.surfaceMaterialPerApartmentTons),
              GreyCell(),
              OutputCell(
                  getter: () => state.apartmentSize.totalSurfaceMaterialTons),
              MenuCell<SurfaceMaterial?>(
                setter: (value) =>
                    apartmentBloc.add(SurfaceMaterialChanged(value)),
                initialValue: state.apartment.surfaceMaterial,
                items: surfaceMaterialToList(),
              ),
              RowCell(
                initialValue: 'Lattiamateriaali/huoneisto (tonnia)',
              ),
              OutputCell(
                  getter: () => state
                      .apartmentSize.oneRoom?.floorMaterialPerApartmentTons),
              OutputCell(
                  getter: () => state
                      .apartmentSize.twoRooms?.floorMaterialPerApartmentTons),
              OutputCell(
                  getter: () => state
                      .apartmentSize.threeRooms?.floorMaterialPerApartmentTons),
              OutputCell(
                  getter: () => state
                      .apartmentSize.fourRooms?.floorMaterialPerApartmentTons),
              GreyCell(),
              OutputCell(
                  getter: () => state.apartmentSize.totalFloorMaterialTons),
              MenuCell<FloorMaterial?>(
                setter: (value) => apartmentBloc.add(
                  FloorMaterialChanged(value)),
                  initialValue: state.apartment.floorMaterial,
                  items: floorMaterialToList(),
                ),
              RowCell(
                initialValue: 'Keittiön seinämateriaali/huoneisto (m2)',
              ),
              OutputCell(
                  getter: () => state.apartmentSize.oneRoom
                      ?.kitchenWallMaterialAreaPerApartment),
              OutputCell(
                  getter: () => state.apartmentSize.twoRooms
                      ?.kitchenWallMaterialAreaPerApartment),
              OutputCell(
                  getter: () => state.apartmentSize.threeRooms
                      ?.kitchenWallMaterialAreaPerApartment),
              OutputCell(
                  getter: () => state.apartmentSize.fourRooms
                      ?.kitchenWallMaterialAreaPerApartment),
              OutputCell(
                  getter: () => state.apartmentSize.totalkitchenWallArea),
              OutputCell(
                  getter: () => state.apartmentSize.totalkitchenWallTons),
              MenuCell<KitchenWallMaterial?>(
                setter: (value) => apartmentBloc.add(
                  KitchenWallMaterialChanged(value),
                ),
                initialValue: state.apartment.kitchenWallMaterial,
                items: kitchenWallMaterialToList(),
              ),
              RowCell(
                initialValue: 'Keittiön kaapistot (jm)',
                checkbox: true,
                checkboxTitle: 'Kierrätettäviä',
                checkboxSetter: () => null, //TODO sort this out
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.oneRoom?.kitchenClosetsInLinearMeter,
                setter: (value) => apartmentSizeBloc.add(
                  OneRoomKitchenClosetsInLinearMeterChanged(value),
                ),
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.twoRooms?.kitchenClosetsInLinearMeter,
                setter: (value) => apartmentSizeBloc.add(
                  TwoRoomsKitchenClosetsInLinearMeterChanged(value),
                ),
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.threeRooms?.kitchenClosetsInLinearMeter,
                setter: (value) => apartmentSizeBloc.add(
                  ThreeRoomsKitchenClosetsInLinearMeterChanged(value),
                ),
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.fourRooms?.kitchenClosetsInLinearMeter,
                setter: (value) => apartmentSizeBloc.add(
                  FourRoomsKitchenClosetsInLinearMeterChanged(value),
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
                checkboxSetter: () =>
                    state.apartment.areDressingClosetsRecyclable,
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.oneRoom?.dressingClosetsInLinearMeter,
                setter: (value) => apartmentSizeBloc.add(
                  OneRoomDressingClosetsInLinearMeterChanged(value),
                ),
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.twoRooms?.dressingClosetsInLinearMeter,
                setter: (value) => apartmentSizeBloc.add(
                  TwoRoomsDressingClosetsInLinearMeterChanged(value),
                ),
              ),
              InputCell(
                initialValue: state
                    .apartmentSize.threeRooms?.dressingClosetsInLinearMeter,
                setter: (value) => apartmentSizeBloc.add(
                  ThreeRoomsDressingClosetsInLinearMeterChanged(value),
                ),
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.fourRooms?.dressingClosetsInLinearMeter,
                setter: (value) => apartmentSizeBloc.add(
                  FourRoomsDressingClosetsInLinearMeterChanged(value),
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
                setter: (value) => apartmentSizeBloc.add(
                  OneRoomBathroomWallAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.twoRooms?.bathroomWallAreaPerApartment,
                setter: (value) => apartmentSizeBloc.add(
                  TwoRoomsBathroomWallAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue: state
                    .apartmentSize.threeRooms?.bathroomWallAreaPerApartment,
                setter: (value) => apartmentSizeBloc.add(
                  ThreeRoomsBathroomWallAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.fourRooms?.bathroomWallAreaPerApartment,
                setter: (value) => apartmentSizeBloc.add(
                  FourRoomsBathroomWallAreaPerApartmentChanged(value),
                ),
              ),
              OutputCell(
                  getter: () => state.apartmentSize.totalBathroomWallArea),
              OutputCell(
                  getter: () => state.apartmentSize.totalBathroomWallTons),
              MenuCell<BathroomWallMaterial?>(
                setter: (value) => apartmentBloc.add(
                  BathroomWallMaterialChanged(value),
                ),
                initialValue: state.apartment.bathroomWallMaterial,
                items: bathroomWallMaterialToList(),
              ),
              RowCell(
                initialValue: 'WC- ja pesutilojen lattiat/huoneisto (m2)',
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.oneRoom?.bathroomFloorAreaPerApartment,
                setter: (value) => apartmentSizeBloc.add(
                  OneRoomBathroomFloorAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue:
                    state.apartmentSize.twoRooms?.bathroomFloorAreaPerApartment,
                setter: (value) => apartmentSizeBloc.add(
                  TwoRoomsBathroomFloorAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue: state
                    .apartmentSize.threeRooms?.bathroomFloorAreaPerApartment,
                setter: (value) => apartmentSizeBloc.add(
                  ThreeRoomsBathroomFloorAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue: state
                    .apartmentSize.fourRooms?.bathroomFloorAreaPerApartment,
                setter: (value) => apartmentSizeBloc.add(
                  FourRoomsBathroomFloorAreaPerApartmentChanged(value),
                ),
              ),
              OutputCell(
                  getter: () => state.apartmentSize.totalBathroomFloorArea),
            ],
          )
        ]);
      },
    );
  }

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
}
