import 'package:skillku/domain/entities/course.dart';

abstract class CourseRepository {
  Future<List<Course>> getAllCourses();
  Future<Course?> getCourse({required String uuid});
  Future<void> addCourse({required Course course});
}
