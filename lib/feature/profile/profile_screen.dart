import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState>? parentScaffoldKey;

  const ProfileScreen({super.key, this.parentScaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Profile Screen'),
          ],
        ),
      ),
    );
  }
}
