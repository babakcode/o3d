import 'package:webview_flutter/webview_flutter.dart';

import '../interfaces/o3d_controller_interface.dart';

class O3dImp implements O3DControllerInterface {
  final WebViewController? webViewController;
  O3dImp([this.webViewController]);

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
}
