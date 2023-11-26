import 'package:flutter/foundation.dart';

abstract class O3DControllerInterface {
  /// [customJsCode]
  /// See examples on https://modelviewer.dev/examples then add your desired
  /// javascript code
  void customJsCode(String code);

  /// [cameraOrbit] function
  /// Set the starting and/or subsequent orbital position of the camera.
  /// You can control the azimuthal, theta, and polar, phi, angles (phi is measured down from the top),
  /// and the radius from the center of the model. Accepts values of the form "$theta $phi $radius",
  /// like "10deg 75deg 1.5m". Also supports units in radians ("rad") for angles and centimeters ("cm") or
  /// millimeters ("mm") for camera distance. Camera distance can also be set as a percentage ('%'),
  /// where 100% gives the model tight framing within any window based on all possible theta and phi values.
  /// Any time this value changes from its initially configured value, the camera will interpolate from its current
  /// position to the new value. Any value set to 'auto' will revert to the default. For camera-orbit, camera-target
  /// and field-of-view, parts of the property value can be configured with CSS-like functions. The CSS calc() function
  /// is supported for these values, as well as a specialized form of the env() function. You can use env(window-scroll-y)
  /// anywhere in the expression to get a number from 0-1 that corresponds to the current top-level scroll position of the
  /// current frame. For example, a value like "calc(30deg - env(window-scroll-y) * 60deg) 75deg 1.5m" cause the camera to
  /// orbit horizontally around the model as the user scrolls down the page.
  void cameraOrbit(double theta, double phi, double radius);

  /// [cameraTarget] function
  /// Set the starting and/or subsequent point the camera orbits around.
  /// Accepts values of the form "$X $Y $Z", like "0m 1.5m -0.5m".
  /// Also supports units in centimeters ("cm") or millimeters ("mm").
  /// A special value "auto" can be used, which sets the target to
  /// the center of the model's bounding box in that dimension.
  /// Any time this value changes from its initially configured value,
  /// the camera will interpolate from its current position to the new value.
  void cameraTarget(double x, double y, double z);

  /// [logger] for testing package in release mode
  ValueChanged<Object>? logger;

  /// [animationName] for setting package animation name
  /// `setter` function
  set animationName(String? name);

  /// [cameraControls] for setting control on the camera or setting on
  /// default camera position
  /// `setter` func
  set cameraControls(bool? set);

  /// [autoRotate] for camera rotation
  /// `setter` func
  set autoRotate(bool? set);

  /// [autoPlay] for playing automatic animation
  /// `setter` func
  set autoPlay(bool? set);

  /// [variantName] for model material
  /// `setter` func
  set variantName(String? variantName);
  /// others will be added
}
