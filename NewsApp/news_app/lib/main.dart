import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Screens/home_screen.dart';

import 'Data/Cubits/cubit/news_app_cubit.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  MaterialColor mycolor = MaterialColor(
    Color.fromRGBO(255, 58, 68, 1).value,
    <int, Color>{
      50: Color.fromRGBO(255, 58, 68, 0.1),
      100: Color.fromRGBO(255, 58, 68, 0.2),
      200: Color.fromRGBO(255, 58, 68, 0.3),
      300: Color.fromRGBO(255, 58, 68, 0.4),
      400: Color.fromRGBO(255, 58, 68, 0.5),
      500: Color.fromRGBO(255, 58, 68, 0.6),
      600: Color.fromRGBO(255, 58, 68, 0.7),
      700: Color.fromRGBO(255, 58, 68, 0.8),
      800: Color.fromRGBO(255, 58, 68, 0.9),
      900: Color.fromRGBO(255, 58, 68, 1),
    },
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsAppCubit>(
          create: (BuildContext context) => NewsAppCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: mycolor,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
