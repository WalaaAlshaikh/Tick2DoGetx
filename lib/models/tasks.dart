class Task {
  String? task;
  bool done;

  Task({this.task, this.done = false});

  factory Task.fromJson(Map<String, dynamic> json) =>
      Task(task: json['task'], done: json['done']);

  Map<String, dynamic> toJson() => {'task': task, 'done': done};
}
