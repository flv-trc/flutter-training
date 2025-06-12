import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../data/exercises_api.dart';
import 'model/exercise.dart';

final exerciseProvider = FutureProvider.autoDispose
    .family<List<Exercise>, Map<String, String>>((ref, params) async {
      final dio = Dio();
      final api = ExercisesApi(dio);
      const apiKey = "fS3HQUMt1GBrpgN6cSX4uw==MWgltCBoLe4yPrp6";

      final result = await api.fetchExercises(
        apiKey,
        params['muscle'],
        params['type'],
      );

      return result;
    });
