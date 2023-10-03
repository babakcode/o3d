import 'dart:math';

class Utils {
  final random = Random();

  String get generateId => 'babakcode-${random.nextInt(99999999)}-${random.nextInt(99999999)}';

  String relatedJs({required String id}) =>
      """const mainModelViewer = document.querySelector('#$id');
cameraOrbit = (a, b, c) => {mainModelViewer.cameraOrbit = `\${a} \${b} \${c}`}
cameraTarget = (x, y, z) => {mainModelViewer.cameraTarget = `\${x} \${y} \${z}`}
customEvaluate = (code) => { eval(code) }
""";


}
