import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:book_report_fluor/models/model_book.dart';

class ShelfProvider with ChangeNotifier {
  late CollectionReference userReference;
  late CollectionReference shelfReference;
  List<Book> booksInShelf = [];

  ShelfProvider({reference}) {
    userReference = reference ?? FirebaseFirestore.instance.collection('User');
  }

  Future<void> fetchBookOrCreateShelf(String uid) async {
    if (uid == '') {
      return;
    }
    final shelfReferenceUserID = await userReference.doc(uid).get();
    shelfReference = userReference.doc(uid).collection('myBookShelf');
    final UserBookShelfJQSnapshot =
        await userReference.doc(uid).collection('myBookShelf').get();
    final BookListOfShelf =
        UserBookShelfJQSnapshot.docs.map((doc) => doc.data()).toList();
    for (var sss in BookListOfShelf) {
      print(sss.runtimeType);
      print('================sss.runtimeType');
    }

    if (shelfReferenceUserID.exists) {
      // Map<String, dynamic> bookShelfMap =
      //     shelfReferenceUserID.data() as Map<String, dynamic>;
      // print('-------bookShelfMap--------');
      // print(bookShelfMap);
      // print(bookShelfMap.runtimeType);

      print('-------shelfReference--------');
      print(shelfReference);
      List<Book> temp = [];
      for (var book in BookListOfShelf) {
        temp.add(Book.fromMap(book));
      }
      booksInShelf = temp;
      notifyListeners();
    } else {
      await userReference
          .doc(uid)
          .collection('myBookShelf')
          .doc('temp')
          .set({'temp': []});

      await userReference.doc(uid).set({'tempDoc': []});

      notifyListeners();
      // await userReference.doc(uid).collection('myBookShelf').doc('dwe').delete();
    }
  }

  // Future<void> addBookToShelf(String uid, Book book) async {
  //   bookShelf.add(book);
  //   Map<String, dynamic> bookShelfMap = {
  //     'books': bookShelf.map((book) {
  //       return book.toSnapshot();
  //     }).toList()
  //   };
  //   await userReference.doc(uid).set(bookShelfMap);
  //   notifyListeners();
  // }

  // Future<void> removeBookFromShelf(User? user, Book book) async {
  //   bookShelf.removeWhere((element) => element.id == book.id);
  //   Map<String, dynamic> bookShelfMap = {
  //     'books': bookShelf.map((book) {
  //       return book.toSnapshot();
  //     }).toList()
  //   };
  //   await userReference.doc(user!.uid).set(bookShelfMap);
  //   notifyListeners();
  // }

  // bool isBookInShelf(Book book) {
  //   return booksInShelf.any((element) => element.id == book.id);
  // }
}
