import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task_model.dart';

class CrudOperations {
  final _taskReference = FirebaseFirestore.instance.collection('tasks');

  Stream<List<ModelTask>> readTasks() =>
      _taskReference.snapshots().map((snapshot) =>
          snapshot.docs.map((doc) => ModelTask.fromJson(doc.data())).toList());

  Future<void> createTask(String task, bool isDone) async {
    final docTask = _taskReference.doc();

    final taskJson = ModelTask(
      task: task,
      id: docTask.id,
      isDone: isDone,
    ).toJson();

    await docTask.set(taskJson);
  }

  Future<void> deleteTask(String id) async {
    await _taskReference.doc(id).delete();
  }

  Future<void> updateCheckBox(id, isChecked) async {
    await _taskReference.doc(id).update({'isDone': isChecked});
  }
}
