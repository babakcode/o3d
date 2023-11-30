import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../interfaces/o3d_controller_interface.dart';

class O3dImp implements O3DControllerInterface {
  final WebViewController? webViewController;
  final String id;

  O3dImp({
    this.webViewController,
    required this.id,
  });

  @override
  void cameraOrbit(double theta, double phi, double radius) {
    webViewController?.runJavaScript('''(() => {
        cameraOrbit$id($theta, $phi, $radius); 
      })();
    ''');
  }

  @override
  void cameraTarget(double x, double y, double z) {
    webViewController?.runJavaScript('''(() => {
        cameraTarget$id($x, $y, $z); 
      })();
    ''');
  }

  @override
  void customJsCode(String code) {
    webViewController?.runJavaScript('''(() => {
        customEvaluate$id('$code'); 
      })();
    ''');
  }

  @override
  ValueChanged<Object>? logger;

  @override
  set animationName(String? name) {
    webViewController?.runJavaScript('''(() => {
        animationName$id('$name'); 
      })();
    ''');
  }

  @override
  set autoRotate(bool? set) {
    webViewController?.runJavaScript('''(() => {
        autoRotate$id($set); 
      })();
    ''');
  }

  @override
  set autoPlay(bool? set) {
    webViewController?.runJavaScript('''(() => {
        autoPlay$id($set); 
      })();
    ''');
  }

  @override
  set cameraControls(bool? set) {
    webViewController?.runJavaScript('''(() => {
        cameraControls$id($set); 
      })();
    ''');
  }

  @override
  set variantName(String? set) {
    webViewController?.runJavaScript('''(() => {
        variantName$id('$set'); 
      })();
    ''');
  }

  @override
  Future<List<String>> availableAnimations() async {
    final res = await webViewController?.runJavaScriptReturningResult(
        'document.querySelector(\'#$id\').availableAnimations');
    return jsonDecode(res as String).cast<String>();
  }

  @override
  void pause() {
    webViewController?.runJavaScript('''(() => {
        pause$id(); 
      })();
''');
  }

  @override
  void play({int? repetitions}) {
    webViewController?.runJavaScript('''(() => {
        play$id({repetitions: $repetitions}); 
      })();
''');
  }

}
