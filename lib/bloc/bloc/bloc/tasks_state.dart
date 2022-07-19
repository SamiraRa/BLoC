// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> showtaskList;

  TasksState({this.showtaskList = const <Task>[]});

  @override
  List<Object> get props => [showtaskList];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'showtaskList': showtaskList.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      showtaskList: List<Task>.from(
        map['showtaskList']?.map(
          (x) => Task.fromMap(x),
        ),
      ),
    );
  }

  // String toJson() => json.encode(toMap());

  // factory TasksState.fromJson(String source) =>
  //     TasksState.fromMap(json.decode(source) as Map<String, dynamic>);
}
