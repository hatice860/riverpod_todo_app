import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_toda_app/models/todo_model.dart';
import 'package:riverpod_toda_app/providers/todo_list_manager.dart';
import 'package:uuid/uuid.dart';

final todoListProvider =
    StateNotifierProvider<TodoListManager, List<TodoModel>>((ref) {
  return TodoListManager([
    TodoModel(id: const Uuid().v4(), description: "Spora Git"),
    TodoModel(id: const Uuid().v4(), description: "Ders Çalış"),
    TodoModel(id: const Uuid().v4(), description: "Alışveriş Yap")
  ]);
});

final unCompletedTodoCount = Provider((ref) {
  final allTodo = ref.watch(todoListProvider);
  final count = allTodo.where((element) => !element.completed).length;

  return count;
});

final currentTodoProvider = Provider<TodoModel>((ref) {
  throw UnimplementedError();
});
