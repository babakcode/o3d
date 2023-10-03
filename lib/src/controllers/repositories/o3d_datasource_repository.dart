import 'package:o3d/src/controllers/interfaces/o3d_controller_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../implementation/o3d_stub_impl.dart'
    if (dart.platform.js) "../implementation/o3d_web_impl.dart";

class O3dDataSource implements O3DControllerInterface {
  final O3dImp o3dImp;

  final WebViewController? webViewController;

  O3dDataSource([this.webViewController]) : o3dImp = O3dImp(webViewController);

  @override
  void cameraOrbit(double theta, double phi, double radius) =>
      o3dImp.cameraOrbit(theta, phi, radius);

  @override
  void cameraTarget(double x, double y, double z) =>
      o3dImp.cameraTarget(x, y, z);

  @override
  void customJsCode(String code) => o3dImp.customJsCode(code);
}
