# dynamic_form_builder

The developed application is capable of dynamically generating and displaying a form based on input JSON. The visibility of form fields is controlled according to user selections, guided by visibility rules defined within the JSON. The application can adapt to any modifications in the JSON structure.


**Project Structure**

``` css
lib/
├── dynamic_form/
│   ├── src/
│   │   ├── controller/
│   │   │   └── controller.dart
│   │   ├── models/
│   │   │   └── form_field_model.dart
│   │   └── services/
│   │       └── state_provider.dart
│   └── views/
│       ├── dynamic_form_screen.dart
│       └── home_page.dart
├── app.dart
└── main.dart
```

    Dynamic Form Generation: The application is capable of dynamically creating form fields based on the provided JSON input.
    Conditional Visibility: Fields should be shown or hidden based on conditions specified in the "visible" attribute of the JSON. These conditions are evaluated based on user input.
    State Management: Riverpod is used to manage the state of the form, including visibility and field values.
    Widget Build Optimization: Ensures that the Flutter build mechanism rebuilds only necessary widgets based on user interaction and changes in visibility conditions.

**Technical Considerations**

    Error Handling: Implements error handling to manage scenarios where the JSON is malformed or contains invalid data.
    Extensibility: The solution design is planned to be easily extendable, allowing for additions or modifications to the form structure as defined in the JSON.
    Performance: The application is optimized to ensure that dynamic visibility changes and state updates do not degrade the user experience.


**Deliverables**

The project deliverables include:
Source code of the Flutter application.
Documentation on the architecture, including state management and dynamic form generation logic.

# Basic Usage Example: 

## Example 1: Valid JSON Input

The following JSON input defines a form with a dropdown field (f1) and several text fields (f2 to f10).
The visibility of text fields is controlled based on the selected value of the dropdown field.

``` json
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

```
This JSON input is considered valid because it follows the expected structure, 
defining a dropdown field with valid values and visibility conditions for text
 fields based on the selected dropdown value.

## Example 2: Invalid JSON Input

The following JSON input is invalid because it contains a typo in the visible condition for the f5 field. Instead of comparing with 'B', it mistakenly compares with 'C'.

``` json
[
  { "field_name": "f1", "widget": "dropdown", "valid_values": ["A", "B", "C", "D"] },
  { "field_name": "f2", "widget": "textfield", "visible": "f1=='A'" },
  { "field_name": "f3", "widget": "textfield", "visible": "f1=='A'" },
  { "field_name": "f4", "widget": "textfield", "visible": "f1=='A'" },
  { "field_name": "f5", "widget": "textfield", "visible": "f1=='f1'" }, // Incorrect visibility condition
  { "field_name": "f6", "widget": "textfield", "visible": "f1=='B'" },
  { "field_name": "f7", "widget": "textfield", "visible": "f1=='C'" },
  { "field_name": "f8", "widget": "textfield", "visible": "f1=='C'" },
  { "field_name": "f9", "widget": "textfield", "visible": "f1=='D'" },
  { "field_name": "f10", "widget": "textfield", "visible": "f1=='D'" }
]

```





