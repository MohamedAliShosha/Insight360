// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_api_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpErrorModel _$SignUpErrorModelFromJson(Map<String, dynamic> json) =>
    SignUpErrorModel(
      message: json['message'] as String,
      data: (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      status: json['status'] as bool,
      code: (json['code'] as num).toInt(),
    );
