import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:reduxTest/actions/index.dart';
import 'package:reduxTest/models/index.dart';

import 'package:reduxTest/pages/todoItem.dart';

class HomePage extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text('Redux Example')
			),
			body: StoreConnector<AppState, _ViewModel>(
				converter: (Store<AppState> store) => _ViewModel(store),
				builder: (BuildContext context, _ViewModel viewModel) => ListView.builder(
					itemCount: viewModel.todos.length,
					itemBuilder: (BuildContext context, int index) => TodoItem(
						todo: viewModel.todos[index],
						onCheckboxChanged: (value) {
							viewModel.onUpdateTodo(viewModel.todos[index].id, viewModel.todos[index].copyWith(completed: value));
						},
						onDismissed: (direction) {
							viewModel.onRemoveTodo(viewModel.todos[index].id);
						}
					),
				),
			),
			floatingActionButton: FloatingActionButton(
				child: Icon(Icons.add),
				onPressed: () {
					Navigator.pushNamed(context, '/add');
				},
			),
		);
	}
}

class _ViewModel {
	final List<Todo> todos;
	final Function(String) onAddTodo;
	final Function(int, Todo) onUpdateTodo;
	final Function(int) onRemoveTodo;

	_ViewModel(store) :
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