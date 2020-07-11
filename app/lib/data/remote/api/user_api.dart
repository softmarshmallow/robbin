import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:robbin/data/local/constants/api_constants.dart';

part 'user_api.g.dart';

@RestApi(baseUrl: API_URL_USER)
abstract class UserApi {
  factory UserApi(Dio dio, {String baseUrl}) = _UserApi;

  @POST("/signup")
  Future<void> postStartAuth(@Body() SignupRequest request);
}

@JsonSerializable()
class SignupRequest {
  SignupRequest({this.name});

  String name;

  factory SignupRequest.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}
