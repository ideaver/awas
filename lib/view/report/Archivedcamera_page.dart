// import '/res/theme/colors/light_colors.dart';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// //https://github.com/flutter/plugins/blob/main/packages/camera/camera/example/lib/main.dart

// List<CameraDescription> cameras = [];

// class CameraPage extends StatefulWidget {
//   static const String routeName = '/camera';
//   const CameraPage({super.key});

//   @override
//   State<CameraPage> createState() => _CameraPageState();
// }

// class _CameraPageState extends State<CameraPage> with WidgetsBindingObserver {
//   CameraController? controller;
//   bool _isCameraInitialized = false;
//   double _minAvailableZoom = 1.0;
//   double _maxAvailableZoom = 1.0;
//   double _currentZoomLevel = 1.0;

//   void onNewCameraSelected(CameraDescription cameraDescription) async {
//     final previousCameraController = controller;
//     // Instantiating the camera controller
//     final CameraController cameraController = CameraController(
//       cameraDescription,
//       ResolutionPreset.high,
//       imageFormatGroup: ImageFormatGroup.jpeg,
//     );

//     // Dispose the previous controller
//     await previousCameraController?.dispose();

//     // Replace with the new controller
//     if (mounted) {
//       setState(() {
//         controller = cameraController;
//       });
//     }

//     // Update UI if controller updated
//     cameraController.addListener(() {
//       if (mounted) setState(() {});
//     });

//     // Initialize controller
//     try {
//       await cameraController.initialize();
//     } on CameraException catch (e) {
//       print('Error initializing camera: $e');
//     }

//     // Update the Boolean
//     if (mounted) {
//       setState(() {
//         _isCameraInitialized = controller!.value.isInitialized;
//       });
//     }

//     cameraController
//         .getMaxZoomLevel()
//         .then((value) => _maxAvailableZoom = value);

//     cameraController
//         .getMinZoomLevel()
//         .then((value) => _minAvailableZoom = value);
//   }

//   @override
//   void initState() {
//     //TODO: Hide the status bar

//     onNewCameraSelected(cameras[0]);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     final CameraController? cameraController = controller;

//     // App state changed before we got the chance to initialize.
//     if (cameraController == null || !cameraController.value.isInitialized) {
//       return;
//     }

//     if (state == AppLifecycleState.inactive) {
//       // Free up memory when camera not active
//       cameraController.dispose();
//     } else if (state == AppLifecycleState.resumed) {
//       // Reinitialize the camera with same properties
//       onNewCameraSelected(cameraController.description);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _isCameraInitialized
//           ? Column(
//               children: [
//                 Expanded(
//                   child: Stack(children: [
//                     AspectRatio(
//                       aspectRatio: 1 / controller!.value.aspectRatio,
//                       child: controller!.buildPreview(),
//                     ),
//                     Positioned(
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: Slider(
//                               value: _currentZoomLevel,
//                               min: _minAvailableZoom,
//                               max: _maxAvailableZoom,
//                               activeColor: LightColors.kPrimaryColor,
//                               inactiveColor: LightColors.kGreyColor,
//                               onChanged: (value) async {
//                                 setState(() {
//                                   _currentZoomLevel = value;
//                                 });
//                                 await controller!.setZoomLevel(value);
//                               },
//                             ),
//                           ),
//                           Container(
//                             margin: const EdgeInsets.all(defaultMargin),
//                             decoration: BoxDecoration(
//                               color: LightColors.kPrimaryColor,
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 '${_currentZoomLevel.toStringAsFixed(1)}x',
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ]),
//                 ),
//                 Text(
//                   'sfaf',
//                   style: LightColors.black2TextStyle,
//                 )
//               ],
//             )
//           : Container(),
//     );
//   }
// }
