import 'package:bloc_app/Screens/tasks_screen.dart';
import 'package:bloc_app/bloc/bloc/bloc/tasks_bloc.dart';
import 'package:bloc_app/bloc/bloc/color_bloc.dart';
import 'package:bloc_app/counterBloc.dart';
import 'package:bloc_app/next_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // BlocOverrides.runZoned(() => );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TasksBloc(),
        ),
        BlocProvider(
          create: (context) => ColorBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Home'),
      ),
    );
  }
}
