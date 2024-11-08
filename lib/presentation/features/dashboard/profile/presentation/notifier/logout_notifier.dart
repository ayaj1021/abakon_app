import 'package:abakon/core/utils/enums.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final logoutProvider = StateProvider<ActivityStatus>(
  (ref) {
    return ActivityStatus.inApp;
  },
);
