import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../interfaces/o3d_controller_interface.dart';

class O3dImp implements O3DControllerInterface {
  final WebViewController? webViewController;
  O3dImp({
    this.webViewController,
  });

  @override
  void cameraOrbit(double theta, double phi, double radius) {
    webViewController?.runJavaScript('''(() => {
        cameraOrbit($theta, $phi, $radius); 
      })();
    ''');
  }

  @override
  void cameraTarget(double x, double y, double z) {
    webViewController?.runJavaScript('''(() => {
        cameraTarget($x, $y, $z); 
      })();
    ''');
  }

  @override
  void customJsCode(String code) {
    webViewController?.runJavaScript('''(() => {
        customEvaluate('$code'); 
      })();
    ''');
  }

  @override
  ValueChanged<Object>? logger;

  @override
  set animationName(String? name) {
    webViewController?.runJavaScript('''(() => {
        animationName('$name'); 
      })();
    ''');
  }

  @override
  set autoRotate(bool? set) {
    webViewController?.runJavaScript('''(() => {
        autoRotate($set); 
      })();
    ''');
  }

  @override
  set cameraControls(bool? set) {
    webViewController?.runJavaScript('''(() => {
        cameraControls($set); 
      })();
    ''');
  }
}
