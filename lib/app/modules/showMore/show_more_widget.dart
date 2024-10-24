import 'package:flutter/material.dart';
import 'package:food_delivery/app/Widgets/custom_video_player.dart';

class ShowMoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomVideoPlayer(),
      ),
    );
  }
}
