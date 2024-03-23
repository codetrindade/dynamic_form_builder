
/// The `FormFieldModel` class represents a single form field within the dynamic form.

/// **Properties**
///
/// * `name`: String - The unique name identifier of the form field.
/// * `widgetType`:  String - The type of Flutter form widget to render (e.g., 'dropdown', 'textfield').
/// * `validValues`: List<String>? - An optional list of valid values, used primarily for dropdowns.
/// * `visibilityCondition`: String? - An optional expression determining field visibility based on other fields.

class FormFieldModel {
  final String name;
  final String widgetType;
  final List<String>? validValues;
  final String? visibilityCondition;

  FormFieldModel({
    required this.name,
    required this.widgetType,
    this.validValues,
    this.visibilityCondition,
  });

  factory FormFieldModel.fromJson(Map<String, dynamic> json) {
    return FormFieldModel(
      name: json['field_name'],
      widgetType: json['widget'],
      validValues: json['valid_values']?.cast<String>(),
      visibilityCondition: (json['visible']),
    );
  }
}
