import 'package:basic_todo_app/data/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyTask extends StatefulWidget {
  final task;
  final id;
  final isDone;
  final Function(BuildContext)? delete;
  const MyTask(
      {super.key,
      required this.id,
      required this.delete,
      required this.task,
      required this.isDone});

  @override
  State<MyTask> createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.4,
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(12.0),
            onPressed: widget.delete,
            backgroundColor: Colors.red,
            icon: Icons.delete,
          ),
        ],
      ),
      child: _myListile(),
    );
  }

  CheckboxListTile _myListile() {
    bool isChecked = widget.isDone;
    CrudOperations crud = CrudOperations();
    return CheckboxListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      contentPadding: const EdgeInsets.all(12.0),
      activeColor: Colors.black,
      title: Text(
        widget.task,
        style: TextStyle(
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      value: isChecked,
      onChanged: (value) {
        setState(() {
          isChecked = value!;
          crud.updateCheckBox(widget.id, isChecked);
        });
      },
    );
  }
}
