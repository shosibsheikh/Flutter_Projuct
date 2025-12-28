// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter App',
//       theme: ThemeData(
//         // Apply your custom font globally
//         fontFamily: 'Poppins',
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
//         useMaterial3: true,
//       ),
//       home: const HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   // Colors List (Add or remove colors as you want)
//   final List<Color> _colors = [
//     Colors.deepPurple,
//     Colors.amber,
//     Colors.teal,
//     Colors.cyanAccent,
//   ];
//
//   int _currentIndex = 0;
//
//   void _toggleColor() {
//     setState(() {
//       _currentIndex = (_currentIndex + 1) % _colors.length;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Flutter App"),
//       ),
//       body: Center(
//         child: Container(
//           width: 200,
//           height: 300,
//           color: _colors[_currentIndex],
//           child: const Center(
//             child: Text(
//               "Flutter App",
//               style: TextStyle(
//                 color: Colors.black87,
//                 fontSize: 23,
//                 fontWeight: FontWeight.w600,
//                 fontStyle: FontStyle.italic,
//                 letterSpacing: 0.5,
//               ),
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _toggleColor,
//         icon: const Icon(Icons.color_lens),
//         label: const Text("Change Color"),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  void _incrementCounter() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 11),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // Container(
                      //   margin: EdgeInsets.only(right: 11),
                      //   width: 200,
                      //   height: 300,
                      //   color: Colors.green,
                      //
                      // ),
                      Container(
                        margin: const EdgeInsets.only(right: 11),
                        width: 200,
                        height: 300,
                        color: Colors.greenAccent,
                        alignment: Alignment.center,
                        child: const Text(
                          'Green Box',
                          style: TextStyle(color: Colors.brown, fontSize: 30, fontWeight: FontWeight.w700,fontStyle: FontStyle.italic),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(right: 11),
                        width: 200,
                        height: 300,
                        color: Colors.red,
                        alignment: Alignment.center,
                        child: const Text(
                          'red Box',
                          style: TextStyle(color: Colors.amber, fontSize: 30, fontWeight: FontWeight.w700,fontStyle: FontStyle.italic),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 11),
                        width: 200,
                        height: 300,
                        color: Colors.yellow,
                        alignment: Alignment.center,
                        child: const Text(
                          'yellow Box',
                          style: TextStyle(color: Colors.lightGreenAccent, fontSize: 30, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 11),
                        width: 200,
                        height: 300,
                        color: Colors.green,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 11),
                        width: 200,
                        height: 300,
                        color: Colors.deepOrangeAccent,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 11),
                width: 200,
                height: 200,
                color: Colors.blueAccent,
                alignment: Alignment.center,
                child: const Text(
                  'Blue Box',
                  style: TextStyle(color: Colors.brown, fontSize: 30, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 11),
                width: 200,
                height: 200,
                color: Colors.red,
                child: const Text('Red Box',style: TextStyle(color: Colors.black12,fontSize: 30,fontWeight: FontWeight.w700),),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 11),
                width: 200,
                height: 200,
                color: Colors.purple,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 11),
                width: 200,
                height: 200,
                color: Colors.grey,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 11),
                width: 200,
                height: 200,
                color: Colors.lime,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 11),
                width: 200,
                height: 200,
                color: Colors.brown,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 11),
                width: 200,
                height: 200,
                color: Colors.cyan,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}