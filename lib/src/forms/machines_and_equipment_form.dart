import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/form_header.dart';
import 'package:flutter_app/src/data/input_cell.dart';
import 'package:flutter_app/src/data/output_cell.dart';
import 'package:flutter_app/src/data/row_cell.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MachinesAndEquipmentForm extends StatelessWidget{
  const MachinesAndEquipmentForm({super.key});

  @override
  Widget build(BuildContext context) {
    final machinesAndEquipmentBloc =
        context.read<MachinesAndEquipmentBloc>();
        
}