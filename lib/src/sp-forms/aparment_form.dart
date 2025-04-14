import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/header_cell.dart';
import 'package:flutter_app/src/sp-bloc/apartment_bloc.dart';
import 'package:flutter_app/src/sp-bloc/apartment_event.dart';
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
    final apartmentBloc = context.read<SPApartmentBloc>();
    return BlocBuilder<SPApartmentBloc, Apartment>(
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
              RowCell(
                initialValue: 'kpl/talo',
              ),
              InputCell(initialValue: state.pcsPerHouse,
              setter: (value) => apartmentBloc.add(
                PcsPerHouseChanged(value),
              ),),
                InputCell(initialValue: state.pcsPerHouse,
              setter: (value) => apartmentBloc.add(
                PcsPerHouseChanged(value),
              ),),
                InputCell(initialValue: state.pcsPerHouse,
              setter: (value) => apartmentBloc.add(
                PcsPerHouseChanged(value),
              ),),
                InputCell(initialValue: state.pcsPerHouse,
              setter: (value) => apartmentBloc.add(
                PcsPerHouseChanged(value),
              ),),
              OutputCell(getter: () => state.pcsPerHouse),
              OutputCell(getter: () => state.pcsPerHouse),

            ],
          )
        ]);
      },
    );
  }
}
