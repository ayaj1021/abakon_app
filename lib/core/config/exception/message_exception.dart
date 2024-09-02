
import 'package:abakon/core/utils/strings.dart';


class MessageException implements Exception {
  MessageException({required this.message});
  final String message;

  @override
  String toString() {
    return message;
  }
}

extension ExceptionExtension on String? {
  MessageException get toException {
    return MessageException(
      message: this ?? Strings.genericErrorMessage,
    );
  }
}
