import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:book_report_fluor/models/model_book.dart';

class ShelfProvider with ChangeNotifier {
  late CollectionReference shelfReference;
  List<Book> bookShelf = [];

  ShelfProvider({reference}) {
    shelfReference =
        reference ?? FirebaseFirestore.instance.collection('User');
  }

  Future<void> fetchBookOrCreateShelf(String uid) async {
    if (uid == '') {
      return;
    }
    final shelfReferenceUserID = await shelfReference.doc(uid).get();

    print('shelfReferenceUserID');
    print(shelfReferenceUserID);
    print('shelfReferenceUserID.data()');
    print(shelfReferenceUserID.data());
    print('shelfReferenceUserID.exists');
    print(shelfReferenceUserID.exists);

    // final allData = userBookshelf.docs.map((doc) => doc.data()).toList();
    // print('userBookshelf');
    // print(userBookshelf);
    // print(userBookshelf.runtimeType);

    // print('allData');
    // print(allData);
    // print(allData.runtimeType);
    if (shelfReferenceUserID.exists) {
      Map<String, dynamic> bookShelfMap =
          shelfReferenceUserID.data() as Map<String, dynamic>;
      print('-------bookShelfMap--------');
      print(bookShelfMap);
      print(bookShelfMap.runtimeType);
      List<Book> temp = [];
      for (var book in bookShelfMap['books']) {
        temp.add(Book.fromMap(book));
      }
      bookShelf = temp;
      notifyListeners();
    } else {
      await shelfReference.doc(uid).collection('myBookShelf')
      .doc('temp')
      .set({'temp': []});
      
      await shelfReference.doc(uid)
      .set({'tempDoc': []});

      notifyListeners();
      // await shelfReference.doc(uid).collection('myBookShelf').doc('dwe').delete();
    }
  }

  Future<void> addBookToShelf(String uid, Book book) async {
    bookShelf.add(book);
    Map<String, dynamic> bookShelfMap = {
      'books': bookShelf.map((book) {
        return book.toSnapshot();
      }).toList()
    };
    await shelfReference.doc(uid).set(bookShelfMap);
    notifyListeners();
  }

  Future<void> removeBookFromShelf(User? user, Book book) async {
    bookShelf.removeWhere((element) => element.id == book.id);
    Map<String, dynamic> bookShelfMap = {
      'books': bookShelf.map((book) {
        return book.toSnapshot();
      }).toList()
    };
    await shelfReference.doc(user!.uid).set(bookShelfMap);
    notifyListeners();
  }

  bool isBookInShelf(Book book) {
    return bookShelf.any((element) => element.id == book.id);
  }
}
