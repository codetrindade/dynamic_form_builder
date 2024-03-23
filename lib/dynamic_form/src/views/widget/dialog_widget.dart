
import 'package:dynamic_form_builder/dynamic_form/src/controller/controller.dart';
import 'package:dynamic_form_builder/dynamic_form/src/services/state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DialogWidget extends StatefulWidget {
  @override
  _DialogState createState() => _DialogState();
  final WidgetRef ref;

  const DialogWidget({
    super.key,
    required this.ref,
  });
}

class _DialogState extends State<DialogWidget> {
  String value = "";
  late Controller controller;
  final TextEditingController _textEditingController = TextEditingController();
  _DialogState();

  @override
  void initState() {
    super.initState();
    controller = Controller(ref: widget.ref);
    value = widget.ref.watch(stringToJsonProvider);
    _textEditingController.text = value;
  }

  @override
  Widget build(BuildContext context) {
    value = widget.ref.watch(stringToJsonProvider);
      _textEditingController.text = value;
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      title: const Text("Form Builder With Json"),
      content: SizedBox.expand(
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
              maxLines: 10,
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('cancel')),
        ElevatedButton(
            onPressed: () => {
                  if (!controller.validateTextJson(_textEditingController.text))
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Error: The Json Input is not valid.'),
                        ),
                      )
                    }
                  else
                    {
                      Navigator.pop(context, value)
                    },
                },
            child: const Text('confirm')),
      ],
    );
  }
}
