import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class bookDetailScreen extends StatelessWidget {
  final String bookTitle;
  final String bookThumbnail;
  final String bookContents;
  final List<dynamic> bookAuthors;

  late String uid = '';

  Future<void> getUid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getString('uid') ?? '';
  }

  bookDetailScreen({
    required this.bookTitle,
    required this.bookThumbnail,
    required this.bookContents,
    required this.bookAuthors,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    getUid();

    return Scaffold(
        appBar: AppBar(
          title: Text(bookTitle),
        ),
        body: Container(
          child: Column(
            children: [
              Image.network(
                bookThumbnail,
              ),
              const Padding(
                padding: EdgeInsets.all(3),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            bookTitle,
                            style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          '$bookAuthors',
                          style:
                              const TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.15,
                    padding: const EdgeInsets.all(10),
                    child: const Center(
                      child: Icon(
                        Icons.star,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(3),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: const [
                      Icon(
                        Icons.travel_explore,
                        //실제 서점 페이지로 링크되게 하기.
                        color: Colors.blue,
                      ),
                      Text(
                        '웹사이트',
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(
                        Icons.bookmark_border,
                        color: Colors.blue,
                      ),
                      Text(
                        '북마크',
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          fetchToShelf(uid);
                        },
                        icon: const Icon(
                          Icons.save,
                          color: Colors.blue,
                        ),
                      ),
                      const Text(
                        '서재에 저장',
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: Text(
                  bookContents,
                ),
              )
            ],
          ),
        ));
  }

  Future<void> fetchToShelf(String uid) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    Map<String, dynamic> bbb = {
      'books': 'qweeqwe',
      'title': bookTitle,
      'thumbnail': bookThumbnail,
    };

    await firestore.collection('bookShelf').doc(uid).set(bbb);
  }
}
  // final String bookTitle;
  // final String bookThumbnail;
  // final String bookContents ;
  // final List<dynamic> bookAuthors;
