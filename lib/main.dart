import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/simple_bloc_observer.dart';

import 'ui/pages/splash_screen/splash_screen.dart';

void main() {
  Bloc.observer = GlobalBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}