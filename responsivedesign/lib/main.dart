import 'package:flutter/material.dart';
import 'package:responsivedesign/screens/login_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    //home: const MyHomePage(title: 'Responsive Design'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Column(children: [
        Text('Start', style: TextStyle(fontSize: 24)), 
        Spacer(flex: 2,), 
        Text('Middle', style: TextStyle(fontSize: 24)), 
        Spacer(),
        Text('End', style: TextStyle(fontSize: 24))
      ],),

      // body: Wrap( 
      //     spacing: 8.0,
      //     runSpacing: 4.0,
      //     children: List.generate(10, (index){
      //       if(index == 4)
      //       {
      //          return Chip(label: Text('Unique text to illustrate how to use wrap ${index + 1}'),);
      //       }

      //        return Chip(label: Text('Item ${index + 1}'),);
      //     }),

      // )

      // body: GridView.count(
      //   crossAxisCount: screenWidth > 500 ? 4: 2, 
      //   children: List.generate(20, (index){
      //     return Container(color: Colors.green, 
      //         margin:const EdgeInsets.all(8.0),
      //         child: Center(child: Text("Item ${index}", style: TextStyle(fontSize: 24),), ),
      //     );

      //   }),
      // ),

      // body: OrientationBuilder(builder: (context, orientation){
      //   if(orientation == Orientation.portrait) 
      //   {
      //     return Center(child: Container(child: Text('I am in portrait mode', style: TextStyle(fontSize: 21),),));
      //   }
      //   else 
      //   {
      //         return Center(child: Container(child: Text('I am in landscape mode', style: TextStyle(fontSize: 21),),));
      //   }
      // }),

      // body: FittedBox(fit: BoxFit.contain,
      // child: Text("""Lorem Ipsum is simply dummy text of the printing"""),
      // ),


      // body: AspectRatio(aspectRatio: 16/9, 
      //     child: Container(color: Colors.green,),
      // ),

      // body: Row(children: [ 
      //   Flexible(flex: 3, child: Container(color: Colors.blue,),),
      //   Expanded(child: Container(color: Colors.red,))
      // ],),

      // body: LayoutBuilder(builder: (context, constraints)
      // {
      //   if(constraints.maxWidth > 500) 
      //   {
      //     return Container(color: Colors.green, child: Text('Above 500px'),);
      //   }
      //   else 
      //   {
      //     return Container(color: Colors.yellow, child: Text('Below 500px'),);
      //   }


      // }),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
