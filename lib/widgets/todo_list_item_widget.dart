import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_toda_app/providers/all_providers.dart';

class TodoListItemWidget extends ConsumerStatefulWidget {
  const TodoListItemWidget({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TodoListItemWidgetState();
}

class _TodoListItemWidgetState extends ConsumerState<TodoListItemWidget> {
  late FocusNode _textFocusNode;
  late TextEditingController _textEditingController;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _textFocusNode = FocusNode();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textFocusNode.dispose();
    _textEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      final currentTodoItem = ref.watch(currentTodoProvider);

    return Focus(
      onFocusChange: (isFocused) {
        if (!isFocused) {
          setState(() {
            _hasFocus = false;
          });
          ref
              .read(todoListProvider.notifier)
              .edit(currentTodoItem.id, _textEditingController.text);
        }
      },
      child: ListTile(
        onTap: () {
          setState(() {
            _hasFocus = true;
            _textFocusNode.requestFocus();
            _textEditingController.text = currentTodoItem.description;
          });
        },
        leading: Checkbox(
          value: currentTodoItem.completed,
          onChanged: (value) {
            ref.read(todoListProvider.notifier).toggle(currentTodoItem.id);
          },
        ),
        title: _hasFocus
            ? TextField(
                controller: _textEditingController,
                focusNode: _textFocusNode,
              )
            : Text(currentTodoItem.description),
      ),
    );
  }
}
