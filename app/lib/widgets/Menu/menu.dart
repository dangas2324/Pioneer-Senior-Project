import 'package:app/widgets/Menu/menu_items.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0), // Add padding from the right
      child: GestureDetector(
        onTap: () => showPopover(
          context: context,
          bodyBuilder: (context) => const SingleChildScrollView(
            child: MenuItems(),
          ),
          direction: PopoverDirection.left, // Adjust the direction to pop out to the left
          width: 200, // Adjust the width as needed
          height: 500, // Adjust the height as needed
          arrowHeight: 15, // Adjust the arrow height as needed
          arrowWidth: 30, // Adjust the arrow width as needed
        ),
        child: const Icon(Icons.menu, color: Colors.white),
      ),
    );
  }
}