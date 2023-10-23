import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_toda_app/providers/all_providers.dart';

class ToolBarWidget extends ConsumerWidget {
  const ToolBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onCompletedTodoCount = ref.watch(unCompletedTodoCount);
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
          child: TextButton(onPressed: () {}, child: const Text('All')),
        ),
        Tooltip(
          message: 'Only Uncompleted Todos',
          child: TextButton(onPressed: () {}, child: const Text('Active')),
        ),
        Tooltip(
          message: 'Only Completed Todos',
          child: TextButton(onPressed: () {}, child: const Text('Completed')),
        ),
      ],
    );
  }
}
