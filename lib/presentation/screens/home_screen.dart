import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/widgets/app_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Home'),
      body: const Center(child: Text('Welcome to the Home Screen')),
    );
  }
}
