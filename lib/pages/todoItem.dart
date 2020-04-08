import 'package:flutter/material.dart';

import 'package:reduxTest/models/index.dart';

/**
 * Creates the View for the Todo Item
 */
class TodoItem extends StatelessWidget {
	final Todo todo;
	final ValueChanged<bool> onCheckboxChanged;
	final DismissDirectionCallback onDismissed;

	TodoItem({
		@required this.todo,
		@required this.onCheckboxChanged,
		@required this.onDismissed,
	});

	@override
	Widget build(BuildContext context) {
		return Dismissible(
			background: Container(
				alignment: AlignmentDirectional.centerStart,
				color: Colors.red,
				child: Padding(
					padding: EdgeInsets.only(left: 28),
					child: Icon(
						Icons.delete,
						color: Colors.white,
					),
				),
			),
			onDismissed: onDismissed,
			key: Key(todo.id.toString()),
			child: ListTile(
				leading: Checkbox(
					value: todo.completed,
					onChanged: onCheckboxChanged,
				),
				title: Text(todo.content),
			),
		); 
	}
}
