import 'package:skillku/data/local/course_db.dart';
import 'package:skillku/domain/entities/course.dart';
import 'package:skillku/domain/repositories/course_repository.dart';

class CourseUseCase extends CourseRepository {
  @override
  Future<List<Course>> getAllCourses() async {
    return await CourseDB.getAllCourse();
  }

  @override
  Future<Course?> getCourse({required String uuid}) async {
    return CourseDB.getCourseByUUID(uuid);
  }

  @override
  Future<void> addCourse({required Course course}) {
    return CourseDB.insertCourse(course);
  }
}
