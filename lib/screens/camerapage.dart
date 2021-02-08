import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:told_app/screens/newpostscreen.dart';
import 'package:told_app/screens/newvideoscreen.dart';
import 'package:video_player/video_player.dart';

List<CameraDescription> cameras = [];

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() {
    return _CameraPageState();
  }
}

void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');

class _CameraPageState extends State<CameraPage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  CameraController controller;
  XFile imageFile;
  XFile videoFile;
  VideoPlayerController videoController;
  VoidCallback videoPlayerListener;
  bool enableAudio = true;
  AnimationController _flashModeControlRowAnimationController;
  Animation<double> _flashModeControlRowAnimation;
  double _minAvailableZoom;
  double _maxAvailableZoom;
  double _currentScale = 1.0;
  double _baseScale = 1.0;

  // Counting pointers (number of user fingers on screen)
  int _pointers = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    onNewCameraSelected(cameras[0]);
    _flashModeControlRowAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _flashModeControlRowAnimation = CurvedAnimation(
      parent: _flashModeControlRowAnimationController,
      curve: Curves.easeInCubic,
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _flashModeControlRowAnimationController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // App state changed before we got the chance to initialize.
    if (controller == null || !controller.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      controller?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      if (controller != null) {
        onNewCameraSelected(controller.description);
      }
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 500,
            child: Center(
              child: _cameraPreviewWidget(),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(
                color: controller != null && controller.value.isRecordingVideo
                    ? Colors.redAccent
                    : Colors.grey,
                width: 3.0,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _captureControlRowWidget(),
          _flashModeControlRowWidget(),
        ],
      ),
    );
  }

  /// Display the preview from the camera (or a message if the preview is not available).
  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return CircularProgressIndicator();
    } else {
      return Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned.fill(
            child: Container(
                child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: Listener(
                onPointerDown: (_) => _pointers++,
                onPointerUp: (_) => _pointers--,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  return GestureDetector(
                    onScaleStart: _handleScaleStart,
                    onScaleUpdate: _handleScaleUpdate,
                    child: CameraPreview(controller),
                  );
                }),
              ),
            )),
          ),
        ],
      );
    }
  }

  void _handleScaleStart(ScaleStartDetails details) {
    _baseScale = _currentScale;
  }

  Future<void> _handleScaleUpdate(ScaleUpdateDetails details) async {
    // When there are not exactly two fingers on screen don't scale
    if (_pointers != 2) {
      return;
    }

    _currentScale = (_baseScale * details.scale)
        .clamp(_minAvailableZoom, _maxAvailableZoom);

    await controller.setZoomLevel(_currentScale);
  }

  Widget _flashModeControlRowWidget() {
    return SizeTransition(
      sizeFactor: _flashModeControlRowAnimation,
      child: ClipRect(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              icon: Icon(Icons.flash_off),
              color: controller?.value?.flashMode == FlashMode.off
                  ? Colors.orange
                  : Colors.white,
              onPressed: controller != null
                  ? () => onSetFlashModeButtonPressed(FlashMode.off)
                  : null,
            ),
            IconButton(
              icon: Icon(Icons.flash_auto),
              color: controller?.value?.flashMode == FlashMode.auto
                  ? Colors.orange
                  : Colors.white,
              onPressed: controller != null
                  ? () => onSetFlashModeButtonPressed(FlashMode.auto)
                  : null,
            ),
            IconButton(
              icon: Icon(Icons.flash_on),
              color: controller?.value?.flashMode == FlashMode.always
                  ? Colors.orange
                  : Colors.white,
              onPressed: controller != null
                  ? () => onSetFlashModeButtonPressed(FlashMode.always)
                  : null,
            ),
            IconButton(
              icon: Icon(Icons.highlight),
              color: controller?.value?.flashMode == FlashMode.torch
                  ? Colors.orange
                  : Colors.white,
              onPressed: controller != null
                  ? () => onSetFlashModeButtonPressed(FlashMode.torch)
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  // Display the control bar with buttons to take pictures and record videos.
  Widget _captureControlRowWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.flash_on),
          color: Colors.white,
          onPressed: controller != null ? onFlashModeButtonPressed : null,
        ),
        IconButton(
          icon: Icon(enableAudio ? Icons.volume_up : Icons.volume_mute),
          color: Colors.white,
          onPressed: controller != null ? onAudioModeButtonPressed : null,
        ),
        Container(
          child: GestureDetector(
            onLongPressStart: (_) {
              onVideoRecordButtonPressed();
            },
            onLongPressEnd: (_) {
              onStopButtonPressed();
            },
            child: Container(
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {
                    onTakePictureButtonPressed();
                  }),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
            ),
          ),
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(35),
            ),
            border: Border.all(
              width: 10,
              color: Colors.white.withOpacity(.5),
            ),
          ),
        ),
        SizedBox(width: 45),
        IconButton(
          icon: Icon(Icons.cached),
          color: Colors.white,
          onPressed: () {
            controller.description == cameras[0]
                ? onNewCameraSelected(cameras[1])
                : onNewCameraSelected(cameras[0]);
          },
        ),
      ],
    );
  }

  void showInSnackBar(String message) {
    // ignore: deprecated_member_use
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }
    controller = CameraController(
      cameraDescription,
      ResolutionPreset.high,
      enableAudio: enableAudio,
    );

    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) setState(() {});
      if (controller.value.hasError) {
        showInSnackBar('Camera error ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
      _maxAvailableZoom = await controller.getMaxZoomLevel();
      _minAvailableZoom = await controller.getMinZoomLevel();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  void onTakePictureButtonPressed() {
    takePicture().then((file) {
      if (mounted) {
        setState(() {});
        if (file != null)
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewPostScreen(imagePath: file.path)));
      }
    });
  }

  void onFlashModeButtonPressed() {
    if (_flashModeControlRowAnimationController.value == 1) {
      _flashModeControlRowAnimationController.reverse();
    } else {
      _flashModeControlRowAnimationController.forward();
    }
  }

  void onAudioModeButtonPressed() {
    enableAudio = !enableAudio;
    if (controller != null) {
      onNewCameraSelected(controller.description);
    }
  }

  void onSetFlashModeButtonPressed(FlashMode mode) {
    setFlashMode(mode).then((_) {
      if (mounted) setState(() {});
      showInSnackBar('Flash mode set to ${mode.toString().split('.').last}');
    });
  }

  void onVideoRecordButtonPressed() {
    startVideoRecording().then((_) {
      if (mounted) setState(() {});
    });
  }

  void onStopButtonPressed() {
    stopVideoRecording().then((file) {
      if (mounted) setState(() {});
      if (file != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewVideoScreen(videoPath: file.path)));
      }
    });
  }

  Future<void> startVideoRecording() async {
    if (!controller.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return;
    }

    if (controller.value.isRecordingVideo) {
      // A recording is already started, do nothing.
      return;
    }

    try {
      await controller.startVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return;
    }
  }

  Future<XFile> stopVideoRecording() async {
    if (!controller.value.isRecordingVideo) {
      return null;
    }

    try {
      return controller.stopVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  Future<void> setFlashMode(FlashMode mode) async {
    try {
      await controller.setFlashMode(mode);
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  Future<XFile> takePicture() async {
    if (!controller.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }

    if (controller.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      XFile file = await controller.takePicture();
      return file;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  void _showCameraException(CameraException e) {
    logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }
}
