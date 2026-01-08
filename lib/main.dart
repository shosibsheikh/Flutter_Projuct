import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RippleScreen(),
    );
  }
}

class RippleScreen extends StatefulWidget {
  const RippleScreen({super.key});

  @override
  State<RippleScreen> createState() => _RippleScreenState();
}

class _RippleScreenState extends State<RippleScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final List<double> radii = [120, 180, 240, 300];
  final List<Color> colors = [
    Colors.blue,
    Colors.pink,
    Colors.orange,
    Colors.green,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Multi Color Ripple")),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            return Stack(
              alignment: Alignment.center,
              children: [
                // Ripple circles
                for (int i = 0; i < radii.length; i++)
                  Container(
                    width: radii[i] * _controller.value,
                    height: radii[i] * _controller.value,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors[i].withOpacity(
                        1 - _controller.value,
                      ),
                    ),
                  ),

                // Center Text
                const Text(
                  "Flutter",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
