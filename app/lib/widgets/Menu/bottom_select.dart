import 'package:app/screens/screens.dart';
import 'package:flutter/material.dart';
export 'package:app/screens/add_edit_word.dart';

class BottomSelect extends StatelessWidget {
  const BottomSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFF07394B),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pushNamed(
                '/search',
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.home, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pushNamed(
                '/',
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.add, color: Color(0xFF6FED6D)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddEditWord(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}