import 'package:flutter/material.dart';
import 'package:flutter_app/src/forms/basic_information_form.dart';
import 'package:flutter_app/src/forms/cellar_form.dart';
import 'package:flutter_app/src/forms/exterior_wall_structures_form.dart';
import 'package:flutter_app/src/forms/fixed_furniture_form.dart';
import 'package:flutter_app/src/forms/floor_structures_form.dart';
import 'package:flutter_app/src/forms/foundation_type_and_floors_form.dart';
import 'package:flutter_app/src/forms/hvac_and_electrical_installations_form.dart';
import 'package:flutter_app/src/forms/indoor_outdoor_form.dart';
import 'package:flutter_app/src/forms/intermediate_floors_form.dart';
import 'package:flutter_app/src/forms/internal_wall_frames_and_surface_materials_form.dart';
import 'package:flutter_app/src/forms/removable_grounds_form.dart';
import 'package:flutter_app/src/forms/roofs_form.dart';
import 'package:flutter_app/src/forms/total_building_dimensions_form.dart';
import 'package:flutter_app/src/forms/windows_form.dart';
import 'package:flutter_app/src/navigation_buttons.dart';
import 'package:flutter_app/src/tab_view.dart';

/// This view is for estimating large buildings.
class LargeBuildingsView extends StatefulWidget {
  const LargeBuildingsView({super.key});

  @override
  State<LargeBuildingsView> createState() => _LargeBuildingsViewState();
}

class _LargeBuildingsViewState extends State<LargeBuildingsView>
    with TickerProviderStateMixin {
  static const List<Tab> tabs = [
    Tab(text: "Ulkovaippa"),
    Tab(text: "Väliseinät ja ikkunat"),
    Tab(text: "LVI, & sähkö & muut varusteet")
  ];

  List<Widget> outerSheathForms() => [
        BasicInformationForm(),
        TotalBuildingDimensionsForm(),
        RemovableGroundsForm(),
        FoundationTypeAndFloorsForm(),
        CellarForm(),
        RoofsForm(),
        FloorStructuresForm(),
        IntermediateFloorsForm(),
        OuterWallsForm(),
        const SizedBox(height: 20),
        NavigationButtons(),
      ];

  List<Widget> partitionsAndWindowsForms() => [
        InternalWallFramesAndSurfaceMaterialsForm(),
        IndoorOutdoorForm(),
        WindowsForm(),
        FixedFurnitureForm(),
        const SizedBox(height: 20),
        NavigationButtons(),
        const SizedBox(height: 30),
      ];

  List<Widget> lviForms() => [
        HVACAndElectricalInstallationsForm(),
      ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: DefaultTabControllerListener(
        onTabChanged: (int index) {
          debugPrint('tab changed: $index');
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text('Suuret rakennukset'),
            bottom: TabBar(
              // controller: _tabController,
              tabs: tabs,
            ),
          ),
          // body: RemovableGroundsForm(data: removableGroundsData),
          body: TabBarView(
            children: [
              TabView(forms: outerSheathForms),
              TabView(
                forms: partitionsAndWindowsForms,
                width: 1200,
              ),
              TabView(forms: lviForms),
            ],
          ),
        ),
      ),
    );
  }
}

class DefaultTabControllerListener extends StatefulWidget {
  const DefaultTabControllerListener(
      {required this.onTabChanged, required this.child, super.key});

  final ValueChanged<int> onTabChanged;

  final Widget child;

  @override
  State<DefaultTabControllerListener> createState() =>
      _DefaultTabControllerListenerState();
}

class _DefaultTabControllerListenerState
    extends State<DefaultTabControllerListener> {
  TabController? _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final TabController? defaultTabController =
        DefaultTabController.maybeOf(context);

    assert(() {
      if (defaultTabController == null) {
        throw FlutterError(
          'No DefaultTabController for ${widget.runtimeType}.\n'
          'When creating a ${widget.runtimeType}, you must ensure that there '
          'is a DefaultTabController above the ${widget.runtimeType}.',
        );
      }
      return true;
    }());

    if (defaultTabController != _controller) {
      _controller?.removeListener(_listener);
      _controller = defaultTabController;
      _controller?.addListener(_listener);
    }
  }

  void _listener() {
    final TabController? controller = _controller;

    if (controller == null || controller.indexIsChanging) {
      return;
    }

    widget.onTabChanged(controller.index);
  }

  @override
  void dispose() {
    _controller?.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
