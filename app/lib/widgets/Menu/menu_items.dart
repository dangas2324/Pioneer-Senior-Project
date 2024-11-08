import 'package:flutter/material.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
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
          route: '/selectLanguages', // Route for Languages
        ),
        _buildMenuItem(
          context,
          icon: Icons.star_border,
          title: 'Words',
          subtitle: 'Menu description.',
          trailingIcon: Icons.keyboard_capslock,
          route: '/words', // Route for Words
        ),
        _buildMenuItem(
          context,
          icon: Icons.star_border,
          title: 'Studies',
          subtitle: 'Menu description.',
          trailingIcon: Icons.keyboard_capslock,
          route: '/studies', // Route for Studies
        ),
        const Divider(),
        _buildMenuItem(
          context,
          icon: Icons.sync,
          title: 'Sync Data',
          subtitle: 'Menu description.',
          trailingIcon: Icons.keyboard_capslock,
          route: '/sync', // Route for Sync Data
        ),
        _buildMenuItem(
          context,
          icon: Icons.settings,
          title: 'Settings',
          subtitle: 'Menu description.',
          trailingIcon: Icons.keyboard_capslock,
          route: '/settings', // Route for Settings
        ),
      ],
    );
  }

  Widget _buildMenuItem(BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required IconData trailingIcon,
    required String route, // Add route parameter
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
        Navigator.pushNamed(context, route); // Navigate to the specified route
      },
    );
  }
}