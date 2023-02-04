import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatelessWidget {
  static const String routeName = '/camera';
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CameraAwesomeBuilder.awesome(
      // Define if you want to take photos, videos or both and where to save them
      saveConfig: SaveConfig.photoAndVideo(
        initialCaptureMode: CaptureMode.photo,
        photoPathBuilder: () async {
          // Return a valid file path (must be a jpg file)
          return 'some/image/file/path.jpg';
        },
        videoPathBuilder: () async {
          // Return a valid file path (must be a mp4 file)
          return 'some/video/file/path.mp4';
        },
      ),
      onMediaTap: (mediaCapture) {
        // Hande tap on the preview of the last media captured
        print('Tap on ${mediaCapture.filePath}');
      },
      // Use FRONT camera
      sensor: Sensors.back,
      aspectRatio: CameraAspectRatios.ratio_4_3, // 4:3 default
      flashMode: FlashMode.auto,
      // No zoom
      zoom: 0.0,

      // For video recording
      enableAudio: true,
      progressIndicator: const SizedBox(
        width: 100,
        height: 100,
        child: CircularProgressIndicator(),
      ),
      previewFit: CameraPreviewFit.cover, // default value
      imageAnalysisConfig: AnalysisConfig(
        outputFormat: InputAnalysisImageFormat.nv21,
        width: 1024,
        autoStart: true,
      ),

      onPreviewTapBuilder: (state) => OnPreviewTap(
        onTap: (position, flutterPreviewSize, pixelPreviewSize) {
          // Handle tap to focus (default) or take a photo for instance
          // ...
        },
        onTapPainter: (position) {
          // Tap feedback
          return Positioned(
            left: position.dx - 25,
            top: position.dy - 25,
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                width: 50,
                height: 50,
              ),
            ),
          );
        },
        // Duration during which the feedback should be shown
        tapPainterDuration: const Duration(seconds: 2),
      ),
      onPreviewScaleBuilder: (state) => OnPreviewScale(
        onScale: (scale) {
          // Do something with the scale value, set zoom for instance
          state.sensorConfig.setZoom(scale);
        },
      ),
    );
  }
}
