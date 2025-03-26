import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/basic_information_data.dart';

class BasicInformationForm extends StatefulWidget {
  const BasicInformationForm({super.key});

  @override
  BasicInformationFormState createState() => BasicInformationFormState();
}

class BasicInformationFormState extends State<BasicInformationForm> {
  final _formKey = GlobalKey<FormState>();

  //Controllers for text fields
  final _buildingNameController = TextEditingController();
  final _buildingTypeController = TextEditingController();
  final _buildingAddressController = TextEditingController();
  final _buildingMunicipalityController = TextEditingController();
  final _calculationCreatorController = TextEditingController();
  final _calculationDateController = TextEditingController();
  final _calculationVersionController = TextEditingController();
  final _buildingInformationController = TextEditingController();

  // Focusnodes for auto-jumping
  final _buildingNameFocus = FocusNode();
  final _buildingTypeFocus = FocusNode();
  final _buildingAddressFocus = FocusNode();
  final _buildingMunicipalityFocus = FocusNode();
  final _calculationCreatorFocus = FocusNode();
  final _calculationDateFocus = FocusNode();
  final _calculationVersionFocus = FocusNode();
  final _buildingInformationFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _buildingNameController.text = BasicInformationData.buildingName;
    _buildingTypeController.text = BasicInformationData.buildingType;
    _buildingAddressController.text = BasicInformationData.buildingAddress;
    _buildingMunicipalityController.text =
        BasicInformationData.buildingMunicipality;
    _calculationCreatorController.text =
        BasicInformationData.calculationCreator;
    _calculationDateController.text = BasicInformationData.calculationDate;
    _calculationVersionController.text =
        BasicInformationData.calculationVersion;
    _buildingInformationController.text =
        BasicInformationData.buildingInformation;
  }

  @override
  void dispose() {
    // Dispose controllers
    _buildingNameController.dispose();
    _buildingTypeController.dispose();
    _buildingAddressController.dispose();
    _buildingMunicipalityController.dispose();
    _calculationCreatorController.dispose();
    _calculationDateController.dispose();
    _calculationVersionController.dispose();
    _buildingInformationController.dispose();

    // Dispose FocusNodes
    _buildingNameFocus.dispose();
    _buildingTypeFocus.dispose();
    _buildingAddressFocus.dispose();
    _buildingMunicipalityFocus.dispose();
    _calculationCreatorFocus.dispose();
    _calculationDateFocus.dispose();
    _calculationVersionFocus.dispose();
    _buildingInformationFocus.dispose();

    super.dispose();
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    double? width,
    required void Function(String) onSaved,
    required FocusNode currentFocus,
    FocusNode? nextFocus,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: width,
        child: TextFormField(
          controller: controller,
          focusNode: currentFocus,
          textInputAction:
              nextFocus != null ? TextInputAction.next : TextInputAction.done,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Täytä kenttä";
            }
            return null;
          },
          onChanged: (value) => onSaved(value), // Save as user types
          onFieldSubmitted: (value) {
            onSaved(value);
            if (nextFocus != null) {
              FocusScope.of(context).requestFocus(nextFocus);
            } else {
              FocusScope.of(context).unfocus();
            }
          },
        ),
      ),
    );
  }

  @override

  /// Build a form for basic information about the building being calculated.
  Widget build(BuildContext context) {
    return SizedBox(
      width: 900,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kohteen tiedot",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start, // Aligns to top
                  children: [
                    // Left column with fixed width
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Aligns text fields to left
                        children: [
                          _buildTextField(
                              label: "Kohteen nimi",
                              controller: _buildingNameController,
                              currentFocus: _buildingNameFocus,
                              nextFocus: _buildingTypeFocus,
                              width: 400,
                              onSaved: (value) =>
                                  BasicInformationData.buildingName = value),
                          _buildTextField(
                              label: "Rakennustyyppi",
                              controller: _buildingTypeController,
                              currentFocus: _buildingTypeFocus,
                              nextFocus: _buildingAddressFocus,
                              width: 400,
                              onSaved: (value) =>
                                  BasicInformationData.buildingType = value),
                          _buildTextField(
                              label: "Osoite",
                              controller: _buildingAddressController,
                              currentFocus: _buildingAddressFocus,
                              nextFocus: _buildingMunicipalityFocus,
                              width: 400,
                              onSaved: (value) =>
                                  BasicInformationData.buildingAddress = value),
                          _buildTextField(
                              label: "Kunta",
                              controller: _buildingMunicipalityController,
                              currentFocus: _buildingMunicipalityFocus,
                              nextFocus: _calculationCreatorFocus,
                              width: 400,
                              onSaved: (value) => BasicInformationData
                                  .buildingMunicipality = value),
                        ],
                      ),
                    ),
                    SizedBox(width: 16), // Spacing between columns
                    // Right column expands to fill remaining space
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Aligns text fields to left
                        children: [
                          _buildTextField(
                              label: "Laskelman laatija",
                              controller: _calculationCreatorController,
                              currentFocus: _calculationCreatorFocus,
                              nextFocus: _calculationDateFocus,
                              width: 400,
                              onSaved: (value) => BasicInformationData
                                  .calculationCreator = value),
                          _buildTextField(
                              label: "Päivämäärä",
                              controller: _calculationDateController,
                              currentFocus: _calculationDateFocus,
                              nextFocus: _calculationVersionFocus,
                              width: 400,
                              onSaved: (value) =>
                                  BasicInformationData.calculationDate = value),
                          _buildTextField(
                              label: "Versio",
                              controller: _calculationVersionController,
                              currentFocus: _calculationVersionFocus,
                              nextFocus: _buildingInformationFocus,
                              width: 400,
                              onSaved: (value) => BasicInformationData
                                  .calculationVersion = value),
                          _buildTextField(
                              label: "Rakennuksen tiedot",
                              controller: _buildingInformationController,
                              currentFocus: _buildingInformationFocus,
                              width: 400,
                              onSaved: (value) => BasicInformationData
                                  .buildingInformation = value),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
