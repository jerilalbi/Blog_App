import 'package:blog_app/presentation/Widgets/AppBarTitle.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const AppBarTitle(),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              print("c;icke");
            },
          )
        ],
        backgroundColor: Colors.grey[850],
      ),
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}
