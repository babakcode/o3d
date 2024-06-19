import 'dart:math';

class Utils {
  final random = Random();

  String get generateId =>
      'BabakCode${random.nextInt(99999)}${random.nextInt(99999)}';

  String relatedJs({required String id}) => '''
  const o3d$id = document.querySelector('#$id');
  const defaultCameraOrbit$id = o3d$id.cameraOrbit;
customJsCode$id = (code) => { eval(code) }
customEvaluateWithResult$id = (code) => { return eval(code) }
  ''';

  /// Covert tuple string to list
  /// [tupleToList]
  static String tupleToList(String input) {
    String trimmedString = input.trim();
    if (trimmedString.isNotEmpty && trimmedString.length > 2) {
      if (trimmedString[0] == '(') {
        trimmedString = trimmedString.replaceFirst('(', '[');
      }
      if (trimmedString[trimmedString.length - 1] == ')') {
        trimmedString =
            '${trimmedString.substring(0, trimmedString.length - 2)}]';
      }
      return trimmedString;
    } else {
      return '[]';
    }
  }
}
