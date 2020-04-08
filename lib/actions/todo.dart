import 'package:reduxTest/models/todo.dart';

class AddTodoAction {
	static int _id = 0;
	final String content;

	AddTodoAction(this.content) {
		_id++;
	}

	int get id => _id;

	String toString() {
		return 'AddTodoAction{id: ${id}, content: ${content}}';
	}
}


class UpdateTodoAction {
	final int id;
	final Todo todo;

	UpdateTodoAction(this.id, this.todo);

	String toString() {
		return 'UpdateTodoAction{id: ${id}, todo: ${todo}}';
	}
}

class RemoveTodoAction {
	final int id;

	RemoveTodoAction(this.id);

	String toString() {
		return 'RemoveTodoAction{id: ${id}}';
	}
}

class ClearTodoAction {}