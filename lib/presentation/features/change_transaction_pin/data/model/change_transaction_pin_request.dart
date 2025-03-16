class ChangeTransactionPinRequest {
  final String oldPin;
  final String newPin;
  final String confirmNewPin;

  ChangeTransactionPinRequest({
    required this.oldPin,
    required this.newPin,
    required this.confirmNewPin,
  });

  ChangeTransactionPinRequest copyWith({
    String? oldPin,
    String? newPin,
    String? confirmNewPin,
  }) =>
      ChangeTransactionPinRequest(
        oldPin: oldPin ?? this.oldPin,
        newPin: newPin ?? this.newPin,
        confirmNewPin: confirmNewPin ?? this.confirmNewPin,
      );

  factory ChangeTransactionPinRequest.fromJson(Map<String, dynamic> json) =>
      ChangeTransactionPinRequest(
        oldPin: json["old_pin"],
        newPin: json["new_pin"],
        confirmNewPin: json["confirm_new_pin"],
      );

  Map<String, dynamic> toJson() => {
        "old_pin": oldPin,
        "new_pin": newPin,
        "confirm_new_pin": confirmNewPin,
      };
}
