import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/empty_cell.dart';
import 'package:flutter_app/src/shared/grey_cell.dart';
import 'package:flutter_app/src/shared/header_cell.dart';
import 'package:flutter_app/src/shared/menu_cell.dart';
import 'package:flutter_app/src/sp-bloc/apartment_size_bloc.dart';
import 'package:flutter_app/src/sp-bloc/apartment_size_event.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class SPApartmentForm extends StatelessWidget {
  const SPApartmentForm({super.key});

  @override
  Widget build(BuildContext context) {
    final apartmentBloc = context.read<SPApartmentSizeBloc>();
    return BlocBuilder<SPApartmentSizeBloc, ApartmentSize>(
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
                initialValue: state.oneRoom?.pcsPerHouse,
                setter: (value) => apartmentBloc.add(
                  OneRoomPcsPerHouseChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.twoRooms?.pcsPerHouse,
                setter: (value) => apartmentBloc.add(
                  TwoRoomsPcsPerHouseChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.threeRooms?.pcsPerHouse,
                setter: (value) => apartmentBloc.add(
                  ThreeRoomsPcsPerHouseChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.fourRooms?.pcsPerHouse,
                setter: (value) => apartmentBloc.add(
                  FourRoomsPcsPerHouseChanged(value),
                ),
              ),
              GreyCell(),
              GreyCell(),
              EmptyCell(),
              RowCell(initialValue: 'Lattiapinta-ala/huoneisto (m2)'),
              InputCell(
                initialValue: state.oneRoom?.floorAreaPerApartment,
                setter: (value) => apartmentBloc.add(
                  OneRoomFloorAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.twoRooms?.floorAreaPerApartment,
                setter: (value) => apartmentBloc.add(
                  TwoRoomsFloorAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.threeRooms?.floorAreaPerApartment,
                setter: (value) => apartmentBloc.add(
                  ThreeRoomsFloorAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.fourRooms?.floorAreaPerApartment,
                setter: (value) => apartmentBloc.add(
                  FourRoomsFloorAreaPerApartmentChanged(value),
                ),
              ),
              OutputCell(getter: () => state.totalFloorArea),
              GreyCell(),
              EmptyCell(),
              RowCell(initialValue: 'Sisäseinät/huoneisto (jm)'),
              InputCell(
                initialValue: state.oneRoom?.innerWallsPerApartmentLinearMeters,
                setter: (value) => apartmentBloc.add(
                  OneRoomInnerWallsPerApartmentLinearMetersChanged(value),
                ),
              ),
              InputCell(
                initialValue:
                    state.twoRooms?.innerWallsPerApartmentLinearMeters,
                setter: (value) => apartmentBloc.add(
                  TwoRoomsInnerWallsPerApartmentLinearMetersChanged(value),
                ),
              ),
              InputCell(
                initialValue:
                    state.threeRooms?.innerWallsPerApartmentLinearMeters,
                setter: (value) => apartmentBloc.add(
                  ThreeRoomsInnerWallsPerApartmentLinearMetersChanged(value),
                ),
              ),
              InputCell(
                initialValue:
                    state.fourRooms?.innerWallsPerApartmentLinearMeters,
                setter: (value) => apartmentBloc.add(
                  FourRoomsInnerWallsPerApartmentLinearMetersChanged(value),
                ),
              ),
              GreyCell(),
              GreyCell(),
              EmptyCell(),
              RowCell(initialValue: 'Seinän korkeus (m)'),
              InputCell(
                initialValue: state.oneRoom?.wallHeight,
                setter: (value) => apartmentBloc.add(
                  OneRoomWallHeightChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.twoRooms?.wallHeight,
                setter: (value) => apartmentBloc.add(
                  TwoRoomsWallHeightChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.threeRooms?.wallHeight,
                setter: (value) => apartmentBloc.add(
                  ThreeRoomsWallHeightChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.fourRooms?.wallHeight,
                setter: (value) => apartmentBloc.add(
                  FourRoomsWallHeightChanged(value),
                ),
              ),
              GreyCell(),
              GreyCell(),
              EmptyCell(),
              RowCell(initialValue: 'Seinäpinta-ala/Huoneisto (m2)'),
              OutputCell(getter: () => state.oneRoom?.wallAreaPerApartment),
              OutputCell(getter: () => state.twoRooms?.wallAreaPerApartment),
              OutputCell(getter: () => state.threeRooms?.wallAreaPerApartment),
              OutputCell(getter: () => state.fourRooms?.wallAreaPerApartment),
              OutputCell(getter: () => state.totalWallArea),
              GreyCell(),
              EmptyCell(),
              RowCell(initialValue: 'Runkopuuta/huoneisto (tonnia)'),
              OutputCell(
                  getter: () => state.oneRoom?.trunkWoodPerApartmentTons),
              OutputCell(
                  getter: () => state.twoRooms?.trunkWoodPerApartmentTons),
              OutputCell(
                  getter: () => state.threeRooms?.trunkWoodPerApartmentTons),
              OutputCell(
                  getter: () => state.fourRooms?.trunkWoodPerApartmentTons),
              GreyCell(),
              OutputCell(getter: () => state.totalTrunkWoodTons),
              EmptyCell(),
              RowCell(initialValue: 'Pintamateriaalia/huoneisto (tonnia)'),
              OutputCell(
                  getter: () => state.oneRoom?.surfaceMaterialPerApartmentTons),
              OutputCell(
                  getter: () =>
                      state.twoRooms?.surfaceMaterialPerApartmentTons),
              OutputCell(
                  getter: () =>
                      state.threeRooms?.surfaceMaterialPerApartmentTons),
              OutputCell(
                  getter: () =>
                      state.fourRooms?.surfaceMaterialPerApartmentTons),
              GreyCell(),
              OutputCell(getter: () => state.totalSurfaceMaterialTons),
              MenuCell<SurfaceMaterial?>(
                setter: (value) => apartmentBloc.add(
                  SurfaceMaterialChanged(value),
                ),
                initialValue: state.oneRoom?.surfaceMaterial ==
                            state.twoRooms?.surfaceMaterial &&
                        state.oneRoom?.surfaceMaterial ==
                            state.threeRooms?.surfaceMaterial &&
                        state.oneRoom?.surfaceMaterial ==
                            state.fourRooms?.surfaceMaterial
                    ? state.oneRoom?.surfaceMaterial
                    : null,
                items: surfaceMaterialToList(),
              ),
              RowCell(
                initialValue: 'Lattiamateriaali/huoneisto (tonnia)',
              ),
              OutputCell(
                  getter: () => state.oneRoom?.floorMaterialPerApartmentTons),
              OutputCell(
                  getter: () => state.twoRooms?.floorMaterialPerApartmentTons),
              OutputCell(
                  getter: () =>
                      state.threeRooms?.floorMaterialPerApartmentTons),
              OutputCell(
                  getter: () => state.fourRooms?.floorMaterialPerApartmentTons),
              GreyCell(),
              OutputCell(getter: () => state.totalFloorMaterialTons),
              MenuCell<FloorMaterial?>(
                setter: (value) => apartmentBloc.add(
                  FloorMaterialChanged(value),
                ),
                initialValue: null,
                items: floorMaterialToList(),
              ),
              RowCell(
                initialValue: 'Keittiön seinämateriaali/huoneisto (m2)',
              ),
              OutputCell(
                  getter: () =>
                      state.oneRoom?.kitchenWallMaterialAreaPerApartment),
              OutputCell(
                  getter: () =>
                      state.twoRooms?.kitchenWallMaterialAreaPerApartment),
              OutputCell(
                  getter: () =>
                      state.threeRooms?.kitchenWallMaterialAreaPerApartment),
              OutputCell(
                  getter: () =>
                      state.fourRooms?.kitchenWallMaterialAreaPerApartment),
              OutputCell(getter: () => state.totalkitchenWallArea),
              OutputCell(getter: () => state.totalkitchenWallTons),
              MenuCell<KitchenWallMaterial?>(
                setter: (value) => apartmentBloc.add(
                  KitchenWallMaterialChanged(value),
                ),
                initialValue: state.oneRoom?.kitchenWallMaterial ==
                            state.twoRooms?.kitchenWallMaterial &&
                        state.oneRoom?.kitchenWallMaterial ==
                            state.threeRooms?.kitchenWallMaterial &&
                        state.oneRoom?.kitchenWallMaterial ==
                            state.fourRooms?.kitchenWallMaterial
                    ? state.oneRoom?.kitchenWallMaterial
                    : null,
                items: kitchenWallMaterialToList(),
              ),
              RowCell(
                initialValue: 'Keittiön kaapistot (jm)',
                checkbox: true,
                checkboxTitle: 'Kierrätettäviä',
                checkboxSetter: () => null, //TODO sort this out
              ),
              InputCell(
                initialValue: state.oneRoom?.kitchenClosetsInLinearMeter,
                setter: (value) => apartmentBloc.add(
                  OneRoomKitchenClosetsInLinearMeterChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.twoRooms?.kitchenClosetsInLinearMeter,
                setter: (value) => apartmentBloc.add(
                  TwoRoomsKitchenClosetsInLinearMeterChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.threeRooms?.kitchenClosetsInLinearMeter,
                setter: (value) => apartmentBloc.add(
                  ThreeRoomsKitchenClosetsInLinearMeterChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.fourRooms?.kitchenClosetsInLinearMeter,
                setter: (value) => apartmentBloc.add(
                  FourRoomsKitchenClosetsInLinearMeterChanged(value),
                ),
              ),
              GreyCell(),
              OutputCell(
                getter: () => state.totalkitchenClosetTons,
              ),
              EmptyCell(),
              RowCell(
                initialValue: 'Vaatekomerot (jm)',
                checkbox: true,
                checkboxTitle: 'Kierrätettäviä',
                checkboxSetter: () => null, //TODO sort this out
              ),
              InputCell(
                initialValue: state.oneRoom?.dressingClosetsInLinearMeter,
                setter: (value) => apartmentBloc.add(
                  OneRoomDressingClosetsInLinearMeterChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.twoRooms?.dressingClosetsInLinearMeter,
                setter: (value) => apartmentBloc.add(
                  TwoRoomsDressingClosetsInLinearMeterChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.threeRooms?.dressingClosetsInLinearMeter,
                setter: (value) => apartmentBloc.add(
                  ThreeRoomsDressingClosetsInLinearMeterChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.fourRooms?.dressingClosetsInLinearMeter,
                setter: (value) => apartmentBloc.add(
                  FourRoomsDressingClosetsInLinearMeterChanged(value),
                ),
              ),
              GreyCell(),
              OutputCell(
                getter: () => state.totaldressingClosetTons,
              ),
              EmptyCell(),
              RowCell(
                initialValue: 'WC- ja pesutilojen seinät/huoneisto (m2)',
              ),
              InputCell(
                initialValue: state.oneRoom?.bathroomWallAreaPerApartment,
                setter: (value) => apartmentBloc.add(
                  OneRoomBathroomWallAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.twoRooms?.bathroomWallAreaPerApartment,
                setter: (value) => apartmentBloc.add(
                  TwoRoomsBathroomWallAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.threeRooms?.bathroomWallAreaPerApartment,
                setter: (value) => apartmentBloc.add(
                  ThreeRoomsBathroomWallAreaPerApartmentChanged(value),
                ),
              ),
              InputCell(
                initialValue: state.fourRooms?.bathroomWallAreaPerApartment,
                setter: (value) => apartmentBloc.add(
                  FourRoomsBathroomWallAreaPerApartmentChanged(value),
                ),
              ),
              OutputCell(getter: () => state.totalBathroomWallArea),
              OutputCell(getter: () => state.totalBathroomWallTons),
              MenuCell<BathroomWallMaterial?>(
                setter: (value) => apartmentBloc.add(
                  BathroomWallMaterialChanged(value),
                ),
                initialValue: state.oneRoom?.bathroomWallMaterial ==
                            state.twoRooms?.bathroomWallMaterial &&
                        state.oneRoom?.bathroomWallMaterial ==
                            state.threeRooms?.bathroomWallMaterial &&
                        state.oneRoom?.bathroomWallMaterial ==
                            state.fourRooms?.bathroomWallMaterial
                    ? state.oneRoom?.bathroomWallMaterial
                    : null,
                items: bathroomWallMaterialToList(),
              ),
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
