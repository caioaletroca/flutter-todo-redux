import 'package:reduxTest/actions/index.dart';
import 'package:reduxTest/models/index.dart';
import './todo.dart';

AppState appReducer(AppState state, action) => AppState(
	todos: todoReducer(state.todos, action),
);