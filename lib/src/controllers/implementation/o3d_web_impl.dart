import 'package:flutter/material.dart';
import '../../app/fake/js_fake.dart' if (dart.library.js) 'dart:js';
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
    context.callMethod("cameraOrbit$id", [theta, phi, radius]);
  }

  @override
  void cameraTarget(double x, double y, double z) {
    context.callMethod("cameraTarget$id", [x, y, z]);
  }

  @override
  void customJsCode(String code) {
    context.callMethod("customEvaluate$id", [code]);
  }

  @override
  ValueChanged<Object>? logger;

  @override
  set animationName(String? set) {
    context.callMethod("animationName$id", [set]);
  }

  @override
  set autoRotate(bool? set) {
    context.callMethod("autoRotate$id", [set]);
  }

  @override
  set autoPlay(bool? set) {
    context.callMethod("autoPlay$id", [set]);
  }

  @override
  set cameraControls(bool? set) {
    context.callMethod("cameraControls$id", [set]);
  }

  @override
  set variantName(String? variantName) {
    context.callMethod("variantName$id", [variantName]);
  }

  @override
  Future<List<String>> availableAnimations() async =>
      ((await context.callMethod("availableAnimations$id"))).cast<String>();

  @override
  void pause() => context.callMethod("pause$id");

  @override
  void play({int? repetitions}) => context.callMethod("customEvaluate$id", [
        '''(() => { play$id({repetitions: $repetitions}); })();'''
      ]);
}
