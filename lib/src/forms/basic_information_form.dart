import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/basic_information_data.dart';

class BasicInformationForm extends StatefulWidget {
  @override
  _BasicInformationFormState createState() => _BasicInformationFormState();
}

class _BasicInformationFormState extends State<BasicInformationForm> {
  final _formKey = GlobalKey<FormState>();
  final _buildingNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _buildingNameController.text = BasicInformationData.buildingName;
  }

  @override
  void dispose() {
    _buildingNameController.dispose();
    super.dispose();
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        BasicInformationData.buildingName = _buildingNameController.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
                "Basic Information",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _buildingNameController,
                decoration: InputDecoration(
                  labelText: "Building Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a building name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _saveForm,
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
