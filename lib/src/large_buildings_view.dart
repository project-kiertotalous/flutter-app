import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/forms/cellar_form.dart';
import 'package:flutter_app/src/forms/exterior_wall_structures_form.dart';
import 'package:flutter_app/src/forms/fixed_furniture_form.dart';
import 'package:flutter_app/src/forms/fixtures_and_structures_form.dart';
import 'package:flutter_app/src/forms/floor_structures_form.dart';
import 'package:flutter_app/src/forms/foundation_type_and_floors_form.dart';
import 'package:flutter_app/src/forms/hvac_and_electrical_installations_form.dart';
import 'package:flutter_app/src/forms/indoor_outdoor_form.dart';
import 'package:flutter_app/src/forms/intermediate_floors_form.dart';
import 'package:flutter_app/src/forms/large_properties_disposal_materials_and_hazardous_waste_form.dart';
import 'package:flutter_app/src/forms/room_space_form.dart';
import 'package:flutter_app/src/forms/internal_wall_frames_and_surface_materials_form.dart';
import 'package:flutter_app/src/forms/large_properties_recyclable_form.dart';
import 'package:flutter_app/src/forms/large_property_basic_information_form.dart';
import 'package:flutter_app/src/forms/machines_and_equipments_form.dart';
import 'package:flutter_app/src/forms/removable_grounds_form.dart';
import 'package:flutter_app/src/forms/reusable_and_recyclable_materials_form.dart';
import 'package:flutter_app/src/forms/roofs_form.dart';
import 'package:flutter_app/src/forms/total_building_dimensions_form.dart';
import 'package:flutter_app/src/forms/total_building_frame_form.dart';
import 'package:flutter_app/src/forms/windows_form.dart';
import 'package:flutter_app/src/forms/yard_and_protective_structures.dart';
import 'package:flutter_app/src/navigation_buttons.dart';
import 'package:flutter_app/src/tab_view.dart';

import 'data/cancel_dialog.dart';

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
    Tab(text: "LVI, & sähkö & muut varusteet"),
    Tab(text: "Purkumateriaalit"),
  ];

  List<Widget> outerSheathForms() => [
        LargePropertyBasicInformationForm(),
        TotalBuildingDimensionsForm(),
        RemovableGroundsForm(),
        FoundationTypeAndFloorsForm(),
        CellarForm(),
        IntermediateFloorsForm(),
        FloorStructuresForm(),
        RoofsForm(),
        TotalBuildingFrameForm(),
        OuterWallsForm(),
        const SizedBox(height: 20),
        NavigationButtons(),
      ];

  List<Widget> partitionsAndWindowsForms() => [
        InternalWallFramesAndSurfaceMaterialsForm(),
        RoomSpaceForm(),
        IndoorOutdoorForm(),
        WindowsForm(),
        FixedFurnitureForm(),
        const SizedBox(height: 20),
        NavigationButtons(),
      ];

  List<Widget> lviForms() => [
        HVACAndElectricalInstallationsForm(),
        MachinesAndEquipmentsForm(),
        FixturesAndStructuresForm(),
        YardAndProtectiveStructuresForm(),
        const SizedBox(height: 20),
        NavigationButtons(),
      ];

  List<Widget> demolitionMaterialsForms() => [
        ReusableAndRecyclableMaterialsForm(),
        RecyclableMaterialsForm(),
        LargePropertiesDisposalMaterialsAndHazardousWasteForm(),
      ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: DefaultTabControllerListener(
        onTabChanged: (int index) {
          debugPrint('tab changed: $index');
        },
        child: PopScope(
          canPop: false,
          onPopInvokedWithResult: (_, __) => showDialog<String>(
              context: context, builder: (_) => CancelDialog()),
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
                ),
                TabView(forms: lviForms),
                TabView(
                  forms: demolitionMaterialsForms,
                  width: 1600,
                ),
              ],
            ),
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
