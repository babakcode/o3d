import 'dart:developer';

import 'package:example/logger.dart';
import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'O3D Viewer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'O3D Viewer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // to control the animation
  final O3DController controller = O3DController(),
      controller2 = O3DController(),
      controller3 = O3DController(),
      controller4 = O3DController();
  List<String> logs = [];
  bool cameraControls = false;

  @override
  void initState() {
    super.initState();
    controller.logger = (data) {
      logs.add(data.toString());
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
        leading: IconButton.filledTonal(
            onPressed: () {
              launchUrl(Uri.parse('https://pub.dev/packages/o3d'));
            },
            icon: const Icon(Icons.source)),
        actions: [
          IconButton(
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoggerPage(logs),
                        ))
                  },
              icon: const Icon(Icons.login_rounded)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// model 1
            ModelDetail(
              actions: [
                FilledButton(
                  onPressed: () => controller.variantName = null,
                  child: const Text('Default'),
                ),
                FilledButton(
                  onPressed: () => controller.variantName = 'street',
                  child: const Text('street'),
                ),
                FilledButton(
                  onPressed: () => controller.variantName = 'beach',
                  child: const Text('beach'),
                ),
              ],
              o3d: O3D(
                controller: controller,
                src: 'assets/glb/materials_variants_shoe.glb',
                // variantName: 'street',
              ),
            ),
            const Divider(),

            /// model 2
            ModelDetail(
              actions: [
                FilledButton(
                  onPressed: () => controller2.animationName = 'Survey',
                  child: const Text('Survey'),
                ),
                FilledButton(
                  onPressed: () => controller2.animationName = 'Walk',
                  child: const Text('Walk'),
                ),
                FilledButton(
                  onPressed: () => controller2.animationName = 'Run',
                  child: const Text('Run'),
                ),
                FilledButton(
                  onPressed: () => controller2.play(repetitions: 1),
                  child: const Text('Play Animation'),
                ),
                FilledButton(
                  onPressed: () async {
                    log("Available animations: ${await controller2.availableAnimations()}");
                  },
                  child: const Text('available animations'),
                ),
              ],
              o3d: O3D(
                controller: controller2,
                src: 'assets/glb/fox.glb',
              ),
            ),
            const Divider(),

            // model 3
            ModelDetail(
              actions: [
                FilledButton(
                  onPressed: () => controller3.animationName = 'Running',
                  child: const Text('Running'),
                ),
                FilledButton(
                  onPressed: () => controller3.animationName = 'Dance',
                  child: const Text('Dance'),
                ),
                FilledButton(
                  onPressed: () => controller3.animationName = 'Wave',
                  child: const Text('Wave'),
                ),
                FilledButton(
                  onPressed: () => controller3.animationName = 'Idle',
                  child: const Text('Idle'),
                ),
                FilledButton(
                  onPressed: () {
                    controller2.availableAnimations().then((value) => log("Available animations: $value"));
                  },
                  child: const Text('available animations'),
                ),
              ],
              o3d: O3D(
                controller: controller3,
                src:
                    'https://modelviewer.dev/shared-assets/models/RobotExpressive.glb',
                autoPlay: true,
              ),
            ),
            const Divider(),

            // model 4
            ModelDetail(
              actions: [
                const Text("animations:"),
                FilledButton.icon(
                    onPressed: () => controller4.animationName = 'FallingBack',
                    icon: const Icon(Icons.add),
                    label: const Text("shoot him")),
                FilledButton.icon(
                    onPressed: () =>
                        controller4.animationName = 'FallingForward',
                    icon: const Icon(Icons.add),
                    label: const Text("shoot leg")),
                FilledButton(
                    onPressed: () => controller4.animationName = 'Run',
                    child: const Text('Run')),
                FilledButton(
                    onPressed: () => controller4.animationName = 'Idle',
                    child: const Text('Idle')),
                FilledButton(
                    onPressed: () => controller4.cameraTarget(0, 1, 2.5),
                    child: const Text('ZoomOut')),
                FilledButton(
                    onPressed: () => controller4.cameraTarget(0, 1, 0),
                    child: const Text('ZoomIn'))
              ],
              o3d: O3D(
                  controller: controller4,
                  src: 'assets/glb/zombie.glb',
                  autoPlay: true,
                  cameraControls: false,
                  cameraTarget: CameraTarget(0, 1, 0)),
            ),
          ],
        ),
      ),
    );
  }
}

class ModelDetail extends StatelessWidget {
  final List<Widget> actions;
  final Widget o3d;

  const ModelDetail({
    super.key,
    required this.actions,
    required this.o3d,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade100.withOpacity(.3),
      elevation: 0,
      margin: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        padding: const EdgeInsets.all(4),
        width: double.infinity,
        height: 400,
        child: Column(
          children: [
            Wrap(
              children: actions
                  .map((child) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        child: child,
                      ))
                  .toList(),
            ),
            Expanded(
                child: Card(
              color: Colors.blue.shade100.withOpacity(.3),
              elevation: 0,
              child: AspectRatio(aspectRatio: 1, child: o3d),
            ))
          ],
        ),
      ),
    );
  }
}
