import 'package:flutter/material.dart';
import '../data/cloud_firestore.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({
    super.key,
    required this.controller,
    required this.crud,
  });

  final TextEditingController controller;
  final CrudOperations crud;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceAround,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      content: TextField(
        controller: controller,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        cursorColor: Colors.black,
        autofocus: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Add a new task',
        ),
      ),
      actions: [
        SaveButton(controller: controller, crud: crud),
        CancelButton(),
      ],
    );
  }
}

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Cancel'),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    required this.controller,
    required this.crud,
  });

  final TextEditingController controller;
  final CrudOperations crud;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final task = controller.text;

        crud.createTask(task, false);

        controller.clear();

        Navigator.of(context, rootNavigator: true).pop();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Save'),
      ),
    );
  }
}
