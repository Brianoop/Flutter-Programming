

import 'package:flutter/material.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero({super.key, 
    required this.photo, 
    this.onTap, 
    required this.width
  });

  final String photo;
  final VoidCallback? onTap;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell( 
              onTap: onTap,
              child: Image.asset(photo, fit: BoxFit.contain,),
          ),
          ),
        ),);
  }
}



class HeroAnimation extends StatelessWidget {
  const HeroAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero Animation'),),
      body: Center(
        child: PhotoHero(
          photo: 'assets/logo.jpeg',
           width: 100.0,
           onTap: (){
            Navigator.of(context).push(MaterialPageRoute<void>(builder: (context){
              return Scaffold(
                appBar: AppBar(title:const Text('Detail'),),
                body: Container(
                  color: Colors.lightBlueAccent,
                  padding:const EdgeInsets.all(16.0), 
                  alignment: Alignment.topLeft,
                  child: PhotoHero(
                    photo: 'assets/logo.jpeg', 
                    width: 400, 
                    onTap: () 
                    {
                      Navigator.of(context).pop();
                    },
                    ),
                ),
              
              );
            }));
           },
           ),
      ),
    );
  }
}