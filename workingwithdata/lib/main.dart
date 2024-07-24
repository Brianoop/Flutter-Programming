import 'package:flutter/material.dart';
import 'package:workingwithdata/helpers/routes.dart';
import 'package:workingwithdata/providers/post_provider.dart';
import 'package:workingwithdata/screens/post_detail.dart';
import 'package:workingwithdata/screens/posts_screen.dart';
import 'package:provider/provider.dart';




void main() {
  runApp(
    MultiProvider(
      providers: [ 
      ChangeNotifierProvider(create: (context) => PostProvider())
    ],
    child: const MyApp(),
    
    )
    
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Working With Data',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    //  home: const PostsScreen(),
    initialRoute: postsRoute,
    routes: {
     postsRoute:(context) => const PostsScreen(), 
     postDetailRoute: (context) => const PostDetailScreen()
    },
    );
  }
}
