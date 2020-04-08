import 'package:redux/redux.dart';
import 'package:reduxTest/actions/todo.dart';
import 'package:reduxTest/models/todo.dart';

final todoReducer = combineReducers<List<Todo>>([
	TypedReducer<List<Todo>, AddTodoAction>(_addTodo),
	TypedReducer<List<Todo>, UpdateTodoAction>(_updateTodo),
	TypedReducer<List<Todo>, RemoveTodoAction>(_removeTodo),
	TypedReducer<List<Todo>, ClearTodoAction>(_clearTodo),
]);

List<Todo> _addTodo(List<Todo> state, AddTodoAction action) {
	return List.from(state)..add(Todo(id: action.id, content: action.content));
}

List<Todo> _updateTodo(List<Todo> state, UpdateTodoAction action) {
	return state.map((todo) => todo.id == action.id ? action.todo : todo).toList();
}

List<Todo> _removeTodo(List<Todo> state, RemoveTodoAction action) {
	return state.where((todo) => todo.id != action.id).toList();
}

List<Todo> _clearTodo(List<Todo> state, ClearTodoAction action) {
	return List.unmodifiable([]);
}