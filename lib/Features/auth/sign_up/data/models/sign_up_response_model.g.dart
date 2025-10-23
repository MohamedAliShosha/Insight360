// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponseModel _$SignUpResponseModelFromJson(Map<String, dynamic> json) =>
    SignUpResponseModel(
      RegisterData.fromJson(json['data'] as Map<String, dynamic>),
      json['status'] as bool,
      (json['code'] as num).toInt(),
      message: json['message'] as String,
    );

RegisterData _$RegisterDataFromJson(Map<String, dynamic> json) => RegisterData(
      token: json['token'] as String,
      username: json['username'] as String,
    );
