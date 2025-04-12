import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-forms/bituminous_mixtures_coal_tar_products_form.dart';
import 'package:flutter_app/src/lp-forms/cellar_form.dart';
import 'package:flutter_app/src/lp-forms/exterior_wall_structures_form.dart';
import 'package:flutter_app/src/lp-forms/fixed_furniture_form.dart';
import 'package:flutter_app/src/lp-forms/fixtures_and_structures_form.dart';
import 'package:flutter_app/src/lp-forms/floor_structures_form.dart';
import 'package:flutter_app/src/lp-forms/foundation_type_and_floors_form.dart';
import 'package:flutter_app/src/lp-forms/gypsym_based_building_materials_form.dart';
import 'package:flutter_app/src/lp-forms/hvac_and_electrical_installations_form.dart';
import 'package:flutter_app/src/lp-forms/indoor_outdoor_form.dart';
import 'package:flutter_app/src/lp-forms/insulation_and_asbestos_containing_materials_form.dart';
import 'package:flutter_app/src/lp-forms/intermediate_floors_form.dart';
import 'package:flutter_app/src/lp-forms/large_properties_demolition_waste_and_costs_form.dart';
import 'package:flutter_app/src/lp-forms/large_properties_disposal_materials_and_hazardous_waste_form.dart';
import 'package:flutter_app/src/lp-forms/metals_and_alloys_form.dart';
import 'package:flutter_app/src/lp-forms/other_materials_form.dart';
import 'package:flutter_app/src/lp-forms/room_space_form.dart';
import 'package:flutter_app/src/lp-forms/internal_wall_frames_and_surface_materials_form.dart';
import 'package:flutter_app/src/lp-forms/large_properties_recyclable_form.dart';
import 'package:flutter_app/src/lp-forms/large_property_basic_information_form.dart';
import 'package:flutter_app/src/lp-forms/machines_and_equipments_form.dart';
import 'package:flutter_app/src/lp-forms/removable_grounds_form.dart';
import 'package:flutter_app/src/lp-forms/reusable_and_recyclable_materials_form.dart';
import 'package:flutter_app/src/lp-forms/roofs_form.dart';
import 'package:flutter_app/src/lp-forms/room_space_surface_material_percentages_form.dart';
import 'package:flutter_app/src/lp-forms/soil_aggregates_dredging_materials_form.dart';
import 'package:flutter_app/src/lp-forms/total_building_dimensions_form.dart';
import 'package:flutter_app/src/lp-forms/total_building_frame_form.dart';
import 'package:flutter_app/src/lp-forms/concrete_bricks_tiles_ceramics_form.dart';
import 'package:flutter_app/src/lp-forms/windows_form.dart';
import 'package:flutter_app/src/lp-forms/wood_glass_plastics_form.dart';
import 'package:flutter_app/src/lp-forms/yard_and_protective_structures.dart';
import 'package:flutter_app/src/shared/navigation_buttons.dart';
import 'package:flutter_app/src/tab_view.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'shared/cancel_dialog.dart';

/// This view is for estimating large buildings.
class LargePropertiesView extends StatefulWidget {
  const LargePropertiesView({super.key});

  @override
  State<LargePropertiesView> createState() => _LargeBuildingsViewState();
}

class _LargeBuildingsViewState extends State<LargePropertiesView>
    with TickerProviderStateMixin {
  static const List<Tab> tabs = [
    Tab(text: "Ulkovaippa"),
    Tab(text: "Väliseinät ja ikkunat"),
    Tab(text: "LVI, & sähkö & muut varusteet"),
    Tab(text: "Purkumateriaalit"),
    Tab(text: "Taulukko"),
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
        RoomSpaceSurfaceMaterialPercentagesForm(),
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
        DemolitionWasteAndCostForm(),
        const SizedBox(height: 20),
        NavigationButtons(),
      ];

  List<Widget> wasteLawDemolitionForms() => [
        ConcreteBricksTilesCeramicsForm(),
        WoodGlassPlasticsForm(),
        BituminousMixturesCoalTarProductsForm(),
        MetalsAndAlloysForm(),
        SoilAggregatesDredgingMaterialsForm(),
        InsulationAndAsbestosContainingMaterialsForm(),
        GypsumBasedBuildingMaterialsForm(),
        OtherMaterialsForm(),
        const SizedBox(height: 20),
        NavigationButtons(),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: () => _showExportOptions(context),
          icon: Icon(Icons.download),
          label: Text('Export the data'),
        )
      ];

   void _showExportOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.picture_as_pdf),
              title: Text('Export PDF'),
              onTap: () {
                Navigator.pop(context);
                _exportAsPDF();
              },
            ),
            ListTile(
              leading: Icon(Icons.grid_on),
              title: Text('Export Excel'),
              onTap: () {
                Navigator.pop(context);
                _exportAsExcel();
              },
            ),
            ListTile(
              leading: Icon(Icons.all_inclusive),
              title: Text('Export Both'),
              onTap: () {
                Navigator.pop(context);
                _exportAsPDF();
                _exportAsExcel();
              },
            ),
          ],
        );
      },
    );
  }

  void _exportAsPDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text(
              'This is a sample demolition report.',
              style: pw.TextStyle(fontSize: 24),
            ),
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  void _exportAsExcel() {
    print('Excel export triggered');
    // Implementation will be done here!!
  }

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
                TabView(forms: wasteLawDemolitionForms),
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
