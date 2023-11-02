part of '../app/o3d.dart';

class O3DController implements O3DControllerInterface {
  late ControllerEntity _controllerEntity;
  late O3dDataSource _dataSource =
      O3dDataSource(_controllerEntity.webViewController);

  void _init(ControllerEntity controllerEntity) =>
      _controllerEntity = controllerEntity;

  set _initDataSource(O3dDataSource source) {
    _dataSource = source;
  }

  @override
  void cameraOrbit(double theta, double phi, double radius) {
    _dataSource.cameraOrbit(theta, phi, radius);
  }

  @override
  void cameraTarget(double x, double y, double z) {
    _dataSource.cameraTarget(x, y, z);
  }

  @override
  void customJsCode(String code) {
    _dataSource.customJsCode(code);
  }
}
