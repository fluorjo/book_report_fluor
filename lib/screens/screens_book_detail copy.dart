import 'package:flutter/material.dart';

class bookDetailScreen extends StatelessWidget {
  final String bookTitle;
  final String bookThumbnail;
  final String bookContents;
  final List<dynamic> bookAuthors;

  const bookDetailScreen({
    required this.bookTitle,
    required this.bookThumbnail,
    required this.bookContents,
    required this.bookAuthors,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
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
                    children: const [
                      Icon(
                        Icons.save,
                        color: Colors.blue,
                      ),
                      Text(
                        '서재에 저장',
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      )
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
}
