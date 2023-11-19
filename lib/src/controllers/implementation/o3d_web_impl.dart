import 'package:flutter/material.dart';

import '../../app/fake/js_fake.dart' if (dart.library.js) 'dart:js';
import 'package:webview_flutter/webview_flutter.dart';
import '../interfaces/o3d_controller_interface.dart';

class O3dImp implements O3DControllerInterface {
  final WebViewController? webViewController;
  O3dImp({this.webViewController});

  @override
  void cameraOrbit(double theta, double phi, double radius) {
    context.callMethod("cameraOrbit", [theta, phi, radius]);
  }

  @override
  void cameraTarget(double x, double y, double z) {
    context.callMethod("cameraTarget", [x, y, z]);
  }

  @override
  void customJsCode(String code) {
    context.callMethod("customEvaluate", [code]);
  }

  @override
  ValueChanged<Object>? logger;

  @override
  set animationName(String? set) {
    context.callMethod("animationName", [set]);
  }

  @override
  set autoRotate(bool? set) {
    context.callMethod("autoRotate", [set]);
  }

  @override
  set cameraControls(bool? set) {
    context.callMethod("cameraControls", [set]);
  }
}
