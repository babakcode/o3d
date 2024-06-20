import 'dart:convert';
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
  /// [fixJsonIssue]
  static String? fixJsonIssue(String str, [bool normalAttempts = true]) {
    try {
      if (normalAttempts) {
        /// check can decode
        jsonDecode(str.trim());
        return str;
      }

      if (str.startsWith('(')) {
        /// this is a set
        final kv = str.substring(0, str.length - 1).substring(1).split(',');
        final List<String> pairs = [];

        for (int i = 0; i < kv.length; i++) {
          final thisKV = kv[i].replaceAll('"', '');
          pairs.add(thisKV.trim());
        }

        return json.encode(pairs);
      } else if (str.startsWith('[')) {
        /// this is a List

        final kv = str.substring(0, str.length - 1).substring(1).split(',');
        final List<String> pairs = [];

        for (int i = 0; i < kv.length; i++) {
          final thisKV = kv[i].replaceAll('"', '');
          pairs.add(thisKV.trim());
        }

        return json.encode(pairs);
      } else if (str.startsWith('{')) {
        /// this is a Map

        final kv = str.substring(0, str.length - 1).substring(1).split(',');
        final Map<String, String> pairs = {};

        for (int i = 0; i < kv.length; i++) {
          final thisKV = kv[i].split(":");
          pairs[thisKV[0].replaceAll('"', '').trim()] =
              thisKV[1].replaceAll('"', '').trim();
        }

        return json.encode(pairs);
      }
    } catch (e) {
      if (normalAttempts) {
        return fixJsonIssue(str, false);
      }
    }
    return null;
  }
}
