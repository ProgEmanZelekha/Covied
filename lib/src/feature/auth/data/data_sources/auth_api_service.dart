
import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';
import 'package:untitled/src/core/preferences/constants.dart';


part 'auth_api_service.g.dart';

//flutter pub run build_runner build --delete-conflicting-outputs

@RestApi(baseUrl: baseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;


}
