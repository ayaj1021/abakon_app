import 'package:abakon/core/config/exception/logger.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

Future<void> mailSupport() async {
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map(
          (MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
        )
        .join('&');
  }

  final emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'support@abakon.ng',
    query: encodeQueryParameters(<String, String>{
      'subject': 'Feedback',
      'body': 'Feedback',
    }),
  );
  try {
    await launchUrl(emailLaunchUri);
  } catch (_) {
    debugLog(_.toString());
  }
}
