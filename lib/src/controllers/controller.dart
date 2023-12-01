part of '../app/o3d.dart';

class O3DController implements O3DControllerInterface {

  late O3dDataSource _dataSource;

  @override
  void cameraOrbit(double theta, double phi, double radius) =>
      _dataSource.cameraOrbit(theta, phi, radius);

  @override
  void cameraTarget(double x, double y, double z) =>
      _dataSource.cameraTarget(x, y, z);

  @override
  void customJsCode(String code) => _dataSource.customJsCode(code);

  @override
  ValueChanged<Object>? logger;

  @override
  set animationName(String? set) => _dataSource.animationName = set;

  @override
  set autoRotate(bool? set) => _dataSource.autoRotate = set;

  @override
  set cameraControls(bool? set) => _dataSource.cameraControls = set;

  @override
  set variantName(String? set) => _dataSource.variantName = set;

  @Deprecated('use play() and pause() methods instead!')
  @override
  set autoPlay(bool? set) => _dataSource.autoPlay = set;

  @override
  Future<List<String>> availableAnimations() =>
      _dataSource.availableAnimations();

  @override
  void pause() => _dataSource.pause();

  @override
  void play({int? repetitions}) => _dataSource.play(repetitions: repetitions);
}
