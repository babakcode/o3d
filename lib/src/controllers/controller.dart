part of '../app/o3d.dart';

class O3DController {

  late ControllerEntity _controllerEntity;
  late O3dDataSource _dataSource = O3dDataSource(_controllerEntity.webViewController);

  void _init(ControllerEntity controllerEntity) =>
      _controllerEntity = controllerEntity;

  set _initDataSource(O3dDataSource source){
    _dataSource = source;
  }

}