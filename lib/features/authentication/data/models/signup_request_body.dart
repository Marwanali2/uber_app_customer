import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_request_body.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  final String name;
  final String email;
  final String password;
  final String phone;
  String? blockState = 'false';
  SignUpRequestBody({
    this.blockState,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}
