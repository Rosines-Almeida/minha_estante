import 'dart:convert';

class BooksEntity {
  String title;
  int numberPage;
  String state;
  String? image;
  String uuid;

  BooksEntity({
    required this.title,
    required this.numberPage,
    required this.state,
    required this.uuid,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'numberPage': numberPage,
      'state': state,
      if (image != null) 'image': image,
      'uuid': uuid,
    };
  }

  factory BooksEntity.fromMap(Map<String, dynamic> map) {
    return BooksEntity(
      title: map['title'] as String,
      numberPage: map['numberPage'] as int,
      state: map['state'] as String,
      image: map['image'] != null ? map['image'] as String : null,
      uuid: map['uuid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BooksEntity.fromJson(String source) =>
      BooksEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<BooksEntity> fromJsonList(List<dynamic>? json) {
    return json?.map((item) => BooksEntity.fromJson(item)).toList() ?? [];
  }
}
