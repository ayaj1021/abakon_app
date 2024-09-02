import 'package:abakon/core/extensions/overlay_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


extension NavigationExtension on BuildContext {
  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);
  }

  Future<T?> replaceNamed<T extends Object?, E extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this).pushReplacementNamed<T, E>(
      routeName,
      arguments: arguments,
    );
  }

  Future<T?> replaceAll<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  Future<T?> push<T extends Object?>(Route<T> route) {
    return Navigator.of(this).push<T>(route);
  }

  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return Navigator.of(this).popAndPushNamed<T, TO>(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    Route<T> newRoute, {
    TO? result,
  }) {
    return Navigator.of(this).pushReplacement<T, TO>(
      newRoute,
      result: result,
    );
  }

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return Navigator.of(this).pushReplacementNamed<T, TO>(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  void popUntil(bool Function(Route<dynamic>) predicate) {
    Navigator.of(this).popUntil(predicate);
  }

  void pop<T>([T? result]) {
    return Navigator.of(this).pop<T>(result);
  }
}



extension CopyToClipboard on BuildContext {
  void copyToClipboard(String value) {
    Clipboard.setData(ClipboardData(text: value)).then(
      (value) => this.showToast(message: 'Copied to clipboard'),
    );
  }
}