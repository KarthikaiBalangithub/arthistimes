import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;


class ArGeometricShapesScreen extends StatefulWidget {
  const ArGeometricShapesScreen({super.key});

  @override
  State<ArGeometricShapesScreen> createState() => _ArGeometricShapesScreenState();
}

class _ArGeometricShapesScreenState extends State<ArGeometricShapesScreen> {

 ArCoreController? coreController;

  augmentedRealityViewCreated(ArCoreController controller){

    coreController = controller;

    displayCube(coreController!);
    displayCylinder(coreController!);

  }
 displayCylinder(ArCoreController controller){
// for adding any griomentric shapes
   final materials = ArCoreMaterial(
     color: Colors.blue,
       reflectance: 2,
   );

   final cylinder = ArCoreCylinder(
     materials: [materials],
     radius: 0.5,
     height: 0.5
   );

   final node = ArCoreNode(
       shape: cylinder,
       position:vector64.Vector3(0.0, -0.5, -2.0)
   );
   coreController!.addArCoreNode(node);
 }

displayCube(ArCoreController controller){
// for adding any griomentric shapes
final materials = ArCoreMaterial(
  color: Colors.amberAccent,
  metallic: 2,
);

final cube = ArCoreCube(
    size: vector64.Vector3(0.5, 0.5, 0.5),
    materials: [materials],
);

final node = ArCoreNode(
  shape: cube,
  position:vector64.Vector3(0.5, 0.5, -3.5)
);
coreController!.addArCoreNode(node);
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          "Geo shapes"
        ),
        centerTitle:true ,
      ),
      body:ArCoreView(
          onArCoreViewCreated: augmentedRealityViewCreated,
      ),
    );
  }
}
