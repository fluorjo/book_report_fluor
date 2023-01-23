class Book {
  late String title;
  late String description;
  late String id;
  late String thumbnail;

  Book({
    required this.title,
    required this.description,
    required this.id,
    required this.thumbnail,
  });

  Book.fromBookApi(ApiDataList) {
    Map<String, dynamic> data = ApiDataList.asMap();
//as로 형변환해주는 것.
    id = data['id'];
    title = data['title'];
    description = data['description'];
    thumbnail=data['thumbnail'];
  }

  Book.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    description = data['description'];
        thumbnail=data['thumbnail'];

  }

  Map<String, dynamic> toSnapshot() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'thumbnail':thumbnail,
    };
  }
}
