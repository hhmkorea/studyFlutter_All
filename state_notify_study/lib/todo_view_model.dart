// The state of our StateNotifier should be immutable.
// We could also use packages like Freezed to help with the implementation.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class Todo {
  const Todo({required this.id, required this.description, required this.completed});

  // All properties should be `final` on our class.
  final String id;
  final String description;
  final bool completed;

  // Since Todo is immutable, we implement a method that allows cloning the
  // Todo with slightly different content.
  Todo copyWith({String? id, String? description, bool? completed}) {
    // 기존값은 변경하지 않고 기존값을 가져와서 쓰임.
    return Todo(
      id: id ?? this.id,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }
}

// The StateNotifier class that will be passed to our StateNotifierProvider.
// This class should not expose state outside of its "state" property, which means
// no public getters/properties!
// The public methods on this class will be what allow the UI to modify the state.
class TodosNotifier extends StateNotifier<List<Todo>> {
  // We initialize the list of todos to an empty list
  TodosNotifier(super._state);

  // Let's allow the UI to add todos.
  void addTodo(Todo todo) {
    // Since our state is immutable, we are not allowed to do `state.add(todo)`.
    // Instead, we should create a new list of todos which contains the previous
    // items and the new one.
    // Using Dart's spread operator here is helpful!
    state = [...state, todo]; // 깊은 복사, 상태 변경을 하려면 깊은 복사를 해야함.
    // No need to call "notifyListeners" or anything similar. Calling "state ="
    // will automatically rebuild the UI when necessary.
  }

  // Let's allow removing todos
  void removeTodo(String todoId) {
    // Again, our state is immutable. So we're making a new list instead of
    // changing the existing list.
    state = [
      for (final todo in state)
        if (todo.id != todoId) todo,
    ];
  }

  // Let's mark a todo as completed
  void toggle(String todoId) {
    state = state.map((todo) => todo.id == todoId ? todo.copyWith(completed: !todo.completed) : todo).toList();

    // state = [
    //   for (final todo in state)
    //     // we're marking only the matching todo as completed
    //     if (todo.id == todoId)
    //       // Once more, since our state is immutable, we need to make a copy
    //       // of the todo. We're using our `copyWith` method implemented before
    //       // to help with that.
    //       todo.copyWith(completed: !todo.completed) // 체크박스 상태 변화 체크 후 변경
    //     else
    //       // other todos are not modified
    //       todo,
    // ];
  }
}

// Finally, we are using StateNotifierProvider to allow the UI to interact with
// our TodosNotifier class.
final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  // StateNotifierProvider : 창고관리자, TodosNotifier 타입 박스 안에 List 타입 데이타를 관리 중, 내부에 메소드를 만들어서 상태를 관리할 수 있음.
  List<Todo> todos = [
    Todo(id: "1", description: "설명1", completed: false),
    Todo(id: "2", description: "설명2", completed: false),
    Todo(id: "3", description: "설명3", completed: true),
  ];
  final datas = ["1", "2"];

  return TodosNotifier(todos); // TodosNotifier : 여기 안에 있는 addTodo, removeTodo, toggle 클래스로 상태변화 체크 후 리턴 가능함.
});
