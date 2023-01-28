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
          decoration: const InputDecoration(
            labelText: '노트',
            border: OutlineInputBorder(),
          ),
          maxLines: 100,
          minLines: 1,
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.save),
          label: const Text('저장'),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.delete),
          label: const Text('삭제'),
        )
      ],
    ));
  }
}
