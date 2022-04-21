import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_cubits.dart';
import 'app_cubit_states.dart';
import '../screens/welcome_screen.dart';
import '../screens/navscreens/home_screen.dart';
import '../screens/detail_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if (state is WelcomeState) {
          return const WelcomeScreen();
        } else if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoadedState) {
          return const HomeScreen();
        } else if (state is DetailState) {
          return const DetailPage();
        } else {
          return Container();
        }
      },
    ));
  }
}
