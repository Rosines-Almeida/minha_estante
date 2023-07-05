import 'dart:convert';

import 'package:minha_estante/enum/book_state_enum.dart';

class BooksEntity {
  String title;
  int numberPage;
  // StateBook state;
  String? image;

  String uuid;
  int numberPageRead;

  BooksEntity({
    required this.title,
    required this.numberPage,
    // required this.state,
    required this.uuid,
    this.image,
    this.numberPageRead = 0,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'numberPage': numberPage,
      // 'state': state,
      if (image != null) 'image': image,
      'uuid': uuid,
      'numberPageRead': numberPageRead,
    };
  }

  factory BooksEntity.fromMap(Map<String, dynamic> map) {
    return BooksEntity(
      title: map['title'] as String,
      numberPage: map['numberPage'] as int,
      // state: map['state'],
      image: map['image'] != null ? map['image'] as String : null,
      uuid: map['uuid'] as String,
      numberPageRead: map['numberPageRead'] as int,
    );
  }

  static List<BooksEntity> fromJsonList(List<dynamic>? json) {
    return json?.map((item) => BooksEntity.fromMap(item)).toList() ?? [];
  }
}
