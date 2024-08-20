import 'package:hive/hive.dart';
part 'todoModel.g.dart';
@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String title;
  @HiveField(2)
  bool? isCompleted;
  @HiveField(3)
  bool? isDeleted;

  Todo({required this.title,
     this.isCompleted,
    this.id,
   this.isDeleted});

  Todo copyWith({
    String? id,
    String? title,
    bool? isCompleted,
    bool? isDeleted,
}){
    return Todo(
        title: title ?? this.title,
      id: id?? this.id,
      isCompleted: isCompleted ?? this.isCompleted,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }


  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json["id"],
      title: json["title"],
      isCompleted: json["isCompleted"].toLowerCase() == 'true',
      isDeleted: json["isDeleted"].toLowerCase() == 'true',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "title": this.title,
      "isCompleted": this.isCompleted,
      "isDeleted": this.isDeleted,
    };
  }
//
//

//
}