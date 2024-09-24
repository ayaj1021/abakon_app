
import 'package:abakon/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';


part 'base_response.g.dart';

@immutable
@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  const BaseResponse({
    required this.status,
    this.data,
    this.msg,
  }) : super();

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$BaseResponseFromJson(json, fromJsonT);
  }

  factory BaseResponse.fromMap(Map<String, dynamic> json) {
    return BaseResponse(
      data: json['data'] as T?,
      status: json['status'] as String? ?? '',
      msg: json['msg'] as String? ?? Strings.genericErrorMessage,
    );
  }
  final T? data;
  @JsonKey(name: 'status')
  final String status;
  final String? msg;

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);

  @override
  String toString() {
    return '''BaseResponse{status: $status, data: $data, message: $msg, }''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BaseResponse<T> &&
        other.status == status &&
        other.data == data &&
        other.msg == msg;
  }

  @override
  int get hashCode {
    return status.hashCode ^ data.hashCode ^ msg.hashCode;
  }
}


//retrofit - for network request
//json_serializable - for json serialization
//json annotation - for json serialization