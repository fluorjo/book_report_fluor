import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:book_report_fluor/models/model_book.dart';

class ShelfProvider with ChangeNotifier {
  late CollectionReference shelfReference;
  List<Book> bookShelf = [];

  ShelfProvider({reference}) {
    shelfReference =
        reference ?? FirebaseFirestore.instance.collection('bookShelf');
  }

  Future<void> fetchBookOrAddShelf(String uid, String bookTitleForDoc) async {
    if (uid == '') {
      return;
    }
    final userBookshelf =
        await shelfReference.doc(uid).collection('myBookShelf').get();
  
    final allData = userBookshelf.docs.map((doc) => doc.data()).toList();

    print('allData');
    print(allData);
    // if (userBookshelf.exists) {
    //   Map<String, dynamic> bookShelfMap =
    //       userBookshelf.data() as Map<String, dynamic>;
    //   print('-------bookShelfMap--------');
    //   print(bookShelfMap);
    //   print(bookShelfMap.runtimeType);
    //   List<Book> temp = [];
    //   for (var book in bookShelfMap['books']) {
    //     temp.add(Book.fromMap(book));
    //   }
    //   bookShelf = temp;
    //   notifyListeners();
    // } else {
    //   await shelfReference.doc(uid).set({'books': []});
    //   notifyListeners();
    // }
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
