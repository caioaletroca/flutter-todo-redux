import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import './models/index.dart';

// Pages
import './home.dart';
import './addTodoPage.dart';

class App extends StatelessWidget {
	final Store<AppState> store;

	App({ this.store });

	@override
	Widget build(BuildContext context) {
		return StoreProvider<AppState>(
			store: store,
			child: MaterialApp(
				title: 'Redux Test',
				debugShowCheckedModeBanner: false,
				theme: ThemeData(
					primarySwatch: Colors.orange,
				),
				initialRoute: '/',
				routes: {
					'/': (context) => HomePage(),
					'/add': (context) => AddTodoPage(),
				}
			),
    );
	}
}
