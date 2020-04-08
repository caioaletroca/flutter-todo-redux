import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:reduxTest/models/index.dart';
import 'package:reduxTest/reducers/index.dart';

// Components
import './app.dart';

void main() {
  runApp(App(
    store: Store<AppState>(
      appReducer,
      initialState: AppState.initialState(),
    ),
  ));
}