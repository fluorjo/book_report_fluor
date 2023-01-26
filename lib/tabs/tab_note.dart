import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NoteTab extends StatelessWidget {
  const NoteTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String memo = '';

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('노트 작성칸'),
        TextField(
          onChanged: (value) {
            memo = value;
          },
          decoration: InputDecoration(labelText: '노트'),
        ),
      ],
    ));
  }
}
