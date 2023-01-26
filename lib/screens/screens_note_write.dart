import 'package:flutter/material.dart';

class note_write_screen extends StatelessWidget {
  const note_write_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'tessss',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w300,
          ),
        ),
        TextFormField(),
      ]),
    );
  }
}
