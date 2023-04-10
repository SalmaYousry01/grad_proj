import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NotesTab extends StatelessWidget {
  const NotesTab({super.key});
  static const String routeName = 'NotesTab';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
      color: Colors.red,
      child: Center(child: Text('Notes')),
      ),
    );
  }
}