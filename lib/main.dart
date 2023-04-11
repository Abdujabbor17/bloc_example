import 'package:bloc_pattern/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/create/create_bloc.dart';
import 'bloc/home/home_bloc.dart';
import 'bloc/update/update_bloc.dart';

void main() {
  runApp(


  MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => HomeBloc()),
      BlocProvider(create: (context) => UpdateBloc()),
      BlocProvider(create: (context) => CreateBloc()),
    ],

      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (context) => HomeBloc(),
          child: const HomePage()),

    );
  }
}

