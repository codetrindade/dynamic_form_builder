import 'package:dynamic_form_builder/dynamic_form/src/models/form_field_model.dart';
import 'package:dynamic_form_builder/dynamic_form/src/services/state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


/// The `DynamicFormScreen` is the primary user interface for the dynamic form.

/// **Key Responsibilities**
///
/// * **Retrieving JSON:** Fetches the form structure definition from a source (API, file, etc.).
/// * **Form Rendering:** Uses `FormBuilder` and the JSON data to build the form.
/// * **Visibility Logic:**  Handles conditional field display based on visibility rules and user input.
/// * **Dialog Integration:** Interacts with the `DialogWidget` to modify/edit the JSON representation.

/// **Dependencies**
///
/// * `Controller` class (for parsing and form generation logic).
/// * Riverpod providers (for form state management).
class DynamicForm extends ConsumerWidget {
  final List<FormFieldModel> fields;

  const DynamicForm({super.key, required this.fields});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormBuilderState>();
    return ListView(
      children: [
        FormBuilder(
            key: formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              children: [
                for (final field in fields)
                  Visibility(
                      visible: shouldShowField(
                          field, ref.watch(dropdownValueProvider)),
                      child: _buildFormField(field, ref)),
              ],
            )),
      ],
    );
  }

  Widget _buildFormField(FormFieldModel field, WidgetRef ref) {
    switch (field.widgetType) {
      case 'dropdown':
        return FormBuilderDropdown(
          decoration: InputDecoration(
            helperText: field.name,
          ),
          onChanged: (value) {
            ref.read(dropdownValueProvider.notifier).state = value.toString();
          },
          name: field.name,
          items: field.validValues!
              .map((value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ))
              .toList(),
        );
      case 'textfield':
        return FormBuilderTextField(
          decoration:
              InputDecoration(helperText: field.name, hintText: field.name),
          name: field.name,
        );
      default:
        return Text('Invalid Widget: ${field.widgetType}');
    }
  }

  bool shouldShowField(FormFieldModel field, String currentDropDownValue) {
    if (field.visibilityCondition == null) {
      return true; // Always visible if no rule
    }
    final parts = field.visibilityCondition!.split('==');
    final expectedValue = parts[1].replaceAll("'", "");
    return currentDropDownValue == expectedValue;
  }
}
