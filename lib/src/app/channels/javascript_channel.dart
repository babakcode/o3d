import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class JavascriptChannel {
  const JavascriptChannel(this.name, {required this.onMessageReceived});

  final String name;
  final ValueChanged<JavaScriptMessage> onMessageReceived;
}
