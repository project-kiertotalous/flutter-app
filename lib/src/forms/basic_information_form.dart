import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/basic_information_data.dart';

class BasicInformationForm extends StatefulWidget {
  @override
  _BasicInformationFormState createState() => _BasicInformationFormState();
}

class _BasicInformationFormState extends State<BasicInformationForm> {
  final _formKey = GlobalKey<FormState>();
  final _kohteenNimiController = TextEditingController();
  final _rakennustyyppiController = TextEditingController();
  final _osoiteController = TextEditingController();
  final _kuntaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _kohteenNimiController.text = BasicInformationData.kohteenNimi;
    _rakennustyyppiController.text = BasicInformationData.rakennustyyppi;
    _osoiteController.text = BasicInformationData.osoite;
    _kuntaController.text = BasicInformationData.kunta;
  }

  @override
  void dispose() {
    _kohteenNimiController.dispose();
    _rakennustyyppiController.dispose();
    _osoiteController.dispose();
    _kuntaController.dispose();
    super.dispose();
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        BasicInformationData.kohteenNimi = _kohteenNimiController.text;
        BasicInformationData.rakennustyyppi = _rakennustyyppiController.text;
        BasicInformationData.osoite = _osoiteController.text;
        BasicInformationData.kunta = _kuntaController.text;
      });
    }
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
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
      ),
    );
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
                "Kohteen tiedot",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildTextField(label: "Kohteen nimi", controller: _kohteenNimiController),
              _buildTextField(label: "Rakennustyyppi", controller: _rakennustyyppiController),
              _buildTextField(label: "Osoite", controller: _osoiteController),
              _buildTextField(label: "Kunta", controller: _kuntaController),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _saveForm,
                child: Text("Tallenna"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
