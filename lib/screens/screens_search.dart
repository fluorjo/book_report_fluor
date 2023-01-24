import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:book_report_fluor/models/model_book.dart';
import '../screens/screens_book_detail.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String result = '';
  List? data;
  TextEditingController? _editingController;
  ScrollController? _scrollController;
  int page = 1;
  bool? isEnd;

  @override
  void initState() {
    super.initState();
    data = List.empty(growable: true);
    _editingController = TextEditingController();
    _scrollController = ScrollController();

    _scrollController!.addListener(() {
      if (_scrollController!.offset >=
              _scrollController!.position.maxScrollExtent &&
          !_scrollController!.position.outOfRange &&
          isEnd == false) {
        page++;
        getJSONData();
        print('bottom');
      } else if (_scrollController!.offset >=
              _scrollController!.position.maxScrollExtent &&
          !_scrollController!.position.outOfRange &&
          isEnd == true) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('마지막입니다')));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _editingController,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(hintText: '검색어를 입력하세요'),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                page = 1;
                data!.clear();
                getJSONData();
              },
              icon: const Icon(Icons.search_rounded))
        ],
      ),
      body: Container(
        child: Center(
          child: data!.isEmpty
              ? const Text(
                  '데이터가 없습니다.',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        child: InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              CachedNetworkImage(
                                imageUrl: data![index]['thumbnail'] == ''
                                    ? 'https://cdn-icons-png.flaticon.com/512/3875/3875148.png'
                                    : data![index]['thumbnail'],
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                width: 100,
                                height: 100,
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 150,
                                    child: Text(
                                      data![index]['title'].toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Text(
                                      '저자: ${data![index]['authors'].toString()}'),
                                  Text(
                                      '가격: ${data![index]['sale_price'].toString()}'),
                                  Text(
                                      '판매상태: ${data![index]['status'].toString()}'),
                                ],
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => bookDetailScreen(
                                  bookTitle: data![index]['title'].toString(),
                                  bookThumbnail: data![index]['thumbnail'],
                                  bookContents: data![index]['contents'],
                                  bookAuthors: data![index]['authors'],
                                ),
                              ),
                            );

              
                          },
                        ),
                      ),
                    );
                  },
                  itemCount: data!.length,
                  controller: _scrollController,
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          page = 1;
          data!.clear();
          getJSONData();
        },
        child: const Icon(Icons.file_download),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url =
        'https://dapi.kakao.com/v3/search/book?target=title&page=$page&query=${_editingController!.value.text}';
//나중에 작가로도 따로 검색하게 하거나 하는 게 나을까.

    var response = await http.get(Uri.parse(url),
        headers: {"Authorization": "KakaoAK cc88f89bd0a8b58cce4d732fac88b0e8"});
    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      List result = dataConvertedToJSON['documents'];
      isEnd = dataConvertedToJSON['meta']['is_end'];
      data!.addAll(result);
      print(isEnd);
    });
//  print(response.body);
//  print('data-------------- $data');
    return response.body;
  }
}
