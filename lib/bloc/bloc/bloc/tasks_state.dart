part of 'tasks_bloc.dart';

abstract class TasksState extends Equatable {
  final List<Task> showtaskList;

  TasksState({this.showtaskList = const <Task>[]});

  @override
  List<Object> get props => [];
}
