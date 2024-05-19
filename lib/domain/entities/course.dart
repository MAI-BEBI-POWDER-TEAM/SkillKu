import 'package:hive/hive.dart';

part 'course.g.dart';

@HiveType(typeId: 0)
class Course extends HiveObject {
  @HiveField(0)
  String? uuid;
  @HiveField(1)
  String title;
  @HiveField(2)
  String category;
  @HiveField(3)
  String thumbnail;
  @HiveField(4)
  String start;
  @HiveField(5)
  String end;

  Course({
    this.uuid,
    required this.title,
    required this.category,
    required this.thumbnail,
    required this.start,
    required this.end,
  });

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'title': title,
        'category': category,
        'thumbnail': thumbnail,
        'start': start,
        'end': end,
      };

  static Course fromJson(Map<dynamic, dynamic> json) => Course(
        uuid: json['uuid'],
        title: json['title'],
        category: json['category'],
        thumbnail: json['thumbnail'],
        start: json['start'],
        end: json['end'],
      );

  @override
  String toString() {
    return '''
      uuid: $uuid
      title: $title
      category: $category
      thumbnail: $thumbnail
      start: $start
      end: $end
    ''';
  }
}
