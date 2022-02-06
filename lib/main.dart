import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tery_app/consts.dart';
import 'package:tery_app/app.dart';
import 'package:bloc/bloc.dart';
import 'package:tery_app/simple_bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()), blocObserver: SimpleBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: MainConsts.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}
