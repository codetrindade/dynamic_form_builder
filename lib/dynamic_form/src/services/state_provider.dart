// Provider para gerenciar o estado do formulário
import 'dart:convert';
import 'package:dynamic_form_builder/dynamic_form/src/models/form_field_model.dart';
import 'package:riverpod/riverpod.dart';

var initialJson = """ 
  [
  { "field_name": "f1", "widget": "dropdown", "valid_values": ["A", "B", "C", "D"] },
  { "field_name": "f2", "widget": "textfield", "visible": "f1=='A'" },
  { "field_name": "f3", "widget": "textfield", "visible": "f1=='A'" },
  { "field_name": "f4", "widget": "textfield", "visible": "f1=='A'" },
  { "field_name": "f5", "widget": "textfield", "visible": "f1=='B'" },
  { "field_name": "f6", "widget": "textfield", "visible": "f1=='B'" },
  { "field_name": "f7", "widget": "textfield", "visible": "f1=='C'" },
  { "field_name": "f8", "widget": "textfield", "visible": "f1=='C'" },
  { "field_name": "f9", "widget": "textfield", "visible": "f1=='D'" },
  { "field_name": "f10", "widget": "textfield", "visible": "f1=='D'" }
]

""";

var stringToJsonProvider = StateProvider<String>((ref) => initialJson);

final listFieldsProvider = StateProvider<List<FormFieldModel>>((ref) {
  try {
    final json = ref.watch(stringToJsonProvider);
    return _loadFieldsFromJson(json);
  } catch (e) {
    return [];
  }
});

final dropdownValueProvider = StateProvider<String>((ref) => '');

List<FormFieldModel> _loadFieldsFromJson(String json) {
  final jsonData = jsonDecode(json) as List<dynamic>;
  return jsonData
      .map((fieldData) => FormFieldModel.fromJson(fieldData))
      .toList();
}