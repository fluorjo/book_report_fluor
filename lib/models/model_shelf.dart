import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:book_report_fluor/models/model_book.dart';

class ShelfProvider with ChangeNotifier {
  late CollectionReference ShelfReference;
  List<Book> bookShelf = [];

  ShelfProvider({reference}){
    
  }
}
