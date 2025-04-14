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
              250.px,
              100.px,
              100.px,
              100.px,
              100.px,
              150.px,
              100.px,
              150.px,
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
              RowCell(initialValue: 'Pintamateriaali/huoneisto (tonnia)'),
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
                initialValue: state.oneRoom?.surfaceMaterial,
                items: surfaceMaterialToList(),
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
}
