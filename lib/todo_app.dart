import 'package:flutter/material.dart';
import 'package:riverpod_toda_app/models/todo_model.dart';
import 'package:riverpod_toda_app/widgets/title_widgets.dart';
import 'package:riverpod_toda_app/widgets/todo_list_item_widget.dart';
import 'package:riverpod_toda_app/widgets/toolbar_widget.dart';
import 'package:uuid/uuid.dart';



class TodoApp extends StatelessWidget {
  TodoApp({Key? key}) : super(key: key);

  final newTodoController = TextEditingController();
  List<TodoModel> allTodos = [
    TodoModel(id: const Uuid().v4(), description: 'Spora Git'),
    TodoModel(id: const Uuid().v4(), description: 'Alışveriş yap'),
    TodoModel(id: const Uuid().v4(), description: 'Ders Çalış'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          const TitleWidget(),
          TextField(
            controller: newTodoController,
            decoration:
                const InputDecoration(labelText: 'Neler Yapacaksın Bugün ?'),
            onSubmitted: (newTodo) {
              debugPrint('şunu ekle $newTodo');
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const ToolBarWidget(),
          for (var i = 0; i < allTodos.length; i++)
            Dismissible(
                key: ValueKey(allTodos[i].id),
                onDismissed: (_){
                  
                },
                child: TodoListItemWidget(item: allTodos[i]))
        ],
      ),
    );
  }
}
