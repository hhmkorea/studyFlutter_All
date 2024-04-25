import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notify_study/todo_view_model.dart';

void main() {
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: TodoListView(),
      ),
    );
  }
}

class TodoListView extends ConsumerWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // rebuild the widget when the todo list changes
    List<Todo> todos = ref.watch(todosProvider); // watch : 창고관리자(todosProvider)를 지켜보고 있음. 데이타가 없으면 빈 값만 보여줌.

    // Let's render the todos in a scrollable list view
    return ListView(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            Todo todo = Todo(id: "4", description: "설명4", completed: false);
            ref.read(todosProvider.notifier).addTodo(todo);
            // 기존 state 변경 방식 : 깊은 복사로 원래 데이타까지 전체 변경 해야함, 재사용 안됨.
            //List<Todo> todos = ref.read(todosProvider.notifier).state;
            //ref.read(todosProvider.notifier).state = [...todos, todo];
          },
          child: Text("추가"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            ref.read(todosProvider.notifier).removeTodo("1"); // removeTodo 메서드 활용
          },
          child: Text("삭제"),
        ),
        for (final todo in todos) // 데이타가 없으면 빈값이 보임.
          CheckboxListTile(
            value: todo.completed,
            // When tapping on the todo, change its completed status
            onChanged: (value) => ref.read(todosProvider.notifier).toggle(todo.id),
            title: Text(todo.description),
          ),
      ],
    );
  }
}
