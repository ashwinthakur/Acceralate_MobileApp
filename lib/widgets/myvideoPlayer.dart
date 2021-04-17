import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  String videoUrl;

  MyVideoPlayer({
    Key key,
    this.videoUrl,
  }) : super(key: key);

  @override
  _MyVideoPlayerState createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  VideoPlayerController _controller;
  bool _visible = true;
  Future<void> _initializeVideoPlayerFuture;
  Color vp_button = const Color.fromRGBO(83, 98, 116, 0.4);
  @override
  void initState() {
    _controller = VideoPlayerController.network(
      '${widget.videoUrl}',
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    super.initState();
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the VideoPlayerController has finished initialization, use
                // the data it provides to limit the aspect ratio of the video.
                return Column(
                  children: [
                    AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      // Use the VideoPlayer widget to display the video.
                      child: VideoPlayer(_controller),
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.all(0.0),
                          decoration: BoxDecoration(
                              color: vp_button,
                              border:
                                  Border.all(width: 0.0, color: Colors.white54),
                              borderRadius: BorderRadius.all(Radius.circular(
                                      14.0) //                 <--- border radius here

                                  )),
                          child: IconButton(
                              iconSize: 20,
                              icon: Icon(_controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow),
                              color: Colors.white,
                              onPressed: () {
                                setState(() {
                                  // If the video is playing, pause it.
                                  if (_controller.value.isPlaying) {
                                    _controller.pause();
                                  } else {
                                    // If the video is paused, play it.
                                    _controller.play();
                                  }
                                });
                              }),
                        ),
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: VideoProgressIndicator(
                                _controller,
                                allowScrubbing: true,
                              )),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.all(0.0),
                          decoration: BoxDecoration(
                              color: vp_button,
                              border:
                                  Border.all(width: 0.0, color: Colors.white54),
                              borderRadius: BorderRadius.all(Radius.circular(
                                      14.0) //                 <--- border radius here

                                  )),
                          child: IconButton(
                              iconSize: 25,
                              icon: Icon(_controller.value.isPlaying
                                  ? Icons.crop_free_rounded
                                  : Icons.crop_free_rounded),
                              color: Colors.white,
                              onPressed: () {}),
                        ),
                      ],
                    )
                  ],
                );

                //
              } else {
                // If the VideoPlayerController is still initializing, show a
                // loading spinner.
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
