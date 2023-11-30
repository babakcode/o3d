import 'dart:math';

class Utils {
  final random = Random();

  String get generateId =>
      'BabakCode${random.nextInt(99999)}${random.nextInt(99999)}';

  String relatedJs({required String id}) => """
cameraOrbit$id = (a, b, c) => {document.querySelector('#$id').cameraOrbit = `\${a}deg \${b}deg \${c}m`}
cameraTarget$id = (x, y, z) => {document.querySelector('#$id').cameraTarget = `\${x}m \${y}m \${z}m`}
customEvaluate$id = (code) => { eval(code) }
animationName$id = (set) => { document.querySelector('#$id').setAttribute('animation-name', set); }
availableAnimations$id = (set) => { return document.querySelector('#$id').availableAnimations; }
autoRotate$id = (set) => { document.querySelector('#$id').setAttribute('auto-rotate', set ?? false); }
autoPlay$id = (set) => { (set ?? false) ? document.querySelector('#$id').play() : document.querySelector('#$id').pause(); }
cameraControls$id = (set) => { document.querySelector('#$id').setAttribute('camera-controls', set ?? false); }
variantName$id = (set) => { document.querySelector('#$id').variantName = set; }
play$id = ({repetitions}) => { document.querySelector('#$id').play({repetitions}); }
pause$id = () => { document.querySelector('#$id').pause(); }
""";
}
