import 'package:flutter/material.dart';
import 'package:flutter_app/src/forms/fixed_furniture_form.dart';
import 'package:flutter_app/src/forms/internal_wall_frames_and_surface_materials_form.dart';
import 'package:flutter_app/src/forms/windows_form.dart';
import 'package:flutter_app/src/navigation_buttons.dart';

class PartitionsAndWindowsView extends StatelessWidget {
  const PartitionsAndWindowsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      scrollDirection: Axis.horizontal,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: 2200,
          child: ListView(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: InternalWallFramesAndSurfaceMaterialsForm(),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: WindowsForm(),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: FixedFurnitureForm(),
              ),
              const SizedBox(height: 20),
              Align(
                child: NavigationButtons(),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }
}
