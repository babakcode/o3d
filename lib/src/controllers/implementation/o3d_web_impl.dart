
import 'dart:js';
import '../../entities/controller_entity.dart';
import '../interfaces/o3d_controller_interface.dart';

class O3dImp implements O3DControllerInterface{

  final ControllerEntity? entity;
  O3dImp([this.entity]);

  @override
  void cameraOrbit(double theta, double phi, double radius) {
    context.callMethod("cameraOrbit", [theta, phi, radius]);
  }

  @override
  void cameraTarget(double x, double y, double z) {
    context.callMethod("cameraTarget", [x, y, z]);
  }

  @override
  void customJsCode(String code) {
    context.callMethod("customEvaluate", [code]);
  }

}