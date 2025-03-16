class ChangeTransactionPinResponse {
  final bool? status;
  final String? msg;

  ChangeTransactionPinResponse({
    this.status,
    this.msg,
  });

  ChangeTransactionPinResponse copyWith({
    bool? status,
    String? msg,
  }) =>
      ChangeTransactionPinResponse(
        status: status ?? this.status,
        msg: msg ?? this.msg,
      );

  factory ChangeTransactionPinResponse.fromJson(Map<String, dynamic> json) =>
      ChangeTransactionPinResponse(
        status: json["status"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
      };
}
