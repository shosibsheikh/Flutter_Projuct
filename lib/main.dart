// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
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
//       theme: ThemeData(useMaterial3: true),
//       home: const HomePage(),
//     );
//   }
// }
//
// class Post {
//   final int id;
//   final String title;
//   final String body;
//
//   Post({required this.id, required this.title, required this.body});
//
//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       id: json['id'],
//       title: json['title'],
//       body: json['body'],
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
//   late Future<List<Post>> postsFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     postsFuture = fetchPosts();
//   }
//
//   Future<List<Post>> fetchPosts() async {
//     final response = await http.get(
//       Uri.parse('https://jsonplaceholder.typicode.com/posts'),
//     );
//
//     if (response.statusCode == 200) {
//       final List data = jsonDecode(response.body);
//       return data.map((e) => Post.fromJson(e)).toList();
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('API Data UI')),
//       body: FutureBuilder<List<Post>>(
//         future: postsFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//
//           if (snapshot.hasError) {
//             return Center(child: Text(snapshot.error.toString()));
//           }
//
//           final posts = snapshot.data!;
//
//           return ListView.builder(
//             padding: const EdgeInsets.all(12),
//             itemCount: posts.length,
//             itemBuilder: (context, index) {
//               return HoverCard(post: posts[index]);
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//
// class HoverCard extends StatefulWidget {
//   final Post post;
//   const HoverCard({super.key, required this.post});
//
//   @override
//   State<HoverCard> createState() => _HoverCardState();
// }
//
// class _HoverCardState extends State<HoverCard> {
//   bool isHover = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => isHover = true),
//       onExit: (_) => setState(() => isHover = false),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 200),
//         margin: const EdgeInsets.only(bottom: 12),
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(isHover ? 0.2 : 0.08),
//               blurRadius: isHover ? 20 : 8,
//               offset: const Offset(0, 6),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.post.title,
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               widget.post.body,
//               style: TextStyle(color: Colors.grey.shade700),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ===============================
// main.dart
// ===============================
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ImageProviderVM()..fetchImages(refresh: true),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}

// ===============================
// MODEL
// ===============================
class ImageItem {
  final String id;
  final String imageUrl;

  ImageItem({required this.id, required this.imageUrl});

  factory ImageItem.fromJson(Map<String, dynamic> json) {
    return ImageItem(
      id: json['id'],
      imageUrl: json['download_url'],
    );
  }
}

// ===============================
// PROVIDER (ViewModel)
// ===============================
class ImageProviderVM extends ChangeNotifier {
  final List<ImageItem> _images = [];
  bool isLoading = false;
  bool hasError = false;
  int page = 1;
  final int limit = 20;

  List<ImageItem> get images => _images;

  Future<void> fetchImages({bool refresh = false}) async {
    if (isLoading) return;

    if (refresh) {
      page = 1;
      _images.clear();
    }

    isLoading = true;
    hasError = false;
    notifyListeners();

    try {
      final res = await http.get(
        Uri.parse('https://picsum.photos/v2/list?page=$page&limit=$limit'),
      );

      if (res.statusCode == 200) {
        final List data = jsonDecode(res.body);
        final newItems = data.map((e) => ImageItem.fromJson(e)).toList();
        _images.addAll(newItems);
        page++;
      } else {
        hasError = true;
      }
    } catch (_) {
      hasError = true;
    }

    isLoading = false;
    notifyListeners();
  }
}

// ===============================
// UI
// ===============================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ImageProviderVM>();

    return Scaffold(
      appBar: AppBar(title: const Text('Image Grid API')),
      body: RefreshIndicator(
        onRefresh: () => vm.fetchImages(refresh: true),
        child: vm.hasError
            ? const ErrorView()
            : GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.75,
          ),
          itemCount: vm.images.length + (vm.isLoading ? 4 : 0),
          itemBuilder: (context, index) {
            if (index >= vm.images.length) {
              return const ShimmerCard();
            }

            if (index == vm.images.length - 2) {
              vm.fetchImages(); // pagination trigger
            }

            return ImageCard(item: vm.images[index]);
          },
        ),
      ),
    );
  }
}

// ===============================
// IMAGE CARD
// ===============================
class ImageCard extends StatelessWidget {
  final ImageItem item;
  const ImageCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: GridTile(
        footer: Container(
          padding: const EdgeInsets.all(8),
          color: Colors.black54,
          child: Text(
            'ID: ${item.id}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        child: Image.network(
          item.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// ===============================
// SHIMMER CARD
// ===============================
class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
// ===============================
// ERROR UI
// ===============================
class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<ImageProviderVM>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 12),
          const Text('Failed to load data'),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => vm.fetchImages(refresh: true),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}

