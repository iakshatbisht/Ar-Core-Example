import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'package:vector_math/vector_math_64.dart' as vector;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ArCoreController arCoreController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Flutter Ar Core'),
        ),
        body: ArCoreView(onArCoreViewCreated: _onArCoreViewCreated,
          enableTapRecognizer: true,
          enableUpdateListener: true,
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onNodeTap = (name) => onTapHandler(name);
    arCoreController.onPlaneTap = _onPlaneTapHandler;
  }

  void onTapHandler(String name) {
    print(name);
    showDialog<void>(
      context: context,
        builder: (BuildContext context) => SnackBar(content: Text('on Node Tap on ${name}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),backgroundColor: Colors.transparent,));
  }

  void _onPlaneTapHandler(List<ArCoreHitTestResult> hits){
  final hit = hits.first;
  _addSphere(hit);
  }

  Future _addSphere(ArCoreHitTestResult hit) async{
    final ByteData mercurytextureBytes = await rootBundle.load('assets/mercury.jpg');
    final mercuryMaterial = ArCoreMaterial(color: Colors.grey, textureBytes: mercurytextureBytes.buffer.asUint8List());
    final mercuryShape = ArCoreSphere(
      materials: [mercuryMaterial],
      radius: 0.01,
    );
    final mercury = ArCoreRotatingNode(
      name: 'Mercury',
      shape: mercuryShape,
      degreesPerSecond: 2,
      position: vector.Vector3(0.13, 0, 0),
      rotation: vector.Vector4(0, 0, 0, 0),
    );

    final ByteData venustextureBytes = await rootBundle.load('assets/venus.jpg');
    final venusMaterial = ArCoreMaterial(color: Colors.blueAccent,textureBytes: venustextureBytes.buffer.asUint8List());
    final venusShape = ArCoreSphere(
      materials: [venusMaterial],
      radius: 0.02,
    );
    final venus = ArCoreRotatingNode(
      name: 'Venus',
      degreesPerSecond: 2,
      shape: venusShape,
      position: vector.Vector3(0.16, 0, 0),
      rotation: vector.Vector4(0, 0, 0, 0),
    );

    final ByteData textureBytes = await rootBundle.load('assets/earth.jpg');
    final earthMaterial = ArCoreMaterial(
        color: Color.fromARGB(120, 66, 134, 244),
    textureBytes: textureBytes.buffer.asUint8List());
    final earthShape = ArCoreSphere(
      materials: [earthMaterial],
      radius: 0.05,
    );
    final earth = ArCoreRotatingNode(
      name: 'Earth',
      shape: earthShape,
      degreesPerSecond: 2,
      position: vector.Vector3(0.25, 0, 0),
      rotation: vector.Vector4(0, 0, 0, 0),
    );

    final ByteData marstextureBytes = await rootBundle.load('assets/mars.jpg');
    final marsMaterial = ArCoreMaterial(
        color: Color.fromARGB(120, 66, 134, 244),
        textureBytes: marstextureBytes.buffer.asUint8List());
    final marsShape = ArCoreSphere(
      materials: [marsMaterial],
      radius: 0.04,
    );
    final mars = ArCoreRotatingNode(
      name: 'Mars',
      shape: marsShape,
      degreesPerSecond: 2,
      position: vector.Vector3(0.36, 0, 0),
      rotation: vector.Vector4(0, 0, 0, 0),
    );

    final ByteData jupitertextureBytes = await rootBundle.load('assets/jupiter.jpg');
    final jupiterMaterial = ArCoreMaterial(
        color: Color.fromARGB(120, 66, 134, 244),
        textureBytes: jupitertextureBytes.buffer.asUint8List());
    final jupiterShape = ArCoreSphere(
      materials: [jupiterMaterial],
      radius: 0.07,
    );
    final jupiter = ArCoreRotatingNode(
      name: 'Jupiter',
      shape: jupiterShape,
      degreesPerSecond: 2,
      position: vector.Vector3(0.5, 0, 0),
      rotation: vector.Vector4(0, 0, 0, 0),
    );

    final ByteData saturntextureBytes = await rootBundle.load('assets/saturn.png');
    final saturnMaterial = ArCoreMaterial(
        color: Color.fromARGB(120, 66, 134, 244),
        textureBytes: saturntextureBytes.buffer.asUint8List());
    final saturnShape = ArCoreSphere(
      materials: [saturnMaterial],
      radius: 0.05,
    );
    final saturn = ArCoreRotatingNode(
      name: 'Saturn',
      shape: saturnShape,
      degreesPerSecond: 2,
      position: vector.Vector3(0.65, 0, 0),
      rotation: vector.Vector4(0, 0, 0, 0),
    );

    final ByteData uranustextureBytes = await rootBundle.load('assets/uranus.jpg');
    final uranusMaterial = ArCoreMaterial(
        color: Color.fromARGB(120, 66, 134, 244),
        textureBytes: uranustextureBytes.buffer.asUint8List());
    final uranusShape = ArCoreSphere(
      materials: [uranusMaterial],
      radius: 0.06,
    );
    final uranus = ArCoreRotatingNode(
      name: 'Uranus',
      shape: uranusShape,
      degreesPerSecond: 2,
      position: vector.Vector3(0.79, 0, 0),
      rotation: vector.Vector4(0, 0, 0, 0),
    );

    final ByteData neptunetextureBytes = await rootBundle.load('assets/neptune.jpg');
    final neptuneMaterial = ArCoreMaterial(
        color: Color.fromARGB(120, 66, 134, 244),
        textureBytes: neptunetextureBytes.buffer.asUint8List());
    final neptuneShape = ArCoreSphere(
      materials: [neptuneMaterial],
      radius: 0.03,
    );
    final neptune = ArCoreRotatingNode(
      name: 'Neptune',
      shape: neptuneShape,
      degreesPerSecond: 2,
      position: vector.Vector3(0.9, 0, 0),
      rotation: vector.Vector4(0, 0, 0, 0),
    );

    final ByteData suntextureBytes = await rootBundle.load('assets/sun.jpg');
    final sunMaterial = ArCoreMaterial(
      metallic: 1.0,
        reflectance: 0.9,
        roughness: 0.3,
        color: Color.fromARGB(120, 66, 134, 244),
        textureBytes: suntextureBytes.buffer.asUint8List());
    final sunShape = ArCoreSphere(
      materials: [sunMaterial],
      radius: 0.1,
    );
    final sun = ArCoreNode(
        name: 'Sun',
        shape: sunShape,
        children: [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune],
        position: hit.pose.translation + vector.Vector3(0.0, 1.0, 0.0),
        rotation: hit.pose.rotation);
    arCoreController.addArCoreNodeWithAnchor(sun);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    arCoreController.dispose();
    super.dispose();
  }
}
