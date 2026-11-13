import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodels/cruise_viewmodel.dart';
import 'views/screens/cruise_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CruiseViewModel(),
      child: const RajangRiverCruiseApp(),
    ),
  );
}

class RajangRiverCruiseApp extends StatelessWidget {
  const RajangRiverCruiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CruiseViewModel>(
      builder: (context, viewModel, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rajang River Cruise',

          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
            ),
            useMaterial3: true,
          ),

          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),

          themeMode: viewModel.isDarkMode
              ? ThemeMode.dark
              : ThemeMode.light,

          home: const CruiseScreen(),
        );
      },
    );
  }
}
