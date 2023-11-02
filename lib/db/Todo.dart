import 'dart:convert';

Todo todoFromJson(String str) {
  final jsonData = json.decode(str);
  return Todo.fromJson(jsonData);
}

String todoToJson(Todo data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Todo {
  Todo({
    required this.id,
    required this.task,
    required this.completed,
  });

  int id;
  String task;
  bool completed;

  factory Todo.fromJson(Map<String, dynamic> json) => new Todo(
    id: json["id"],
    task: json["task"],
    completed: json["completed"]  == 1,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "task": task,
    "completed": completed,
  };
}
