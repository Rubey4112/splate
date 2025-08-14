import 'package:flutter/material.dart';
import 'package:splate/pages/people_page/people_page.dart';
import 'package:splate/pages/calculation_page/calculation_page.dart';
import 'package:provider/provider.dart';
import 'package:splate/providers/people_list_provider.dart';

void main() {
  runApp(SplateApp());
}

class SplateApp extends StatelessWidget {
  const SplateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PeopleListProvider(),
      child: MaterialApp(
        title: 'Splate',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: PeoplePage(),
        routes: {
          '/people_page': (context) => PeoplePage(),
          '/calculation_page': (context) => CalculationPage(),
        },
      ),
    );
  }
}
