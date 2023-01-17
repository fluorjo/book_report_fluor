import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  late String title;
  late String description;
  late String id;

  Book({
    required this.title,
    required this.description,
    required this.id,
  });

  Book.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
//as로 형변환해주는 것.
    id = snapshot.id;
    title = data['title'];
    description = data['description'];
  }

  Book.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    description = data['description'];
  }

  Map<String, dynamic> toSnapshot() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}
