import 'dart:convert';
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:skillku/data/local/course_db.dart';
import 'package:skillku/domain/entities/course.dart';
import 'package:skillku/domain/usecase/course_usecase.dart';

class CourseController extends GetxController {
  late Box<Course> courseBox;

  RxList<Course> courseListRx = List<Course>.empty(growable: true).obs;
  CourseUseCase courseUseCase = CourseUseCase();
  DatabaseReference ref = FirebaseDatabase.instance.ref('/');

  @override
  void onInit() async {
    super.onInit();
    courseBox = CourseDB.courseBox;
  }

  // Future fetchAllCourseWithQuery(String query)

  Future fetchAllCourses() async {
    final snaps = await ref.child('courses').get();
    final List<Course> courseList = List.empty(growable: true);

    if (snaps.exists) {
      for (int i = 0; i < snaps.children.length; i++) {
        Map<String, dynamic> dataDecode = json.decode(
          jsonEncode(snaps.children.toList()[i].value),
        );

        String uuid = snaps.children.toList()[i].key.toString();

        Course course = Course(
          uuid: snaps.children.toList()[i].key.toString(),
          title: dataDecode['title'],
          category: dataDecode['category'],
          thumbnail: dataDecode['thumbnail'],
          start: dataDecode['startdate'],
          end: dataDecode['enddate'],
          description: dataDecode['description'],
          // start: DateFormat('dd MMMM yyyy HH:mm').format(
          //   DateTime.fromMillisecondsSinceEpoch(dataDecode['startdate'] * 1000),
          // ),
          // end: DateFormat('dd MMMM yyyy HH:mm').format(
          //   DateTime.fromMillisecondsSinceEpoch(dataDecode['enddate'] * 1000),
          // ),
        );

        courseList.add(course);

        if (CourseDB.getCourseByUUID(uuid) == null) {
          await CourseDB.insertCourse(course);
        } else {
          await CourseDB.updateCourse(
            courseBox.values.toList().indexWhere((e) => e.uuid == uuid),
            course,
          );
        }
      }

      courseListRx.assignAll(courseList);
      log(courseListRx.length.toString(), name: 'CourseList');

      return courseList;
    }
  }

  Future insertCourse({required Course course}) async {
    await courseUseCase.addCourse(course: course);
  }

  Future<List<Course>> getAllCourse() async {
    return await courseUseCase.getAllCourses();
  }

  Future<Course?> getCourse({required String uuid}) async {
    return await courseUseCase.getCourse(uuid: uuid);
  }
}
