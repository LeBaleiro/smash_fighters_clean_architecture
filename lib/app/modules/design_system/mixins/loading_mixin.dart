import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../design_system_module.dart';

mixin LoadingMixin<T extends StatefulWidget> on State<T> {
  Store<dynamic, dynamic> get store;
  OverlayEntry? overlayEntry;
  Future<void> Function()? _observerDisposer;

  @override
  void dispose() async {
    super.dispose();
    await _observerDisposer?.call();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback(
      (timeStamp) {
        _observerDisposer = store.observer(onLoading: (isLoading) {
          if (isLoading) {
            overlayEntry = OverlayEntry(
              builder: (context) => Positioned.fill(
                child: Scaffold(
                  backgroundColor: Colors.black.withOpacity(0.2),
                  body: const Center(child: LoadingWidget()),
                ),
              ),
            );
            Overlay.of(context)?.insert(overlayEntry!);
          } else {
            overlayEntry?.remove();
            overlayEntry = null;
          }
        });
      },
    );
  }
}
