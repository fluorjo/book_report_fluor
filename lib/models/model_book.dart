class Book {
  late String title;
  late String authors;
  // late String id;
  late String thumbnail;
  

  Book({
    required this.title,
    required this.authors,
    // required this.id,
    required this.thumbnail,
  });

  @override
  String toString() => '타이틀은~ $title 작가는~ $authors 썸네일은~ $thumbnail';
  

  Book.fromBookApi(ApiDataList) {
    Map<String, dynamic> data = ApiDataList.asMap();
//as로 형변환해주는 것.
    // id = data['id'];
    title = data['title'];
    authors = data['authors'];
    thumbnail=data['thumbnail'];
  }

  Book.fromMap(Map<String, dynamic> data) {
    // id = data['id'];
    title = data['title'];
    authors = data['authors'];
        thumbnail=data['thumbnail'];

  }

  Map<String, dynamic> toSnapshot() {
    return {
      // 'id': id,
      'title': title,
      'authors': authors,
      'thumbnail':thumbnail,
    };
  }
}
