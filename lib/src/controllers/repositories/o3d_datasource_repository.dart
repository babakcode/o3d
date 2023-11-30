import 'package:flutter/material.dart';
import 'package:o3d/src/controllers/interfaces/o3d_controller_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../implementation/o3d_stub_impl.dart'
    if (dart.library.js) "../implementation/o3d_web_impl.dart";

class O3dDataSource implements O3DControllerInterface {
  final O3dImp _o3dImp;

  WebViewController? webViewController;
  String id;

  O3dDataSource({this.webViewController, required this.id})
      : _o3dImp = O3dImp(webViewController: webViewController, id: id);

  @override
  void cameraOrbit(double theta, double phi, double radius) =>
      _o3dImp.cameraOrbit(theta, phi, radius);

  @override
  void cameraTarget(double x, double y, double z) =>
      _o3dImp.cameraTarget(x, y, z);

  @override
  void customJsCode(String code) => _o3dImp.customJsCode(code);

  @override
  ValueChanged<Object>? logger;

  @override
  set animationName(String? name) => _o3dImp.animationName = name;

  @override
  set autoRotate(bool? set) => _o3dImp.autoRotate = set;

  @override
  set autoPlay(bool? set) => _o3dImp.autoPlay = set;

  @override
  set cameraControls(bool? set) => _o3dImp.cameraControls = set;

  @override
  set variantName(String? set) => _o3dImp.variantName = set;

  @override
  Future<List<String>> availableAnimations() => _o3dImp.availableAnimations();

  @override
  void pause() => _o3dImp.pause();

  @override
  void play({int? repetitions}) => _o3dImp.play(repetitions: repetitions);
}
