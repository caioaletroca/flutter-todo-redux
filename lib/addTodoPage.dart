import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:reduxTest/models/index.dart';
import 'package:reduxTest/viewModels/todoViewModel.dart';

class AddTodoPage extends StatefulWidget {
	@override
	_AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
	static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

	// Form Properties
	String _content;

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: Text('Add Todo')),
			body: Padding(
				padding: EdgeInsets.all(16),
				child: Form(
					key: _formKey,
					child: ListView(
						children: [
							TextFormField(
								initialValue: '',
								autofocus: true,
								decoration: InputDecoration(
									hintText: 'Task name...',
								),
								validator: (value) {
									return value.trim().isEmpty ? 'This field can not be empty' : null;
								},
								onSaved: (value) => _content = value,
							),
						],
					),
				),
			),
			floatingActionButton: StoreConnector<AppState, TodoViewModel> (
				converter: (Store<AppState> store) => TodoViewModel(store),
				builder: (BuildContext context, TodoViewModel viewModel) => FloatingActionButton(
					tooltip: 'Save new task',
					child: Icon(Icons.check),
					onPressed: () {
						if(_formKey.currentState.validate()) {
							_formKey.currentState.save();
							viewModel.onAddTodo(_content);
							Navigator.pop(context);
						}
					},
				),
			),
		);
	}
}