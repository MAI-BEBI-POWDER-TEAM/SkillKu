import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:skillku/domain/entities/course.dart';

class CourseDB {
  static Box<Course> courseBox = Hive.box<Course>('course_box');

  static Future<void> init() async {
    await Hive.openBox<Course>('course_box');
  }

  static Future<List<Course>> getAllCourse() async => courseBox.values.toList();

  static Course? getCourseByUUID(String uuid) =>
      courseBox.values.toList().firstWhereOrNull((e) => uuid == e.uuid);

  static Future<void> insertCourse(Course course) async {
    await courseBox.add(course);
  }

  static Future<void> updateCourse(
    int index,
    Course course,
  ) async {
    await courseBox.putAt(index, course);
  }
}
