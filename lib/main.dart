import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/internal_wall_frame_bloc.dart';
import 'package:flutter_app/src/bloc/door_bloc.dart';
import 'package:flutter_app/src/bloc/exterior_wall_structures_bloc.dart';
import 'package:flutter_app/src/bloc/fixtures_and_structures_bloc.dart';
import 'package:flutter_app/src/bloc/hvac_and_electrical_installations_bloc.dart';
import 'package:flutter_app/src/bloc/total_building_dimensions_bloc.dart';
import 'package:flutter_app/src/bloc/excavation_area_bloc.dart';
import 'package:flutter_app/src/bloc/total_building_frame_bloc.dart';
import 'package:flutter_app/src/bloc/yard_and_protective_structures_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/src/bloc/fixed_furniture_bloc.dart';
import 'package:flutter_app/src/bloc/windows_bloc.dart';
import 'package:flutter_app/src/bloc/total_roofs_bloc.dart';
import 'package:flutter_app/src/bloc/internal_wall_frames_and_surface_material_bloc.dart';
import 'package:flutter_app/src/bloc/floor_structures_bloc.dart';
import 'package:flutter_app/src/bloc/intermediate_floors_bloc.dart';
import 'package:flutter_app/src/bloc/foundations_bloc.dart';
import 'package:flutter_app/src/bloc/cellar_bloc.dart';
import 'package:flutter_app/src/bloc/machines_and_equipments_bloc.dart';
import 'package:flutter_app/src/home_view.dart';
import 'package:flutter_app/src/large_buildings_view.dart';
import 'package:flutter_app/src/smaller_builds_view.dart';

void main() {
  runApp(MyApp());
}

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return MaterialApp(
      // The appTitle is defined in .arb files found in the localization
      // directory.
      title: 'Placeholder title',

      initialRoute: '/',
      routes: {
        '/': (context) => const HomeView(),
        '/large_buildings': (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (BuildContext context) =>
                      TotalBuildingDimensionsBloc(),
                ),
                BlocProvider(
                  create: (BuildContext context) => ExcavationAreaBloc(),
                ),
                BlocProvider(
                  create: (BuildContext context) => FloorStructuresBloc(),
                ),
                BlocProvider(
                  create: (BuildContext context) => FoundationsBloc(),
                ),
                BlocProvider(
                    create: (BuildContext context) => ExcavationAreaBloc()),
                BlocProvider(create: (BuildContext context) => CellarBloc()),
                BlocProvider(
                  create: (BuildContext context) => IntermediateFloorsBloc(
                    context.read<TotalBuildingDimensionsBloc>(),
                    context.read<FoundationsBloc>(),
                  ),
                ),
                BlocProvider(
                  create: (BuildContext context) => CellarBloc(),
                ),
                BlocProvider(
                  create: (BuildContext context) => TotalBuildingFrameBloc(
                    context.read<FoundationsBloc>(),
                  ),
                ),
                BlocProvider(
                  create: (BuildContext context) => TotalRoofsBloc(),
                ),
                BlocProvider(
                  create: (BuildContext context) =>
                      InternalWallFramesAndSurfaceMaterialBloc(),
                ),
                BlocProvider(create: (BuildContext context) => RoomSpaceBloc()),
                BlocProvider(
                  create: (BuildContext context) => DoorBloc(),
                ),
                BlocProvider(
                  create: (BuildContext context) => WindowsBloc(),
                ),
                BlocProvider(
                  create: (BuildContext context) => FixedFurnitureBloc(),
                ),
                BlocProvider(
                  create: (BuildContext context) =>
                      DoubleLoadBearingBrickWallBloc(),
                ),
                BlocProvider(
                  create: (BuildContext context) =>
                      HvacAndElectricalInstallationsBloc(),
                ),
                BlocProvider(
                  create: (BuildContext context) => MachinesAndEquipmentsBloc(),
                ),
                BlocProvider(
                  create: (BuildContext context) => FixturesAndStructuresBloc(),
                ),
                BlocProvider(
                  create: (BuildContext context) =>
                      YardAndProtectiveStructuresBloc(),
                ),
              ],
              child: LargeBuildingsView(),
            ),
        '/smaller_buildings': (context) => SmallerBuildingsView(),
      },
      // onGenerateTitle: (BuildContext context) =>
      //     AppLocalizations.of(context)!.appTitle,

      // Define a light and dark color theme. Then, read the user's
      // preferred ThemeMode (light, dark, or system default) from the
      // SettingsController to display the correct theme.
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF54be84),
          // primary: Colors.black,
          // secondary: Colors.blue,
        ),
      ),
    );
  }
}
