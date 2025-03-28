import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/total_building_dimensions_bloc.dart';
import 'package:flutter_app/src/bloc/excavation_area_bloc.dart';
import 'package:flutter_app/src/bloc/internal_wall_frames_and_surface_material_bloc.dart';
import 'package:flutter_app/src/bloc/floor_structures_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/src/bloc/intermediate_floors_bloc.dart';
import 'package:flutter_app/src/bloc/foundations_bloc.dart';
import 'package:flutter_app/src/bloc/cellar_bloc.dart';
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
                  create: (BuildContext context) =>
                      InternalWallFramesAndSurfaceMaterialBloc(),
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
      ),
    );
  }
}
