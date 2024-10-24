// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_exam_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllExamData _$GetAllExamDataFromJson(Map<String, dynamic> json) =>
    GetAllExamData(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ExamData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllExamDataToJson(GetAllExamData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

ExamData _$ExamDataFromJson(Map<String, dynamic> json) => ExamData(
      eId: (json['eId'] as num?)?.toInt(),
      examid: json['examid'] as String?,
      provider: json['provider'] as String?,
      price: (json['price'] as num?)?.toInt(),
      buyingPrice: (json['buyingPrice'] as num?)?.toInt(),
      providerStatus: json['providerStatus'] as String?,
    );

Map<String, dynamic> _$ExamDataToJson(ExamData instance) => <String, dynamic>{
      'eId': instance.eId,
      'examid': instance.examid,
      'provider': instance.provider,
      'price': instance.price,
      'buyingPrice': instance.buyingPrice,
      'providerStatus': instance.providerStatus,
    };
