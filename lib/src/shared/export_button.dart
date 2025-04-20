import 'package:flutter/material.dart';

class ExportButton extends StatelessWidget {
  final VoidCallback onExportPDF;
  final VoidCallback onExportExcel;

  const ExportButton({
    super.key,
    required this.onExportPDF,
    required this.onExportExcel,
  });

  void _showExportOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.picture_as_pdf),
              title: Text('Vieda PDF'),
              onTap: () {
                Navigator.pop(context);
                onExportPDF();
              },
            ),
            ListTile(
              leading: Icon(Icons.grid_on),
              title: Text('Vieda Excelia'),
              onTap: () {
                Navigator.pop(context);
                onExportExcel();
              },
            ),
            ListTile(
              leading: Icon(Icons.all_inclusive),
              title: Text('Vieda Molemmat'),
              onTap: () {
                Navigator.pop(context);
                onExportPDF();
                onExportExcel();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton.icon(
        icon: Icon(Icons.download),
        label: Text('Tallenna'), 
        onPressed: () => _showExportOptions(context),
      ),
    );
  }
}
