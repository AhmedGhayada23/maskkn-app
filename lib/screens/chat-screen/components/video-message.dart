
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

import '../../../appConfig.dart';

class VideoMessage extends StatefulWidget {
  const VideoMessage({Key? key,this.link}) : super(key: key);
  final link;
  @override
  _VideoMessageState createState() => _VideoMessageState();
}

class _VideoMessageState extends State<VideoMessage> {
  late VideoPlayerController _controller;
  bool shouldShowPlayPause = true;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        widget.link,/*useCache: true*/)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        _controller.setLooping(true);
        setState(() {});
      });
      
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
        setState(() {
          if(_controller.value.isPlaying)
          shouldShowPlayPause = !shouldShowPlayPause;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: 
            [Container(
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : CircularProgressIndicator(color: Res.kPrimaryColor,),),
                  !shouldShowPlayPause?Container():
              RawMaterialButton(
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                        if(_controller.value.isPlaying)
                          shouldShowPlayPause = !shouldShowPlayPause;
                  });
                },
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
                shape: CircleBorder(),
                padding: EdgeInsets.all(15.0),
                elevation: 2.0,
              fillColor: Colors.white,
              
              ),
           
          ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}