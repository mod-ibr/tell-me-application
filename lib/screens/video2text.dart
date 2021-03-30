import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tell_me/buttons.dart';
import 'package:tell_me/drawers.dart';
import 'package:tell_me/main.dart';
import 'package:tell_me/sResultWidget.dart';
import 'package:vibration/vibration.dart';

String result = "Tell Me";

class Video2Text extends StatefulWidget {
  @override
  _Video2TextState createState() => _Video2TextState();
}

class _Video2TextState extends State<Video2Text> {
  bool isWorking = false;

  CameraController cameraController;

  CameraImage imageCamera;

  initCamera() {
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    cameraController.initialize().then((value) {
      if (!mounted) {
        return null;
      }
      setState(() {
        cameraController.startImageStream((imageForStream) => {
              if (!isWorking)
                {
                  isWorking = true,
                  imageCamera = imageForStream,
                }
            });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Video To Text', style: TextStyle(color: Colors.teal[900])),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.teal[900]),
      ),
      drawer: Drawers(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2,
              margin: EdgeInsets.only(top: 6, bottom: 3, left: 6, right: 6),
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.grey[350].withOpacity(0.3),
                border: Border.all(color: Colors.teal, width: 2),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(2),
                    bottomRight: Radius.circular(2)),
              ),
              child: imageCamera == null
                  ? Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.teal, width: 2),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(2),
                                bottomRight: Radius.circular(2)),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              'assets/images/splash.jpg',
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.height / 2,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.teal, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    initCamera();
                                    print("start camera");
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Icon(
                                          Icons.photo_camera_front,
                                          color: Colors.teal,
                                          size: 40,
                                        ),
                                      ),
                                      Text(
                                        "Press here to start translate",
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: AspectRatio(
                          aspectRatio: cameraController.value.aspectRatio,
                          child: Container(
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.height / 2,
                              child: CameraPreview(cameraController))),
                    ),

              //child:
              //Stack(
              //   children: [
              //     // Center(
              //     //   child: RaisedButton(
              //     //     onPressed: () {
              //     //       // initCamera();
              //     //       print("start camera");
              //     //     },
              //     //     child: Container(
              //     //       margin: EdgeInsets.only(top: 35),
              //     //       height: 270,
              //     //       width: 360,
              //     //       child: imageCamera == null
              //     //           ? Container(
              //     //               height: 270,
              //     //               width: 360,
              //     //               child: Icon(
              //     //                 Icons.photo_camera_front,
              //     //                 color: Colors.teal,
              //     //                 size: 40,
              //     //               ),
              //     //             )
              //     //           : AspectRatio(
              //     //               aspectRatio: cameraController.value.aspectRatio,
              //     //               child: Container(
              //     //                   width:
              //     //                       MediaQuery.of(context).size.width / 2,
              //     //                   height:
              //     //                       MediaQuery.of(context).size.height / 2,
              //     //                   child: CameraPreview(cameraController)),
              //     //             ),
              //     //     ),
              //     //   ),
              //     // )
              //   ],
              // ),
            ),
          ),
          TextArea(),

          // Task buttons
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 4, right: 4, top: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button(
                  // Speaker
                  buttonColor: Colors.teal.withOpacity(0.3),
                  buttonicon: Icons.campaign,
                  subtitle: "Speaker",
                  iconSize: 20,
                  onTap: () {},
                ),
                button(
                  // clean
                  buttonColor: Colors.teal.withOpacity(0.3),
                  buttonicon: Icons.delete_outline_rounded,
                  subtitle: "Clean",
                  iconSize: 20,
                  onTap: () {
                    Vibration.vibrate(duration: 50);
                  },
                ),
              ],
            ),
          ),
          // keyboard
        ],
      ),
    );
  }
}

// Start Text area result
class TextArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          height: 85,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 5, bottom: 1, left: 6, right: 6),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.teal, width: 2),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(2),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          child: SelectableText(
            result,
            style: TextStyle(color: Colors.teal[900], fontSize: 20),
          )),
    );
  }
}

// End Text area result

/*
* // Start video area result
class VideoArea extends StatefulWidget {
  @override
  _VideoAreaState createState() => _VideoAreaState();
}

class _VideoAreaState extends State<VideoArea> {
  bool isWorking = false;

  CameraController cameraController;

  CameraImage imageCamera;

  initCamera() {
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    cameraController.initialize().then((value) {
      if (!mounted) {
        return null;
      }
      setState(() {
        cameraController.startImageStream((imageForStream) => {
              if (!isWorking)
                {
                  isWorking = true,
                  imageCamera = imageForStream,
                }
            });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Container(
          width: MediaQuery.of(context).size.width/2,
          height: MediaQuery.of(context).size.height/2,
          margin: EdgeInsets.only(top: 6, bottom: 3, left: 6, right: 6),
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.grey[350].withOpacity(0.3),
            border: Border.all(color: Colors.teal, width: 2),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(2),
                bottomRight: Radius.circular(2)),
          ),
          child: AspectRatio(
            aspectRatio: cameraController.value.aspectRatio,
            child: CameraPreview(cameraController),
          ),
        ));
  }
}

* */
