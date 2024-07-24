import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/providers/counter_provider.dart';
import 'package:statemanagement/providers/theme_provider.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterProvider>(context);
    final themeModel = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('MultiProvider Example'),
        actions: [
          IconButton(
            icon: Icon(themeModel.isDarkTheme ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              themeModel.toggleTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: ${counter.count}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    counter.increment();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    counter.decrement();
                  },
                ),
              ],
            ),
           ElevatedButton(
      onPressed: () {
      Navigator.pushNamed(context, '/detail');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green, // Set the background color to green
        foregroundColor: Colors.white, // Set the text color to white
        elevation: 5, // Set the elevation
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Set the padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Set the rounded corner radius
        ),
      ),
      child: Text('Go to details'),
    )
          ],
        ),
      ),
    );
  }
}
