import 'package:dio/dio.dart';
import '../mocks/mock_interceptor';

class DioClient {
  static final Dio _dio = Dio()..interceptors.add(MockInterceptor());

  static Dio get instance => _dio;
}
