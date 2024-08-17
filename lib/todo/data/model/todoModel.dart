 class Todo {
  String? id;
  String title;
  bool? isCompleted;
  bool? isPending;
  bool? isDeleted;

  Todo({required this.title,
     this.isCompleted,
    this.id,
   this.isPending,
   this.isDeleted});

  Todo copyWith({
    String? id,
    String? title,
    bool? isCompleted,
    bool? isPending,
    bool? isDeleted,
}){
    return Todo(
        title: title ?? this.title,
      id: id?? this.id,
      isCompleted: isCompleted ?? this.isCompleted,
      isPending: isPending ?? this.isPending,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }


  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json["id"],
      title: json["title"],
      isCompleted: json["isCompleted"].toLowerCase() == 'true',
      isPending: json["isPending"].toLowerCase() == 'true',
      isDeleted: json["isDeleted"].toLowerCase() == 'true',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "title": this.title,
      "isCompleted": this.isCompleted,
      "isPending": this.isPending,
      "isDeleted": this.isDeleted,
    };
  }
//
//

//
}