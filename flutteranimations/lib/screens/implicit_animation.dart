

import 'package:flutter/material.dart';

class ImplicitAnimation extends StatefulWidget {
  const ImplicitAnimation({super.key});

  @override
  State<ImplicitAnimation> createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {

 bool _isPressed = false;

 void _togglePressed()
 {
  setState(() {
    _isPressed = !_isPressed;
  });
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Implicit Animationn'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              AnimatedContainer(
                duration: const Duration(seconds: 2), 
                height: 200,
                width: 200,
                margin: EdgeInsets.only(top: _isPressed ? 70.0 : 0.0),
                decoration: BoxDecoration(
                  color: _isPressed ? Colors.yellow : Colors.green, 
                  borderRadius: BorderRadius.circular(_isPressed ? 50.0 : 0.0)
                ),
                ),
               const SizedBox(height: 40.0,),
                ElevatedButton(
                  onPressed: _togglePressed, 
                  child: const Text('Press Me'))
        ],),
      ),
      
      
      );
  }
}