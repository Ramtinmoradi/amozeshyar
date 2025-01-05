import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

abstract class ToastNotifier {
  void showSuccess({required String message});
  void showError({required String message});
}

class FlutterToastNotifier implements ToastNotifier {
  @override
  void showSuccess({required String message}) {
    toastification.show(
      description: Text(message),
      direction: TextDirection.rtl,
      autoCloseDuration: Duration(seconds: 3),
      showProgressBar: false,
      style: ToastificationStyle.fillColored,
      type: ToastificationType.success,
    );
  }

  @override
  void showError({required String message}) {
    toastification.show(
      description: Text(message),
      direction: TextDirection.rtl,
      autoCloseDuration: Duration(seconds: 3),
      showProgressBar: false,
      style: ToastificationStyle.fillColored,
      type: ToastificationType.error,
      alignment: Alignment.topCenter,
    );
  }
}
