# O3D - Model Viewer for Flutter

This is a [Flutter](https://flutter.dev) widget for rendering interactive
3D models in the [glTF](https://www.khronos.org/gltf/) and [GLB](https://wiki.fileformat.com/3d/glb/) formats.
The widget embeds Google's [`<model-viewer>`](https://modelviewer.dev)
web component in a [WebView](https://pub.dev/packages/webview_flutter).

## Features

1. `O3DController controller = O3DController();`
2. cameraTarget: use **controller.cameraTarget(20, 20, 5)** `x, y, z`
3. cameraOrbit: use **controller.cameraOrbit(1.2, 1, 4)** `(theta)deg, (phi)deg, (radius)m`
4. availableAnimations: use **controller.availableAnimations().then((animations) => log("Available animations: $animations"));**
5. play: use **controller.play()** `[optional] repetitions` => `play(repetitions: 2)`
6. pause: use **controller.pause()**
7. Renders glTF and GLB models. (Also, [USDZ] models on iOS 12+.)
8. Supports animated models, with a configurable auto-play setting.
9. Optionally supports launching the model into an [AR] viewer.
10. Optionally auto-rotates the model, with a configurable delay.
11. Supports a configurable background color for the widget.

[USDZ]: https://graphics.pixar.com/usd/docs/Usdz-File-Format-Specification.html

[AR]:   https://en.wikipedia.org/wiki/Augmented_reality


## Screenshot

online demo 1: [https://babakcode.github.io/ui_3d_test/](https://babakcode.github.io/ui_3d_test/) / [source code](https://babakcode.github.io/ui_3d_test/example)

online demo 2: [https://babakcode.github.io/ui_3d_flutter/](https://babakcode.github.io/ui_3d_flutter/) / [source code](https://github.com/babakcode/ui_3d_flutter)

<img src="https://assets.babakcode.com/flutter/projects/ui_3d_flutter/shoe.gif" alt="Flutter 3d model" width="45%" loading="lazy"/> <img src="https://assets.babakcode.com/flutter/projects/ui_3d_flutter/zombie.gif" alt="Flutter 3d model" width="45%" loading="lazy"/>

## projects
<div style="overflow-x: scroll">

| projects | babak code                                                                                                                                                       | Tassio Gustavo                                                                                                                                                                                                                                                                                     | besenior - Mohammad Aghajani                                                                                                                                                                                                                  | Vaibhav Chandolia                                                                                                                                                                                         |
|----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| image    | <a href="https://youtu.be/-W45PQ__SAk" target="_blank"><img src="https://img.youtube.com/vi/-W45PQ__SAk/0.jpg" alt="BabakCode" width="100%" loading="lazy"/></a> | <a href="https://www.linkedin.com/posts/tassiogustavo_flutter-dart-ugcPost-7131042089257103361-0LY_?utm_source=share&utm_medium=member_desktop" target="_blank"><img src="https://assets.babakcode.com/flutter/projects/ui_3d_flutter/scared.gif" alt="BabakCode" width="30%" loading="lazy"/></a> | <a href="https://youtube.com/shorts/4Ys7vt2bIvw?si=tQBPWVWrB7l8Dozn" target="_blank"><img src="https://assets.babakcode.com/flutter/projects/ui_3d_flutter/besenior.png" alt="besenior - Mohammad Aghajani" width="30%" loading="lazy" /></a> | <a href="https://youtu.be/DTenaCTOSzE?si=ChoTTGnx9smY70ds" target="_blank"><img src="https://img.youtube.com/vi/DTenaCTOSzE/0.jpg" alt="Vaibhav Chandolia youtube video" width="30%" loading="lazy"/></a> |
| links    | <a href="https://youtu.be/-W45PQ__SAk" target="_blank">youtube video link</a>                                                                                    | <a href="https://www.linkedin.com/posts/tassiogustavo_flutter-dart-ugcPost-7131042089257103361-0LY_?utm_source=share&utm_medium=member_desktop" target="_blank">linkedin post link</a>                                                                                                             | <a href="https://youtube.com/shorts/4Ys7vt2bIvw?si=tQBPWVWrB7l8Dozn" target="_blank">Youtube persian content (besenior) - Mohammad Aghajani</a>                                                                                               | <a href="https://youtu.be/DTenaCTOSzE?si=ChoTTGnx9smY70ds" target="_blank">Youtube channel</a>                                                                                                            |

</div>
## Installation

in `pubspec.yaml`

```yaml
dependencies:
  o3d: ^3.1.0
```

### `AndroidManifest.xml` (Android 9+ only)

**Test on `real device`** and to use this widget on Android 9+ devices, your app must be permitted to make an HTTP connection
to `http://localhost:XXXXX`.
Android 9 (API level 28) changed the default for [`android:usesCleartextTraffic`] from `true`
to `false`,
so you will need to configure your app's `android/app/src/main/AndroidManifest.xml` as follows:

```diff

+    <uses-permission android:name="android.permission.INTERNET"/>

     <application
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher"
        android:label="example"
+       android:usesCleartextTraffic="true">
        <activity
            android:name=".MainActivity"
```

This does not affect Android 8 and earlier.

### `app/build.gradle` (Android only)

Change minSdkVersion to 21.

    defaultConfig {
        ...
        minSdkVersion 21
        ...
    }

### `Info.plist` (iOS only)

To use this widget on iOS, you need to opt-in to the embedded views preview
by adding a boolean property to your app's `ios/Runner/Info.plist` file, with
the key `io.flutter.embedded_views_preview` and the value `YES`:

```xml

<key>io.flutter.embedded_views_preview</key><true />
```

### `web/index.html` (Web only)

Modify the `<head>` tag of your `web/index.html` to load the JavaScript, like so:

```html
<head>
    <!-- Other stuff -->
    <script type="module" src="./assets/packages/o3d/assets/model-viewer.min.js" defer></script>
</head>
```

## Compatibility

- Android
- iOS (AR View may not available on iOS 16+)
- Web, with [a recent system browser version](https://modelviewer.dev/#section-browser-support).


## Notes

We use
the [Google APP](https://play.google.com/store/apps/details?id=com.google.android.googlequicksearchbox)
, `com.google.android.googlequicksearchbox` to display interactive 3D models on Android.
The model displays in 'ar_preferred' mode by default, Scene Viewer launches in AR native mode as the
entry mode.
If [Google Play Services for AR (ARCore, `com.google.ar.core`)](https://play.google.com/store/apps/details?id=com.google.ar.core)
isn't present, Scene Viewer gracefully falls back to 3D mode as the entry mode.


## Examples

### Importing the library

```dart
import 'package:o3d/o3d.dart';
```

### Creating a `O3D` widget

```dart
class _MyHomePageState extends State<MyHomePage> {
  
  // to control the animation
  O3DController controller = O3DController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () => 
                  controller.cameraOrbit(20, 20, 5),
              icon: const Icon(Icons.change_circle)),
          IconButton(
              onPressed: () =>
                  controller.cameraTarget(1.2, 1, 4), 
              icon: const Icon(Icons.change_circle_outlined)),
        ],
      ),
      body: O3D.asset(
         src: 'assets/glb/jeff_johansen_idle.glb', 
         controller: controller,
      ),
    );
  }
}
```

### Loading a bundled Flutter asset

```
O3D.asset(
  src: 'assets/MyModel.glb',
  // ...
),
```

### Loading a model from the web

```
body: O3D.network(
   src:'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
   // ...
),
```

### Loading a model from the file system

This is not available on Web.

```dart
class HomePage extends StatelessWidget {
   const HomePage({super.key});
   
   @override
   Widget build(BuildContext context) {
      return O3D(src: 'file:///path/to/MyModel.glb',
      // ...
      );
   }
}
```


Note that due to browsers' [CORS] security restrictions, the model file
*must* be served with a `Access-Control-Allow-Origin: *` HTTP header.

## Frequently Asked Questions

### Q: Why doesn't my 3D model load and/or render?

**A:** There are several reasons why your model URL could fail to load and
render:

1. It might not be possible to parse the provided glTF or GLB file.
   Some tools can produce invalid files when exporting glTF. Always
   run your model files through the [glTF Validator] to check for this.

[CORS]:                     https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS

[glTF Validator]:           https://github.khronos.org/glTF-Validator/

[`android:usesCleartextTraffic`]: https://developer.android.com/guide/topics/manifest/application-element#usesCleartextTraffic
