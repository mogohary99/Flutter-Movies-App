import 'package:flutter/material.dart';
import 'package:movies/movies/presentation/screens/movies_screen.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MoviesScreen(),
              ),
            );
          },
          child: const Text(
            'Navigator',
          ),
        ),
      ),
    );
  }
}
