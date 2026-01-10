import 'package:flutter/material.dart';
import 'index.dart';


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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white24),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
drawer: Drawer(
  child: ListView(
    children: [
      UserAccountsDrawerHeader(
          accountName: Text("Shoaib"),
          accountEmail: Text("shoaib@gmail.com"),
        currentAccountPicture: CircleAvatar(foregroundImage: AssetImage('assets/buy.png'),),
        otherAccountsPictures: [
          CircleAvatar(foregroundImage: AssetImage("assets/buy.png"),),
          CircleAvatar(foregroundImage: AssetImage("assets/buy.png"),)
        ],
      ),
      ListTile(
        leading: Icon(Icons.add_a_photo,color: Colors.amber,),
        title: Text("About"),
        onTap: (){},
      ),
      ListTile(
        leading: Icon(Icons.add_a_photo,color: Colors.amber,),
        title: Text("About"),
        onTap: (){},
      ),
      ListTile(
        leading: Icon(Icons.add_a_photo,color: Colors.amber,),
        title: Text("About"),
        onTap: (){},
      ),
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text("Labels",style: TextStyle(fontSize: 20,color: Colors.amber),),
      ),
      ListTile(
        leading: Icon(Icons.label_important_outline,color: Colors.amber,),
        title: Text("About",style: TextStyle(fontSize: 20,color: Colors.deepOrange),),
        onTap: (){},
      ),
      ListTile(
        leading: Icon(Icons.label_important_outline,color: Colors.amber,),
        title: Text("About",style: TextStyle(fontSize: 20,color: Colors.deepOrange),),
        onTap: (){},
      ),
      ListTile(
        leading: Icon(Icons.label_important_outline,color: Colors.amber,),
        title: Text("About",style: TextStyle(fontSize: 20,color: Colors.deepOrange),),
        onTap: (){},
      ),
    ],
  ),
),
      // body:Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //
      //     Image.asset(
      //       'assets/buy.png',
      //       width: 220,
      //       height: 220,
      //     ),
      //
      //     const SizedBox(height: 5),
      //
      //     ElevatedButton(
      //       child: const Text('Buy now'),
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => IndexPage(),
      //           ),
      //         );
      //       },
      //     ),
      //   ],
      // ),
      // body: Padding(
      //   padding: const EdgeInsets.all(16),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //
      //       Image.asset(
      //         'assets/buy.png',
      //         width: 120,
      //         height: 120,
      //       ),
      //
      //       const SizedBox(height: 10),
      //
      //       ElevatedButton(
      //         child: const Text('Buy now'),
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => IndexPage(),
      //             ),
      //           );
      //         },
      //       ),
      //       Image.asset(
      //         'assets/buy.png',
      //         width: 120,
      //         height: 120,
      //       ),
      //
      //       const SizedBox(height: 10),
      //
      //       ElevatedButton(
      //         child: const Text('Buy now'),
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => IndexPage(),
      //             ),
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // LEFT SIDE IMAGE
            Image.asset(
              'assets/buy.png',
              width: 120,
              height: 200,
              fit: BoxFit.cover,
            ),

            const SizedBox(width: 12),

            // RIGHT SIDE DETAIL BOX
            // Expanded(
            //   child: Container(
            //     height: 150,
            //     padding: const EdgeInsets.all(12),
            //     decoration: BoxDecoration(
            //       color: Colors.grey.shade200,
            //       borderRadius: BorderRadius.circular(8),
            //       border: Border.all(color: Colors.grey),
            //     ),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: const [
            //         Text(
            //           'Product Name',
            //           style: TextStyle(
            //             fontSize: 16,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         SizedBox(height: 6),
            //         Text(
            //           'Ye product ki short detail hai. Yahan description likho.',
            //         ),
            //         SizedBox(height: 10),
            //         Text(
            //           'Price: Rs 1500',
            //           style: TextStyle(fontWeight: FontWeight.w600),
            //         ),
            //       ],
            //     ),
            //
            //   ),
            // ),
            Expanded(
              child: Container(
                height: 200,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(0),
                  // border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text(
                      'Product Name',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      'Ye product ki short detail hai.',
                    ),
                    SizedBox(height: 10),
                            Text(
                              'Price: Rs 1500',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),

                    const SizedBox(height: 10),

                    // BUTTON INSIDE CONTAINER
                    SizedBox(
                      width: double.infinity, // full width button
                      child: ElevatedButton(
                        child: const Text('Buy now'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => IndexPage(),
                            ),
                          );
                        },
                      ),
                    ),

                  ],
                ),
              ),
            )

          ],
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
