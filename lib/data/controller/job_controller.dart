import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:skillku/data/remote/client/job_client.dart';
import 'package:skillku/data/remote/response/job.dart';

class JobController extends GetxController {
  final _jobClient = JobClient(dio: Dio());

  Rx<Job?> jobObs = Job().obs;
  RxBool isLoading = false.obs;

  Future getAllJob() async {
    final response = await _jobClient.getAllJob();

    response.fold(
      (l) => log(l.message, name: 'job-controller'),
      (r) => jobObs.value = r,
    );

    return jobObs.value;
  }

  Future getJobBySearch(String query) async {
    final response = await _jobClient.getJobBySearch(query);

    response.fold(
      (l) => log(l.message, name: 'job-controller'),
      (r) => jobObs.value = r,
    );

    return jobObs.value;
  }
}
