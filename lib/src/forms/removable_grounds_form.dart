import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/removable_grounds_data.dart';
import 'package:pluto_grid/pluto_grid.dart';

/// For Large Buildings: Ulkovaippa ja runkorakenteet
///
/// In Finnish: Poistettavat maa-ainekset, poistettava alue ja määrä
class RemovableGroundsForm extends StatefulWidget {
  const RemovableGroundsForm({super.key, required this.data});

  final RemovableGroundsData data;

  @override
  State<RemovableGroundsForm> createState() => _RemovableGroundsFormState();
}

class _RemovableGroundsFormState extends State<RemovableGroundsForm> {
  PlutoGridStateManager? stateManager;

  List<PlutoColumn> columns = [
    PlutoColumn(
      title: 'Poistettavat',
      field: 'text_field',
      type: PlutoColumnType.text(),
      readOnly: true,
      enableSorting: false,
      enableColumnDrag: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: 'Määrä',
      field: 'number_field',
      type: PlutoColumnType.number(
        format: '###.##',
      ),
      enableSorting: false,
      enableColumnDrag: false,
      enableContextMenu: false,
    ),
  ];

  late List<PlutoRow> rows = [
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Poistettavan alueen pinta-ala (m2)'),
        'number_field': PlutoCell(value: widget.data.groundSurfaceArea),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Poistettavan alueen syvyys (m)'),
        'number_field': PlutoCell(value: widget.data.groundDepth),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Poistettava määrä (m3)'),
        'number_field': PlutoCell(value: widget.data.removableAmount),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Poistettavan puhtaan maan osuus (%)'),
        'number_field': PlutoCell(value: widget.data.removableCleanGroundShare),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Puhdas maa (tonnia)'),
        'number_field': PlutoCell(value: widget.data.cleanGroundTons),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Saastunut maa (tonnia)'),
        'number_field': PlutoCell(value: widget.data.contaminatedGroundTons),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Saastunut maa (m3)'),
        'number_field':
            PlutoCell(value: widget.data.contaminatedGroundCubicMeters),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Asfaltti alue (m2)'),
        'number_field': PlutoCell(value: widget.data.asphaltSurfaceArea),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Asfaltti (tonnia)'),
        'number_field': PlutoCell(value: widget.data.asphaltTons),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Asfaltti (m3)'),
        'number_field': PlutoCell(value: widget.data.asphaltCubicMeters),
      },
    ),
  ];

  @override
  initState() {
    super.initState();
    print('RemovableGroundsForm has been created');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 600,
      padding: const EdgeInsets.all(30),
      child: PlutoGrid(
        columns: columns,
        rows: rows,
        onChanged: (PlutoGridOnChangedEvent event) {
          widget.data.updateValue(event.columnIdx, event.rowIdx, event.value);
          // ignore: avoid_print
          print(event);
        },
        onLoaded: (PlutoGridOnLoadedEvent event) {
          stateManager = event.stateManager;
          // ignore: avoid_print
          print(event);
        },
      ),
    );
  }
}
