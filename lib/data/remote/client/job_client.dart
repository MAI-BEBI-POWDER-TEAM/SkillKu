import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:skillku/data/failed.dart';
import 'package:skillku/data/remote/api_endpoint.dart';
import 'package:skillku/data/remote/response/job.dart';
import 'package:skillku/utils/secret.dart';

class JobClient {
  final Dio dio;

  JobClient({required this.dio});

  Future<Either<Failed, Job>> getAllJob() async {
    try {
      final response = await dio.getUri(
        Uri.https(baseUrl, getJobSearch, {
          'engine': 'google_jobs',
          'q': 'indonesia',
          'hl': 'en',
          'api_key': jobApiKey,
        }),
      );

      if (response.statusCode == 200) {
        return Right(Job.fromJson(response.data));
      } else {
        throw '${response.statusCode}: ${response.statusMessage}';
      }
    } on DioException catch (e) {
      log(e.toString(), name: 'JobClient');
      return Left(Failed('Failed to get data'));
    }
  }

  Future<Either<Failed, Job>> getJobBySearch(String query) async {
    try {
      final response = await dio.getUri(
        Uri.https(baseUrl, getJobSearch, {
          'engine': 'google_jobs',
          'q': 'indonesia+$query',
          'hl': 'en',
          'api_key': jobApiKey,
        }),
      );

      if (response.statusCode == 200) {
        return Right(Job.fromJson(response.data));
      } else {
        throw '${response.statusCode}: ${response.statusMessage}';
      }
    } on DioException catch (e) {
      log(e.toString(), name: 'JobClient');
      return Left(Failed('Failed to get data'));
    }
  }
}
