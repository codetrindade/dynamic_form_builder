# dynamic_form_builder

The developed application is capable of dynamically generating and displaying a form based on input JSON. The visibility of form fields is controlled according to user selections, guided by visibility rules defined within the JSON. The application can adapt to any modifications in the JSON structure.


**Project Structure**

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

    Dynamic Form Generation: The application is capable of dynamically creating form fields based on the provided JSON input.
    Conditional Visibility: Fields should be shown or hidden based on conditions specified in the "visible" attribute of the JSON. These conditions are evaluated based on user input.
    State Management: Riverpod is used to manage the state of the form, including visibility and field values.
    Widget Build Optimization: Ensures that the Flutter build mechanism rebuilds only necessary widgets based on user interaction and changes in visibility conditions.

Technical Considerations

    Error Handling: Implements error handling to manage scenarios where the JSON is malformed or contains invalid data.
    Extensibility: The solution design is planned to be easily extendable, allowing for additions or modifications to the form structure as defined in the JSON.
    Performance: The application is optimized to ensure that dynamic visibility changes and state updates do not degrade the user experience.

Let's focus on documenting controller.dart, form_field_model.dart, and dynamic_form_screen.dart.



