import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? description;
  @HiveField(2)
  String? deadline;
  @HiveField(3)
  String? color;

  TaskModel({this.name, this.description, this.deadline, this.color});

  TaskModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    deadline = json['deadline'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['deadline'] = deadline;
    data['color'] = color;
    return data;
  }
}
