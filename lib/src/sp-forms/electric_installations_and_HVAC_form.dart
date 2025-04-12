import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/empty_cell.dart';
import 'package:flutter_app/src/shared/header_cell.dart';
import 'package:flutter_app/src/sp-bloc/electrical_installations_and_hvac_bloc.dart';
import 'package:flutter_app/src/sp-bloc/electrical_installations_and_hvac_event.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class SPElectricalInstallationsAndhvacForm extends StatelessWidget {
  const SPElectricalInstallationsAndhvacForm({super.key});

  @override
  Widget build(BuildContext context) {
    final hvacBloc = context.read<SmallPropertiesElectricalInstallationsAndHvacBloc>();

    return BlocBuilder<SmallPropertiesElectricalInstallationsAndHvacBloc, Hvac>(
      builder: (context, state) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormHeader(text: 'Sähköasennukset ja LVI'),
            LayoutGrid(
              columnSizes: [250.px, 160.px, 160.px, 160.px],
              rowSizes: [50.px, 50.px, 50.px, 50.px, 50.px, 50.px, 50.px, 50.px, 50.px],
              children: [
                EmptyCell(),
                HeaderCell(initialValue: 'Kpl'),
                HeaderCell(initialValue: 'Metriä'),
                HeaderCell(initialValue: 'KG'),
                RowCell(initialValue: 'Sähköjohdot, kupari'),
                InputCell(
                  initialValue: state.electricalWiresCopper?.pieces,
                  setter: (value) => hvacBloc.add(SPElectricalWiresCopperChanged(value)),
                ),
                InputCell(
                  initialValue: state.electricalWiresCopper?.length,
                  setter: (value) => hvacBloc.add(SPElectricalWiresCopperChanged(value)),
                ),
                OutputCell(
                  getter: () => state.electricalWiresCopper?.weight,
                ),
                RowCell(initialValue: 'Kupariputket'),
                InputCell(
                    
                    initialValue: state.copperPipes?.pieces,
                    setter: (value) => hvacBloc.add(SPCopperPipesChanged(value)),
                ),
                InputCell(
                  initialValue: state.copperPipes?.length,
                  setter: (value) => hvacBloc.add(SPCopperPipesChanged(value)),
                ),
                OutputCell(
                  getter:() => state.copperPipes?.weight,
                ),
                RowCell(initialValue: 'Muoviputket, vesi'),
                InputCell(
                  initialValue: state.plasticPipesWater?.pieces,
                  setter: (value) => hvacBloc.add(SPPlasticPipesWaterChanged(value)),
                ),
                InputCell(
                  initialValue: state.plasticPipesWater?.length,
                  setter: (value) => hvacBloc.add(SPPlasticPipesWaterChanged(value)),
                ),
                OutputCell(
                  getter: () => state.plasticPipesWater?.weight,
                ),
                RowCell(initialValue: 'Ilmastointiputket D200'),
                InputCell(
                  initialValue: state.ventilationPipesD200?.pieces,
                  setter: (value) => hvacBloc.add(SPVentilationPipesD200Changed(value)),
                ),
                InputCell(
                  initialValue: state.ventilationPipesD200?.length,
                  setter: (value) => hvacBloc.add(SPVentilationPipesD200Changed(value)),
                ),
                OutputCell(
                  getter: () => state.ventilationPipesD200?.weight,
                ),
                RowCell(
                  initialValue: 'Keskuslämmitysputket',
                ),
                InputCell(
                  initialValue: state.centralHeatingPipes?.pieces,
                  setter: (value) => hvacBloc.add(SPCentralHeatingPipesChanged(value)),
                ),
                InputCell(
                  initialValue: state.centralHeatingPipes?.length,
                  setter: (value) => hvacBloc.add(SPCentralHeatingPipesChanged(value)),
                ),
                OutputCell(
                  getter: () => state.centralHeatingPipes?.weight,
                ),
                RowCell(
                  initialValue: 'Valurautaputket'),
                  InputCell(initialValue: state.castIronPipes?.pieces),
                  InputCell(initialValue: state.castIronPipes?.length),
                  OutPutCell(
                    getter: () => state.castIronPipes?.weight,
                  ),
                RowCell(
                  initialValue: 'Muoviset viemäriputket',
                ),
                InputCell(
                  initialValue: state.sewagePipesPlastic?.pieces,
                  setter: (value) => hvacBloc.add(SPSewagePipesPlasticChanged(value)),
                ),
                InputCell(
                  initialValue: state.sewagePipesPlastic?.length,
                  setter: (value) => hvacBloc.add(SPSewagePipesPlasticChanged(value)),
                ),
                OutputCell(
                  getter: () => state.sewagePipesPlastic?.weight,
                ),
                RowCell(
                  initialValue: 'Sadevesikourut ja rännit',
                ),
                InputCell(
                  initialValue: state.rainGutters?.pieces,
                  setter: (value) => hvacBloc.add(SPRainGuttersChanged(value)),
                ),
                InputCell(
                  initialValue: state.rainGutters?.length,
                  setter: (value) => hvacBloc.add(SPRainGuttersChanged(value)),
                ),
                OutputCell(
                  getter: () => state.rainGutters?.weight,
                )
              ],
                ),
          ],
                );
      },  
            ); 
  }
}
