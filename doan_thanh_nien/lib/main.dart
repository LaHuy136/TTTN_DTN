import 'package:doan_thanh_nien/bloc/activity_bloc.dart';
import 'package:doan_thanh_nien/bloc/event_bloc.dart';
import 'package:doan_thanh_nien/bloc/home_bloc.dart';
import 'package:doan_thanh_nien/bloc/login_bloc.dart';
import 'package:doan_thanh_nien/bloc/profile_bloc.dart';
import 'package:doan_thanh_nien/bloc/signup_bloc.dart';
import 'package:doan_thanh_nien/bloc/update_bloc.dart';
import 'package:doan_thanh_nien/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc/drawer_bloc.dart';
import 'bloc/event/drawer_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ActivityDetailBloc()),
        BlocProvider(create: (context) => HomeBloc('All')),
        BlocProvider(
            create: (context) => DrawerBloc()..add(LoadUserDataEvent())),
        BlocProvider(create: (context) => LoginBloc(context)),
        BlocProvider(create: (context) => SignUpBloc()),
        BlocProvider(create: (context) => UpdateBloc()),
        BlocProvider(create: (context) => ProfileBloc(prefs: prefs)),
        BlocProvider(create: (context) => EventBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Đoàn Thanh Niên',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
