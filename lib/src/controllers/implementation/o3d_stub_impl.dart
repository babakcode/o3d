import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:o3d/src/controllers/interfaces/o3d_controller_interface.dart';
import 'package:o3d/src/utils/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class O3dImp implements O3DControllerInterface {
  final WebViewController? webViewController;
  late String model;
  final String id;

  O3dImp({
    this.webViewController,
    required this.id,
  }) : model = 'o3d$id';

  @override
  void cameraOrbit(double theta, double phi, double radius) {
    customJsCode('$model.cameraOrbit = "${theta}deg ${phi}deg $radius%";');
  }

  @override
  void cameraTarget(double x, double y, double z) {
    customJsCode('$model.cameraTarget = "${x}m ${y}m ${z}m";');
  }

  @override
  ValueChanged<Object>? logger;

  @override
  set animationName(String? name) {
    if (name == null) {
      return customJsCode('$model.animationName = null;');
    }
    customJsCode('$model.animationName = "$name";');
  }

  @override
  set autoRotate(bool? set) {
    if (set == null) {
      return customJsCode('$model.autoRotate = null;');
    }
    customJsCode('$model.autoRotate = $set;');
  }

  @override
  set autoPlay(bool? set) {
    if (set == null) {
      return customJsCode('$model.autoPlay = null;');
    }
    customJsCode('$model.autoPlay = $set;');
  }

  @override
  set cameraControls(bool? set) {
    if (set == null) {
      return customJsCode('$model.cameraControls = null;');
    }
    customJsCode('$model.cameraControls = $set;');
  }

  @override
  set variantName(String? variantName) {
    if (variantName == null) {
      return customJsCode('$model.variantName = null;');
    }
    customJsCode('$model.variantName = "$variantName";');
  }

  @override
  Future<List<String>> availableAnimations() async {
    var res = await executeCustomJsCodeWithResult('$model.availableAnimations;');

    if (res is! String) {
      return [];
    }
    res = Utils.fixJsonIssue(res);
    if(res == null){
      return [];
    }
    return jsonDecode(res).cast<String>();
  }

  @override
  void pause() {
    customJsCode('$model.pause();');
  }

  @override
  void play({int? repetitions}) =>
      customJsCode('$model.play({repetitions: $repetitions});');

  @override
  Future<List<String>> availableVariants() async {
    var res = await executeCustomJsCodeWithResult('$model.availableVariants');
    if (res is! String) {
      return [];
    }
    res = Utils.fixJsonIssue(res);
    if(res == null){
      return [];
    }
    return jsonDecode(res).cast<String>();
  }

  @override
  void resetAnimation() {
    customJsCode('$model.pause();'
        '$model.currentTime = 0;'
        '$model.play();');
  }

  @override
  void resetCameraOrbit() {
    customJsCode('$model.cameraTarget = defaultCameraOrbit$id;');
  }

  @override
  void resetCameraTarget() {
    customJsCode('$model.cameraTarget = "auto auto auto";');
  }

  @override
  Future executeCustomJsCodeWithResult(String code) async {
    final result = await webViewController?.runJavaScriptReturningResult(code);
    return result;
  }

  @override
  void customJsCode(String code) {
    webViewController?.runJavaScript('''(() => {
        customJsCode$id('$code'); 
      })();
    ''');
  }
}
