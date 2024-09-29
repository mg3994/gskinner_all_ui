import 'package:flutter/material.dart';

import '../routes/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Routes'),
      ),
      body: ListView.builder(
        itemCount: Routes.routes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(Routes.routes[index]),
            onTap: () {
              Navigator.pushNamed(context, Routes.routes[index]);
            },
          );
        },
      ),
    );
  }
}
