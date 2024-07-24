
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/providers/counter_provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Details'),),
      body: ListView(children: [
            const Center(child: Text('Counter', style: TextStyle(fontSize: 30.0),)),
              Center(child: Text('${counter.count}', style: TextStyle(fontSize: 30.0),)),
      ],),
    
    );
  }
}