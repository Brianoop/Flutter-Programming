import 'package:flutter/material.dart';
import 'package:flutteranimations/screens/expansion_hero.dart';
import 'package:flutteranimations/screens/fade_in_animations.dart';
import 'package:flutteranimations/screens/hero_animation.dart';
import 'package:flutteranimations/screens/implicit_animation.dart';
import 'package:flutteranimations/screens/scale_animation.dart';
import 'package:flutteranimations/screens/size_transition_animation.dart';
import 'package:flutteranimations/screens/slide_transition_animation.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const SizeTransitionExampleApp(), 
     //home: FadeTransitionExampleApp(), 
     // home: SlideTransitionExampleApp()
     // home: ScaleAnimation(),
     //home: ImplicitAnimation(),
    // home: HeroAnimation(),
    home: RadialExpansionDemo(),
  

    );
  }
}

