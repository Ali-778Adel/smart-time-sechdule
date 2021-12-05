import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo/constants/Bloc_Observer.dart';

import 'layout/AppHomePage.dart';

void main() {

  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(),
      home: AppHomePage(),
    );
  }
}
