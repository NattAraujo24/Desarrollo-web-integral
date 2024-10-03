import 'package:flutter/material.dart';

class Reservations extends StatelessWidget {
  const Reservations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservations'),
      ),
      body: const Center(
        child: Text ('Reservations'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/profile'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          child: const Icon(Icons.home)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
