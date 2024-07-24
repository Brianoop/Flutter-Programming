import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/providers/counter_provider.dart';
import 'package:statemanagement/providers/theme_provider.dart';
import 'package:statemanagement/screens/detail_screen.dart';
import 'package:statemanagement/screens/home_screen.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeModel.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(), 
        '/detail': (context) => const DetailScreen()
      },
    );
  }
}
