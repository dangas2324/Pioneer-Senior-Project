import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer manually
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildMenuItem(
              context,
              icon: Icons.star_border,
              title: 'Languages',
              subtitle: 'Menu description.',
              trailingIcon: Icons.keyboard_capslock,
            ),
            _buildMenuItem(
              context,
              icon: Icons.star_border,
              title: 'Words',
              subtitle: 'Menu description.',
              trailingIcon: Icons.keyboard_capslock,
            ),
            _buildMenuItem(
              context,
              icon: Icons.star_border,
              title: 'Studies',
              subtitle: 'Menu description.',
              trailingIcon: Icons.keyboard_capslock,
            ),
            const Divider(),
            _buildMenuItem(
              context,
              icon: Icons.sync,
              title: 'Sync Data',
              subtitle: 'Menu description.',
              trailingIcon: Icons.keyboard_capslock,
            ),
            _buildMenuItem(
              context,
                icon: Icons.settings,
              title: 'Settings',
              subtitle: 'Menu description.',
              trailingIcon: Icons.keyboard_capslock,
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Main Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required IconData trailingIcon,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
      trailing: Icon(trailingIcon, color: Colors.black),
      onTap: () {
        Navigator.pop(context); // Close the drawer
      },
    );
  }
}
