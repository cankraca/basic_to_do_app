import 'package:basic_todo_app/models/task_model.dart';
import 'package:basic_todo_app/widgets/task.dart';
import 'package:flutter/material.dart';

import '../data/cloud_firestore.dart';
import '../widgets/alert_dialog.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = TextEditingController();
  final crud = CrudOperations();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('TO DO'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<List<ModelTask>>(
          stream: crud.readTasks(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Somethin went wrong! ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              final List<ModelTask> tasks = snapshot.data!;

              if (tasks.length > 0) {
                return ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyTask(
                        id: tasks[index].id,
                        isDone: tasks[index].isDone,
                        task: tasks[index].task,
                        delete: (_) {
                          crud.deleteTask(tasks[index].id);
                        },
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text(
                    'No Tasks Added',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                );
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          _openDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> _openDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => MyAlertDialog(controller: controller, crud: crud),
    );
  }
}
