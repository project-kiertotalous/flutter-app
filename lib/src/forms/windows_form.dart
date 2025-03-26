import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/src/data/empty_cell.dart';
import 'package:flutter_app/src/data/form_header.dart';
import 'package:flutter_app/src/data/row_cell.dart';

/// Windows and Window Walls UI Form
class WindowsForm extends StatelessWidget {
  const WindowsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // FormHeader outside of the LayoutGrid
        FormHeader(
          text: 'Ikkunoiden ja lasiseinien määrät',
        ),

        // The LayoutGrid containing the rows
        LayoutGrid(
          columnSizes: [
            300.px, // Column 1
            150.px, // Column 2
            150.px, // Column 3
            150.px, // Column 4
          ],
          rowSizes: [50.px, 50.px, 50.px, 50.px, 50.px, 50.px, 50.px], // 7 rows
          children: [
            // Row 1
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            // Row 2
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            // Row 3
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            // Row 4
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            // Row 5
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            // Row 6
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            // Row 7
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
          ],
        ),
      ],
    );
  }
}
