import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/basic_information_data.dart';

class BasicInformationForm extends StatefulWidget {
  @override
  _BasicInformationFormState createState() => _BasicInformationFormState();

  final BasicInformationData data;

  const BasicInformationForm({super.key, required this.data});
}

class _BasicInformationFormState extends State<BasicInformationForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _buildingNameController = TextEditingController();
  final TextEditingController _buildingTypeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _municipalityController = TextEditingController();
  final TextEditingController _creatorController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _versionController = TextEditingController();
  final TextEditingController _additionalInfoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meta Data Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _buildingNameController,
                decoration: InputDecoration(labelText: 'Building Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the building name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _buildingTypeController,
                decoration: InputDecoration(labelText: 'Building Type'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the building type';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _municipalityController,
                decoration: InputDecoration(labelText: 'Municipality'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the municipality';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _creatorController,
                decoration: InputDecoration(labelText: 'Creator of the Calculation'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the creator of the calculation';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(labelText: 'Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the date';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _versionController,
                decoration: InputDecoration(labelText: 'Version'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the version';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _additionalInfoController,
                decoration: InputDecoration(labelText: 'Additional Information'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter additional information';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process data
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _buildingNameController.dispose();
    _buildingTypeController.dispose();
    _addressController.dispose();
    _municipalityController.dispose();
    _creatorController.dispose();
    _dateController.dispose();
    _versionController.dispose();
    _additionalInfoController.dispose();
    super.dispose();
  }
}