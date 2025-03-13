import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FoundationsBloc()),
        BlocProvider(create: (context) => CellarBloc()),
      ],
      child: MaterialApp(
        title: 'Placeholder title',
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeView(),
          '/large_buildings': (context) => LargeBuildingsView(),
          '/smaller_buildings': (context) => SmallerBuildingsView(),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
