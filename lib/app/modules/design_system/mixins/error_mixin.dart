import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

mixin ErrorMixin<T extends StatefulWidget> on State<T> {
  Store<dynamic, dynamic> get store;
  Future<void> Function()? _observerDisposer;

  @override
  void dispose() async {
    super.dispose();
    await _observerDisposer?.call();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _observerDisposer = store.observer(
        onError: (failure) {
          debugPrint("🔴 OCORREU UM ERRO - ${failure.message}");
          if (failure is DioError && failure.error is SocketException) return;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(failure.message)));
        },
      );
    });
  }
}
