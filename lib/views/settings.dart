import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_books_website_asif/bloc/theme_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Orange Theme'),
            onTap: () {
              context.read<ThemeBloc>().add(ThemeChanged(ThemeData(primarySwatch: Colors.orange)));
            },
          ),
          ListTile(
            title: const Text('Blue Theme'),
            onTap: () {
              context.read<ThemeBloc>().add(ThemeChanged(ThemeData(primarySwatch: Colors.blue)));
            },
          ),
          ListTile(
            title: const Text('Green Theme'),
            onTap: () {
              context.read<ThemeBloc>().add(ThemeChanged(ThemeData(primarySwatch: Colors.green)));
            },
          ),
        ],
      ),
    );
  }
}
