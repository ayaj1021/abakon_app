import 'package:json_annotation/json_annotation.dart';

part 'get_all_exam_data_response.g.dart';

@JsonSerializable()
class GetAllExamData {
  final String? status;
  final List<ExamData>? data;

  GetAllExamData({
    this.status,
    this.data,
  });

  factory GetAllExamData.fromJson(Map<String, dynamic> json) =>
      _$GetAllExamDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllExamDataToJson(this);
}

@JsonSerializable()
class ExamData {
  final int? eId;
  final String? examid;
  final String? provider;
  final int? price;
  final int? buyingPrice;
  final String? providerStatus;

  ExamData({
    this.eId,
    this.examid,
    this.provider,
    this.price,
    this.buyingPrice,
    this.providerStatus,
  });

  factory ExamData.fromJson(Map<String, dynamic> json) =>
      _$ExamDataFromJson(json);

  Map<String, dynamic> toJson() => _$ExamDataToJson(this);
}
