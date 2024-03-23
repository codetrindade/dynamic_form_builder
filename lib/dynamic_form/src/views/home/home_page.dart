
import 'package:dynamic_form_builder/dynamic_form/src/views/dynamic_form/dynamic_form_screen.dart';
import 'package:dynamic_form_builder/dynamic_form/src/views/widget/dialog_widget.dart';
import 'package:dynamic_form_builder/dynamic_form/src/services/state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: DynamicForm(fields: ref.watch(listFieldsProvider)),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) => Scaffold(
              backgroundColor: Colors.transparent,
              body: DialogWidget(
                ref: ref,
              ),
            ),
          );
        },
        tooltip: 'Change Json File',
        child: const Icon(Icons.settings),
      ),
    );
  }
}
