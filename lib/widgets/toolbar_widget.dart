import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_toda_app/providers/all_providers.dart';

class ToolBarWidget extends ConsumerWidget {
  ToolBarWidget({Key? key}) : super(key: key);

  var _currentFiter = TodoListFilter.all;

  Color changeTextColor(TodoListFilter filt) {
    return _currentFiter == filt ? Colors.deepPurple : Colors.black;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onCompletedTodoCount = ref.watch(unCompletedTodoCount);
    final _currentFilter = ref.watch(todoListFilter);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            onCompletedTodoCount == 0
                ? 'Tüm görevler OK'
                : onCompletedTodoCount.toString() + " görev tamamlanmadı",
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Tooltip(
            message: 'All Todos',
            child: TextButton(
              onPressed: () {
                ref.read(todoListFilter.notifier).state = TodoListFilter.all;
              },
              child: Text('All',
                  style: TextStyle(color: changeTextColor(TodoListFilter.all))),
            )),
        Tooltip(
          message: 'Only Uncompleted Todos',
          child: TextButton(
              onPressed: () {
                ref.read(todoListFilter.notifier).state = TodoListFilter.active;
              },
              child: Text('Active',
                  style: TextStyle(
                      color: changeTextColor(TodoListFilter.active)))),
        ),
        Tooltip(
          message: 'Only Completed Todos',
          child: TextButton(
              onPressed: () {},
              child: Text('Completed',
                  style: TextStyle(
                      color: changeTextColor(TodoListFilter.completed)))),
        ),
      ],
    );
  }
}
