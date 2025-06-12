import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../domain/model/exercise.dart';
part 'exercises_api.g.dart';

@RestApi(baseUrl: 'https://api.api-ninjas.com/v1/')
abstract class ExercisesApi {
  factory ExercisesApi(Dio dio, {String baseUrl}) = _ExercisesApi;

  @GET("exercises")
  Future<List<Exercise>> fetchExercises(
    @Header("X-Api-Key") String apiKey,
    @Query("muscle") String? muscle,
    @Query("type") String? type,
  );
}
