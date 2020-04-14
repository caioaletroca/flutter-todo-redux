import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:reduxTest/models/index.dart';
import 'package:reduxTest/viewModels/todoViewModel.dart';

import 'package:reduxTest/pages/todoItem.dart';

class HomePage extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text('Redux Example 2')
			),
			body: StoreConnector<AppState, TodoViewModel>(
				converter: (Store<AppState> store) => TodoViewModel(store),
				builder: (BuildContext context, TodoViewModel viewModel) => ListView.builder(
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
      bottomNavigationBar: TabSelect(),
		);
	}
}

class TabSelect extends StatefulWidget {
  @override
  _TabSelectState createState() => _TabSelectState();
}

class _TabSelectState extends State<TabSelect> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      backgroundColor: Theme.of(context).primaryColor,
      currentIndex: tabIndex,
      onTap: (index) {
        setState(() {
          tabIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Stats')),
      ]
    );
  }
}