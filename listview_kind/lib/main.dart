// import 'package:flutter/material.dart';
//
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
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: const MyHomePage(title: 'Flutter'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final List<String> usrname = [
//     'Ali',
//     'Ahmed',
//     'Hamza',
//     'Hassan',
//     'Bilal',
//     'Zain',
//     'Umar',
//     'Faheem',
//     'Hamza',
//     'Hassan',
//     'Bilal',
//     'Zain'
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       // body: ListView.separated(
//       //   scrollDirection: Axis.horizontal,
//       //   itemCount: usrname.length,
//       //   itemBuilder: (context, index) {
//       //     return Container(
//       //       width: 150,
//       //       alignment: Alignment.center,
//       //       child: Text(
//       //         usrname[index],
//       //         style: const TextStyle(fontSize: 24),
//       //       ),
//       //     );
//       //   },
//       //   separatorBuilder: (context, index) {
//       //     return const VerticalDivider(
//       //       thickness: 3,
//       //       color: Colors.red,
//       //       width: 20,
//       //     );
//       //   },
//       // ),
//
//       //   Height add
//       // body: SizedBox(
//       //   height: 120,
//       //   child: ListView.separated(
//       //     scrollDirection: Axis.horizontal,
//       //     itemCount: usrname.length,
//       //     itemBuilder: (context, index) {
//       //       return Container(
//       //         width: 140,
//       //         alignment: Alignment.center,
//       //         color: Colors.blue.shade100,
//       //         child: Text(
//       //           usrname[index],
//       //           style: const TextStyle(fontSize: 22, color: Colors.indigo),
//       //         ),
//       //       );
//       //     },
//       //     separatorBuilder: (context, index) {
//       //       return const VerticalDivider(
//       //         width: 20,
//       //         thickness: 3,
//       //         color: Colors.red,
//       //       );
//       //     },
//       //   ),
//       // ),
//
//       // horizontal
//       // body: SizedBox(
//       //   height: 60, // height of row
//       //   child: ListView.separated(
//       //     scrollDirection: Axis.horizontal,
//       //     itemCount: usrname.length,
//       //     itemBuilder: (context, index) {
//       //       return Container(
//       //         alignment: Alignment.center,
//       //         padding: const EdgeInsets.symmetric(horizontal: 10),
//       //         child: Text(
//       //           usrname[index],
//       //           style: const TextStyle(fontSize: 24),
//       //         ),
//       //       );
//       //     },
//       //     separatorBuilder: (context, index) => const SizedBox(width: 20),
//       //   ),
//       // ),
//
//       //  vertical
//       body: ListView.separated(
//         itemCount: usrname.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             child: Text(
//               usrname[index],
//               style: const TextStyle(fontSize: 24),
//             ),
//           );
//         },
//         separatorBuilder: (context, index) => const Divider(
//           color: Colors.red,
//           thickness: 2,
//         ),
//       ),
//
//
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: const Icon(Icons.add),
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final List<String> usrname = [
      'Ali',
      'Ahmed',
      'Hamza',
      'Hassan',
      'Bilal',
      'Zain',
      'Umar',
      'Faheem',
      'Bilal',
      'Zain',
      'Umar',
      'Faheem'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          // Horizontal List
          SizedBox(
            height: 60,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: usrname.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.blue.shade100,
                  child: Text(
                    usrname[index],
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 15),
            ),
          ),

          const Divider(thickness: 2, color: Colors.black),

          // Vertical List
          Expanded(
            child: ListView.separated(
              itemCount: usrname.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    usrname[index],
                    style: const TextStyle(fontSize: 24),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                color: Colors.red,
                thickness: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
