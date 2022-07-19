import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/Model/task_data_model.dart';
import 'package:equatable/equatable.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksState()) {
    on<AddTask>(_addtask);
    on<UpdateTask>(_updatetask);
    on<DeleteTask>(_deletetask);
  }

  void _addtask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
        showtaskList: List.from(state.showtaskList)..add(event.task)));
  }

  void _updatetask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    final int index = state.showtaskList.indexOf(task);
    List<Task> showtaskList = List.from(state.showtaskList)..remove(task);
    task.isDone == false
        ? showtaskList.insert(index, task.copyWith(isDone: true))
        : showtaskList.insert(index, task.copyWith(isDone: false));

    emit(TasksState(showtaskList: showtaskList));
  }

  void _deletetask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    final int index = state.showtaskList.indexOf(task);
    List<Task> showtaskList = List.from(state.showtaskList)..remove(task);

    emit(TasksState(showtaskList: showtaskList));
  }
}
