import 'package:flutter/material.dart';
import 'package:impacteers/layers/domain/repo_imp/user_details_imp_repo.dart';
import 'package:impacteers/layers/presentation/screens/user_list_screen.dart';

void main() {
  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'SF-Pro'),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
