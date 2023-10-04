import 'dart:math';

class Utils {
  final random = Random();

  String get generateId =>
      'babakcode-${random.nextInt(99999999)}-${random.nextInt(99999999)}';

  String relatedJs({required String id}) =>
      """var mainModelViewer = document.querySelector('#$id');
cameraOrbit = (a, b, c) => {mainModelViewer.cameraOrbit = `\${a}deg \${b}deg \${c}mm`}
cameraTarget = (x, y, z) => {mainModelViewer.cameraTarget = `\${x}mm \${y}mm \${z}mm`}
customEvaluate = (code) => { eval(code) }
""";
}
