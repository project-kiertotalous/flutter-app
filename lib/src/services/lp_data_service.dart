import 'dart:convert';
import 'dart:io';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:path_provider/path_provider.dart';

class DataService {
  static const _fileName = 'large_properties_data.json';

  Future<void> saveData(LargePropertiesRepository repository) async {
    final file = await _getFile();
    final jsonData = jsonEncode(repository.toJson());
    print('Saving data: $jsonData'); // Debug log
    await file.writeAsString(jsonData);
  }

  Future<LargePropertiesRepository?> loadData() async {
    final file = await _getFile();
    if (await file.exists()) {
      final content = await file.readAsString();
      final jsonMap = jsonDecode(content)
          as Map<String, dynamic>; // Parse the JSON string to Map
      return LargePropertiesRepository.fromJson(
          jsonMap); // Pass the Map to fromJson
    }
    return null;
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$_fileName');
    print('JSON file path: ${file.path}');
    return file;
  }
}
