import 'package:flutter/foundation.dart';
import './todo.dart';

class AppState {
	final List<Todo> todos;

	AppState({
		@required this.todos,
	});

	AppState.initialState() : todos = List.unmodifiable(<Todo>[
		Todo(id: 1, content: 'Deu bom 1'),
		Todo(id: 2, content: 'Deu bom 2'),
		Todo(id: 3, content: 'Deu bom 3')
	]);
}