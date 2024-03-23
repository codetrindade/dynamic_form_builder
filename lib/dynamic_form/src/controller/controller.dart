import 'dart:convert';
import 'package:dynamic_form_builder/dynamic_form/src/models/form_field_model.dart';
import 'package:dynamic_form_builder/dynamic_form/src/services/state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


/// The [Controller] class is responsible for handling the following:
///
/// * **JSON Validation:** Ensures that the provided JSON input adheres to the expected structure.
/// * **Form Field Creation:** Parses the JSON and dynamically generates corresponding form field models.
/// * **State Management:** Manages the form's state (likely, communicates with your Riverpod providers).
/// **Public Methods**
///
/// * `[validateTextJson(String text)`: 
///     * Takes a string containing JSON data.
///     * Validates and parses the JSON.
///     * Updates internal form field models.
///     * Returns a boolean indicating validation success.
class Controller {
  final WidgetRef ref;

  Controller({
    required this.ref,
  });

  bool validateTextJson(String text) {
    try {
      dynamic decodedJson = jsonDecode(text);
      if (decodedJson is List) {
        _setString(text);
      }
      return _validateFormat(decodedJson);
    } catch (e) {
      return false;
    }
  }

  bool _validateFormat(dynamic value) {
    if (value is List) {
      List<Map<String, dynamic>> jsonData =
          List<Map<String, dynamic>>.from(value);
      _clearList();
      for (var data in jsonData) {
        String fieldName = data['field_name'];
        String widget = data['widget'];
        List<String>? validValues = data['valid_values'] != null
            ? List<String>.from(data['valid_values'])
            : null;
        String? visibility = data['visible'];
        _addFormField(FormFieldModel(
            name: fieldName,
            widgetType: widget,
            validValues: validValues,
            visibilityCondition: visibility));
      }
      return true;
    }
    return false;
  }

  void _clearList() {
    final list = ref.read(listFieldsProvider.notifier).state;
    list.clear();
    ref.read(listFieldsProvider.notifier).state = list;
  }

  void _addFormField(FormFieldModel value) {
    final list = ref.read(listFieldsProvider.notifier).state;
    list.add(value);
    ref.read(listFieldsProvider.notifier).state = list;
  }

  void _setString(String value) {
    ref.read(stringToJsonProvider.notifier).update((state) => value);
  }
}
