import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:told_app/screens/articleinput.dart';
import 'package:told_app/screens/camerapage.dart';
import 'package:told_app/screens/newpostscreen.dart';
import 'package:told_app/screens/newvideoscreen.dart';

class ShareButton extends StatefulWidget {
  @override
  _ShareButtonState createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {
  PickedFile pickedFile;
  PickedFile pickedVideo;
  final ImagePicker _picker = ImagePicker();

  void takePhoto() async {
    pickedFile = await _picker.getImage(source: ImageSource.gallery);
  }

  void takeVideo() async {
    pickedVideo = await _picker.getVideo(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.blueGrey,
        onPressed: () => showModalBottomSheet(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
            context: context,
            builder: (context) {
              return Container(
                decoration: BoxDecoration(),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  InkWell(
                    onTap: () async {
                      try {
                        WidgetsFlutterBinding.ensureInitialized();
                        cameras = await availableCameras();
                      } on CameraException catch (e) {
                        logError(e.code, e.description);
                      }
                      if (cameras != null)
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CameraPage()));
                    },
                    child: ListTile(
                      title: Text("Camera"),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      takePhoto();
                      Timer(Duration(seconds: 1), () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    NewPostScreen(imagePath: pickedFile.path)));
                      });
                    },
                    child: ListTile(
                      title: Text("Image from Gallery"),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      takeVideo();
                      Timer(Duration(seconds: 1), () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewVideoScreen(
                                    videoPath: pickedVideo.path)));
                      });
                    },
                    child: ListTile(
                      title: Text("Video from Gallery"),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ArticleInput()));
                    },
                    child: ListTile(
                      title: Text("Write an article"),
                    ),
                  ),
                ]),
              );
            }),
        child: Icon(
          Icons.add,
          size: 35.0,
        ));
  }
}
