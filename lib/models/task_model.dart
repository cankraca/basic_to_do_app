class ModelTask {
  ModelTask({required this.task, required this.id, required this.isDone});

  String task;
  String id;
  bool isDone;

  factory ModelTask.fromJson(Map<String, dynamic> json) => ModelTask(
        task: json['task'],
        id: json['id'],
        isDone: json['isDone'],
      );

  Map<String, dynamic> toJson() => {
        'task': task,
        'id': id,
        'isDone': isDone,
      };
}
