import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/building_dimensions_bloc.dart';
import 'package:flutter_app/src/lp-bloc/building_frame_bloc.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_recyclable_materials_bloc.dart';
import 'package:flutter_app/src/lp-bloc/cellar_bloc.dart';
import 'package:flutter_app/src/lp-bloc/door_bloc.dart';
import 'package:flutter_app/src/lp-bloc/excavation_area_bloc.dart';
import 'package:flutter_app/src/lp-bloc/exterior_wall_structures_bloc.dart';
import 'package:flutter_app/src/lp-bloc/fixed_furniture_bloc.dart';
import 'package:flutter_app/src/lp-bloc/fixtures_and_structures_bloc.dart';
import 'package:flutter_app/src/lp-bloc/floor_structures_bloc.dart';
import 'package:flutter_app/src/lp-bloc/foundations_bloc.dart';
import 'package:flutter_app/src/lp-bloc/hvac_and_electrical_installations_bloc.dart';
import 'package:flutter_app/src/lp-bloc/inner_doors_bloc.dart';
import 'package:flutter_app/src/lp-bloc/intermediate_floors_bloc.dart';
import 'package:flutter_app/src/lp-bloc/internal_wall_frames_and_surface_material_bloc.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_disposal_materials_and_hazardous_waste_bloc.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_total_disposal_materials_and_hazardous_waste_bloc.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_demolition_waste_and_costs_bloc.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_total_demolition_waste_and_costs_bloc.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_total_recyclable_materials_bloc.dart';
import 'package:flutter_app/src/lp-bloc/large_property_basic_info_bloc.dart';
import 'package:flutter_app/src/lp-bloc/machines_and_equipments_bloc.dart';
import 'package:flutter_app/src/lp-bloc/metals_and_alloys_bloc.dart';
import 'package:flutter_app/src/lp-bloc/other_materials_bloc.dart';
import 'package:flutter_app/src/lp-bloc/outer_doors_bloc.dart';
import 'package:flutter_app/src/lp-bloc/reusable_and_recyclable_materials_bloc.dart';
import 'package:flutter_app/src/lp-bloc/soil_aggregates_dredging_materials_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_building_dimensions_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_building_frame_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_metals_and_alloys_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_other_materials_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_reusable_and_recyclable_materials_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_roofs_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_soil_aggregates_dredging_materials_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_wood_glass_plastics_bloc.dart';
import 'package:flutter_app/src/lp-bloc/windows_bloc.dart';
import 'package:flutter_app/src/lp-bloc/wood_glass_plastics_bloc.dart';
import 'package:flutter_app/src/lp-bloc/yard_and_protective_structures_bloc.dart';
import 'package:flutter_app/src/sp-bloc/apartment_2room_bloc.dart';
import 'package:flutter_app/src/sp-bloc/apartment_3room_bloc.dart';
import 'package:flutter_app/src/sp-bloc/apartment_4room_bloc.dart';
import 'package:flutter_app/src/sp-bloc/carport_or_garage_bloc.dart';
import 'package:flutter_app/src/sp-bloc/apartment_size_bloc.dart';
import 'package:flutter_app/src/sp-bloc/apartment_bloc.dart';
import 'package:flutter_app/src/sp-bloc/electrical_installations_and_hvac_bloc.dart';
import 'package:flutter_app/src/sp-bloc/hall_doors_bloc.dart';
import 'package:flutter_app/src/sp-bloc/machinery_bloc.dart';
import 'package:flutter_app/src/sp-bloc/passage_doors_bloc.dart';
import 'package:flutter_app/src/sp-bloc/roofs_bloc.dart';
import 'package:flutter_app/src/sp-bloc/outer_doors_bloc.dart';
import 'package:flutter_app/src/sp-bloc/inner_doors_bloc.dart';
import 'package:flutter_app/src/sp-bloc/sp_door_bloc.dart';
import 'package:flutter_app/src/sp-bloc/sp_excavation_area_bloc.dart';
import 'package:flutter_app/src/sp-bloc/foundation_bloc.dart';
import 'package:flutter_app/src/sp-bloc/small_property_basic_info_bloc.dart';
import 'package:flutter_app/src/home_view.dart';
import 'package:flutter_app/src/large_properties_view.dart';
import 'package:flutter_app/src/smaller_properties_view.dart';
import 'package:flutter_app/src/sp-bloc/sp_windows_bloc.dart';
import 'package:flutter_app/src/sp-bloc/thermal_center_bloc.dart';
import 'package:flutter_app/src/sp-bloc/total_thermal_center_bloc.dart';
import 'package:flutter_app/src/sp-bloc/walls_bloc.dart';
import 'package:flutter_app/src/sp-bloc/yard_roof_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/src/lp-bloc/concrete_bricks_tiles_ceramics_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_concrete_bricks_tiles_ceramics_bloc.dart';
import 'package:flutter_app/src/lp-bloc/bituminous_mixtures_coal_tar_products_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_bituminous_mixtures_coal_tar_products_bloc.dart';
import 'package:flutter_app/src/lp-bloc/insulation_and_asbestos_containing_materials_bloc.dart';
import 'package:flutter_app/src/lp-bloc/gypsym_based_building_materials_bloc.dart';
import 'package:flutter_app/src/services/lp_data_service.dart';
import 'dart:async';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the data service and load data from file
  final dataService = DataService();
  final LargePropertiesRepository repository =
      await dataService.loadData() ?? LargePropertiesRepository();
  runApp(MyApp(dataService: dataService, repository: repository));
}

/// The Widget that configures your application.
class MyApp extends StatefulWidget {
  final DataService dataService;
  final LargePropertiesRepository repository;
  
  const MyApp({super.key,
    required this.dataService,
    required this.repository,
  });

    @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late final DataService _dataService;
  late final LargePropertiesRepository _repository;

  @override
  void initState() {
    super.initState();
    // Initialize the data service and repository
    _dataService = widget.dataService;
    _repository = widget.repository;

    // Add the observer to listen for app lifecycle changes
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // Remove the observer when the app is disposed
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Detect if the app is paused or detached and save the repository state
    if (state == AppLifecycleState.paused || state == AppLifecycleState.detached) {
      _saveRepositoryState();
    }
  }

  Future<void> _saveRepositoryState() async {
    try {
      await _dataService.saveData(_repository);
      debugPrint('Repository state saved successfully.');
    } catch (e) {
      debugPrint('Failed to save repository state: $e');
    }
  }

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
                  create: (BuildContext context) => FoundationsBloc(repository: _repository,
                    initialState: _repository.foundations,),
                ),
                BlocProvider(
                  create: (BuildContext context) => CellarBloc(repository: _repository,
                    initialState: _repository.cellar,),
                ),
                BlocProvider(
                  create: (BuildContext context) => BuildingFrameBloc(repository: _repository,
                    initialState: _repository.buildingFrame,),
                ),
                BlocProvider(
                  create: (BuildContext context) => BuildingDimensionsBloc(repository: _repository,
                    initialState: _repository.buildingDimensions,),
                ),
                BlocProvider(
                  create: (BuildContext context) => InnerDoorsBloc(repository: _repository,
                    initialState: _repository.innerDoors,),
                ),
                BlocProvider(
                  create: (BuildContext context) => OuterDoorsBloc(repository: _repository,
                    initialState: _repository.outerDoors,),
                ),
                BlocProvider(
                  create: (BuildContext context) =>
                      ReusableAndRecyclableMaterialsBloc(repository: _repository,
                    initialState: _repository.reusableAndRecyclableMaterials,),
                ),
                BlocProvider(
                  create: (BuildContext context) => RecyclableMaterialsBloc(repository: _repository,
                    initialState: _repository.recyclableComponentsAndFurniture,),
                ),
                BlocProvider(
                    create: (context) =>
                        DisposalMaterialsAndHazardousWasteBloc(repository: _repository,
                    initialState: _repository.disposalMaterialsAndHazardousWaste,)),
                BlocProvider(
                  create: (BuildContext context) =>
                      DemolitionWasteAndCostsBloc(repository: _repository,
                    initialState: _repository.demolitionWasteAndCosts,),
                ),
                BlocProvider(
                  create: (BuildContext context) =>
                      ConcreteBricksTilesCeramicsBloc(repository: _repository,
                    initialState: _repository.concreteBricksTilesCeramics,),
                ),
                BlocProvider(
                  create: (BuildContext context) => WoodGlassPlasticsBloc(repository: _repository,
                    initialState: _repository.woodGlassPlastics,),
                ),
                BlocProvider(
                  create: (BuildContext context) =>
                      BituminousMixturesCoalTarProductsBloc(repository: _repository,
                    initialState: _repository.bituminousMixturesCoalTarProducts,),
                ),
                BlocProvider(
                  create: (BuildContext context) => MetalsAndAlloysBloc(repository: _repository,
                    initialState: _repository.metalsAndAlloys,),
                ),
                BlocProvider(
                  create: (BuildContext context) =>
                      SoilAggregatesDredgingMaterialsBloc(repository: _repository,
                    initialState: _repository.soilAggregatesDredgingMaterials,),
                ),
                BlocProvider(
                  create: (BuildContext context) =>
                      InsulationAndAsbestosContainingMaterialsBloc(repository: _repository,
                    initialState: _repository.insulationAndAsbestosContainingMaterials,),
                ),
                BlocProvider(
                  create: (BuildContext context) =>
                      GypsumBasedBuildingMaterialsBloc(repository: _repository,
                    initialState: _repository.gypsumBasedBuildingMaterials,),
                ),
                BlocProvider(
                  create: (BuildContext context) => OtherMaterialsBloc(repository: _repository,
                    initialState: _repository.otherMaterials,),
                ),
                BlocProvider(
                  create: (BuildContext context) =>
                      LargePropertyBasicInfoBloc(repository: _repository,
                    initialState: _repository.largePropertyEvaluationInfo,),
                ),
                BlocProvider(
                  create: (BuildContext context) => TotalBuildingDimensionsBloc(
                    buildingDimensionsBloc:
                        context.read<BuildingDimensionsBloc>(),
                    cellarBloc: context.read<CellarBloc>(),
                    foundationsBloc: context.read<FoundationsBloc>(),
                    buildingFrameBloc: context.read<BuildingFrameBloc>(),
                  ),
                ),
                BlocProvider(
                  create: (BuildContext context) => ExcavationAreaBloc(repository: _repository,
                    initialState: _repository.excavationArea,),
                ),
                BlocProvider(
                  create: (BuildContext context) => FloorStructuresBloc(repository: _repository,
                    initialState: _repository.floorStructures,),
                ),
                BlocProvider(
                  create: (BuildContext context) => IntermediateFloorsBloc(
                    context.read<TotalBuildingDimensionsBloc>(),
                    context.read<FoundationsBloc>(),
                  ),
                ),
                BlocProvider(
                  create: (BuildContext context) => TotalBuildingFrameBloc(
                    context.read<FoundationsBloc>(),
                    context.read<BuildingFrameBloc>(),
                  ),
                ),
                BlocProvider(
                  create: (BuildContext context) => TotalRoofsBloc(
                    context.read<FoundationsBloc>(),
                  ),
                ),
                BlocProvider(
                  create: (BuildContext context) =>
                      InternalWallFramesAndSurfaceMaterialBloc(repository: _repository,
                    initialState: _repository.internalWallFramesAndSurfaceMaterial,),
                ),
                BlocProvider(
                  create: (BuildContext context) => DoorBloc(
                    context.read<InnerDoorsBloc>(),
                    context.read<OuterDoorsBloc>(),
                  ),
                ),
                BlocProvider(
                  create: (BuildContext context) => WindowsBloc(repository: _repository,
                    initialState: _repository.windows,),
                ),
                BlocProvider(
                  create: (BuildContext context) => FixedFurnitureBloc(repository: _repository,
                    initialState: _repository.fixedFurniture,),
                ),
                BlocProvider(
                  create: (BuildContext context) =>
                      DoubleLoadBearingBrickWallBloc(), //TODO check this!! 
                ),
                BlocProvider(
                  create: (BuildContext context) =>
                      HvacAndElectricalInstallationsBloc(repository: _repository,
                    initialState: _repository.hvacAndElectricalInstallations,),
                ),
                BlocProvider(
                  create: (BuildContext context) => MachinesAndEquipmentsBloc(repository: _repository,
                    initialState: _repository.machinesAndEquipments,),
                ),
                BlocProvider(
                  create: (BuildContext context) => FixturesAndStructuresBloc(repository: _repository,
                    initialState: _repository.fixturesAndStructures,),
                ),
                BlocProvider(
                  create: (BuildContext context) =>
                      YardAndProtectiveStructuresBloc(repository: _repository,
                    initialState: _repository.yardAndProtectiveStructures,),
                ),
                BlocProvider(
                  create: (BuildContext context) =>
                      TotalReusableAndRecyclableMaterialsBloc(
                    excavationAreaBloc: context.read<ExcavationAreaBloc>(),
                    foundationsBloc: context.read<FoundationsBloc>(),
                    totalIntermediateFloorsBloc:
                        context.read<IntermediateFloorsBloc>(),
                    totalRoofsBloc: context.read<TotalRoofsBloc>(),
                    totalBuildingFrameBloc:
                        context.read<TotalBuildingFrameBloc>(),
                    outerDoorsBloc: context.read<OuterDoorsBloc>(),
                    innerDoorsBloc: context.read<InnerDoorsBloc>(),
                    fixedFurnitureBloc: context.read<FixedFurnitureBloc>(),
                    cellarBloc: context.read<CellarBloc>(),
                    floorStructuresBloc: context.read<FloorStructuresBloc>(),
                    internalWallFramesAndSurfaceMaterialBloc: context
                        .read<InternalWallFramesAndSurfaceMaterialBloc>(),
                    windowsBloc: context.read<WindowsBloc>(),
                    hvacAndElectricalInstallationsBloc:
                        context.read<HvacAndElectricalInstallationsBloc>(),
                    machinesAndEquipmentsBloc:
                        context.read<MachinesAndEquipmentsBloc>(),
                    fixturesAndStructuresBloc:
                        context.read<FixturesAndStructuresBloc>(),
                    yardAndProtectiveStructuresBloc:
                        context.read<YardAndProtectiveStructuresBloc>(),
                    reusableAndRecyclableMaterialsBloc:
                        context.read<ReusableAndRecyclableMaterialsBloc>(),
                  ),
                ),
                BlocProvider(
                  create: (BuildContext context) =>
                      TotalRecyclableComponentsAndFurnitureBloc(
                    intermediateFloorsBloc:
                        context.read<IntermediateFloorsBloc>(),
                    totalRoofsBloc: context.read<TotalRoofsBloc>(),
                    totalBuildingFrameBloc:
                        context.read<TotalBuildingFrameBloc>(),
                    fixturesAndStructuresBloc:
                        context.read<FixturesAndStructuresBloc>(),
                    fixedFurnitureBloc: context.read<FixedFurnitureBloc>(),
                    outerDoorsBloc: context.read<OuterDoorsBloc>(),
                    innerDoorsBloc: context.read<InnerDoorsBloc>(),
                    windowsBloc: context.read<WindowsBloc>(),
                    machinesAndEquipmentsBloc:
                        context.read<MachinesAndEquipmentsBloc>(),
                    recyclableMaterialsBloc:
                        context.read<RecyclableMaterialsBloc>(),
                  ),
                ),
                BlocProvider(
                  create: (BuildContext context) =>
                      TotalDisposalMaterialsAndHazardousWasteBloc(
                    disposalMaterialsAndHazardousWasteBloc:
                        context.read<DisposalMaterialsAndHazardousWasteBloc>(),
                    excavationAreaBloc: context.read<ExcavationAreaBloc>(),
                    cellarBloc: context.read<CellarBloc>(),
                    fixedFurnitureBloc: context.read<FixedFurnitureBloc>(),
                    floorStructuresBloc: context.read<FloorStructuresBloc>(),
                    foundationsBloc: context.read<FoundationsBloc>(),
                    internalWallFramesAndSurfaceMaterialBloc: context
                        .read<InternalWallFramesAndSurfaceMaterialBloc>(),
                  ),
                ),
                BlocProvider(
                  create: (BuildContext context) =>
                      TotalDemolitionWasteAndCostsBloc(
                    demolitionWasteAndCostsBloc:
                        context.read<DemolitionWasteAndCostsBloc>(),
                    totalReusableAndRecyclableMaterialsBloc:
                        context.read<TotalReusableAndRecyclableMaterialsBloc>(),
                    totalRecyclableComponentsAndFurnitureBloc: context
                        .read<TotalRecyclableComponentsAndFurnitureBloc>(),
                    totalDisposalMaterialsAndHazardousWasteBloc: context
                        .read<TotalDisposalMaterialsAndHazardousWasteBloc>(),
                    totalBuildingDimensionsBloc:
                        context.read<TotalBuildingDimensionsBloc>(),
                  ),
                ),
                BlocProvider(
                  create: (BuildContext context) =>
                      TotalConcreteBricksTilesCeramicsBloc(
                    concreteBricksTilesCeramicsBloc:
                        context.read<ConcreteBricksTilesCeramicsBloc>(),
                    foundationsBloc: context.read<FoundationsBloc>(),
                    totalIntermediateFloorsBloc:
                        context.read<IntermediateFloorsBloc>(),
                    totalRoofsBloc: context.read<TotalRoofsBloc>(),
                    totalBuildingFrameBloc:
                        context.read<TotalBuildingFrameBloc>(),
                    internalWallFramesAndSurfaceMaterialBloc: context
                        .read<InternalWallFramesAndSurfaceMaterialBloc>(),
                    totalDemolitionWasteAndCostsBloc:
                        context.read<TotalDemolitionWasteAndCostsBloc>(),
                  ),
                ),
                BlocProvider(
                  create: (BuildContext context) => TotalWoodGlassPlasticsBloc(
                    woodGlassPlasticsBloc:
                        context.read<WoodGlassPlasticsBloc>(),
                    totalDemolitionWasteAndCostsBloc:
                        context.read<TotalDemolitionWasteAndCostsBloc>(),
                  ),
                ),
                BlocProvider(
                  create: (BuildContext context) =>
                      TotalBituminousMixturesCoalTarProductsBloc(
                    bituminousMixturesCoalTarProductsBloc:
                        context.read<BituminousMixturesCoalTarProductsBloc>(),
                    totalDemolitionWasteAndCostsBloc:
                        context.read<TotalDemolitionWasteAndCostsBloc>(),
                  ),
                ),
                BlocProvider(
                  create: (BuildContext context) => TotalMetalsAndAlloysBloc(
                    metalsAndAlloysBloc: context.read<MetalsAndAlloysBloc>(),
                    totalDemolitionWasteAndCostsBloc:
                        context.read<TotalDemolitionWasteAndCostsBloc>(),
                  ),
                ),
                BlocProvider(
                    create: (BuildContext context) =>
                        TotalSoilAggregatesDredgingMaterialsBloc(
                          soilAggregatesDredgingMaterialsBloc: context
                              .read<SoilAggregatesDredgingMaterialsBloc>(),
                          totalDemolitionWasteAndCostsBloc:
                              context.read<TotalDemolitionWasteAndCostsBloc>(),
                        )),
                BlocProvider(
                    create: (BuildContext context) => TotalOtherMaterialsBloc(
                          otherMaterialsBloc:
                              context.read<OtherMaterialsBloc>(),
                          totalDemolitionWasteAndCostsBloc:
                              context.read<TotalDemolitionWasteAndCostsBloc>(),
                        )),
              ],
              child: LargePropertiesView(),
            ),
        '/smaller_buildings': (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (BuildContext context) => HallDoorsBloc(),
                ),
                BlocProvider(
                  create: (BuildContext context) => PassageDoorsBloc(),
                ),
                BlocProvider(
                  create: (BuildContext context) => SpDoorBloc(
                    passageDoorsBloc: context.read<PassageDoorsBloc>(),
                    hallDoorsBloc: context.read<HallDoorsBloc>(),
                  ),
                ),
                BlocProvider(
                  create: (BuildContext context) => SpWindowsBloc(),
                ),
                BlocProvider(
                  create: (BuildContext context) => CarportOrGarageBloc(),
                ),
                BlocProvider(
                  create: (BuildContext context) =>
                      SmallPropertyBasicInfoBloc(),
                ),
                BlocProvider(
                  create: (BuildContext context) => SBExcavationAreaBloc(),
                ),
                BlocProvider(
                  create: (BuildContext context) =>
                      SmallPropertiesFoundationBloc(),
                ),
                BlocProvider(
                  create: (BuildContext context) => WallsBloc(),
                ),
                BlocProvider(
                    create: (BuildContext context) =>
                        SmallPropertiesRoofsBloc()),
                BlocProvider(
                  create: (BuildContext context) => SPOuterDoorsBloc(),
                ),
                BlocProvider(
                  create: (BuildContext context) => SPInnerDoorsBloc(),
                ),
                BlocProvider(
                    create: (BuildContext context) =>
                        SmallPropertiesElectricalInstallationsAndHvacBloc()),
                BlocProvider(
                  create: (BuildContext context) => SPMachineryBloc(),
                ),
                BlocProvider(
                  create: (BuildContext context) => YardRoofBloc(),
                ),
                BlocProvider(
                  create: (BuildContext context) => ThermalCenterBloc(),
                ),
                BlocProvider(
                  create: (BuildContext context) => TotalThermalCenterBloc(
                    thermalCenterBloc: context.read<ThermalCenterBloc>(),
                  ),
                ),
                BlocProvider(create: (BuildContext context) => ApartmentBloc()),
                BlocProvider(
                    create: (BuildContext context) => Apartment2RoomBloc()),
                BlocProvider(
                    create: (BuildContext context) => Apartment3RoomBloc()),
                BlocProvider(
                    create: (BuildContext context) => Apartment4RoomBloc()),
                BlocProvider(
                  create: (BuildContext context) => ApartmentSizeBloc(
                    oneRoomBloc: context.read<ApartmentBloc>(),
                    twoRoomsBloc: context.read<Apartment2RoomBloc>(),
                    threeRoomsBloc: context.read<Apartment3RoomBloc>(),
                    fourRoomsBloc: context.read<Apartment4RoomBloc>(),
                  ),
                ),
              ],
              child: SmallerPropertiesView(),
            ),
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
