import 'package:flutter/material.dart';
import 'package:food_delivery/app/utils/tostify.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String videoURL;

  const CustomVideoPlayer({
    super.key,
    this.videoURL =
        "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4",
  });

  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoURL))
      ..initialize().then((_) {
        setState(() {
          _isLoading = false;
        });
      }).catchError((error) {
        Navigator.pop(context);
        CustomToast("Not Valid URL");
        print("Error initializing video: $error");
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video Demo')),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
