import 'package:flutter/material.dart';

class bookDetailScreen extends StatelessWidget {
  final String bookTitle;

  const bookDetailScreen({
    required this.bookTitle,
  });

  @override
  Widget build(BuildContext context, ) {
    return Scaffold(
        appBar: AppBar(
          title: Text(bookTitle),
        ),
        body: Container(
          child: Column(
            children: [
              Image.network(
                'https://picsum.photos/250/250',
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
                        const Text(
                          '책 부제목? 설명?',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
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
                        Icons.call,
                        color: Colors.blue,
                      ),
                      Text(
                        '아이콘',
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(
                        Icons.near_me,
                        color: Colors.blue,
                      ),
                      Text(
                        '아이콘',
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
                        '아이콘',
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: const Text(
                  '책 상세 설명',
                ),
              )
            ],
          ),
        ));
  }
}
