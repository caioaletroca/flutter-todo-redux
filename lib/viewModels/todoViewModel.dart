import 'package:flutter/foundation.dart';
import 'package:reduxTest/actions/index.dart';
import 'package:reduxTest/models/index.dart';

@immutable
class TodoViewModel {
	final List<Todo> todos;
	final Function(String) onAddTodo;
	final Function(int, Todo) onUpdateTodo;
	final Function(int) onRemoveTodo;

	TodoViewModel(store) :
		todos = store.state.todos,
		onAddTodo = ((String content) {
			store.dispatch(AddTodoAction(content));
		}),
		onUpdateTodo = ((int id, Todo todo) {
			store.dispatch(UpdateTodoAction(id, todo));
		}),
		onRemoveTodo = ((int id) {
			store.dispatch(RemoveTodoAction(id));
		});
}