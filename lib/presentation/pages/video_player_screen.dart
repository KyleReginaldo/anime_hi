// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String link;
  const VideoPlayerScreen({super.key, required this.link});

  @override
  State<VideoPlayerScreen> createState() => _HomeState();
}

class _HomeState extends State<VideoPlayerScreen> {
  late VideoPlayerController controller;
  ChewieController? chewieController;
  final text = TextEditingController(
      text:
          "https://www12.vipanicdn.net/streamhls/0789fd4f049c3ca2a49b860ea5d1f456/ep.12.1656172830.360.m3u8");
  @override
  void initState() {
    super.initState();
    initPlayer(widget.link);
  }

  void initPlayer(String url) async {
    controller = VideoPlayerController.network(url)
      ..addListener(() {
        setState(() {});
      });
    chewieController = ChewieController(
      videoPlayerController: controller,
      autoPlay: true,
      aspectRatio: 16 / 9,
      // fullScreenByDefault: true,
      autoInitialize: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: chewieController != null
                ? Chewie(controller: chewieController!)
                : const CircularProgressIndicator(),
          ),
          ListTile(
            onTap: () {
              initPlayer(
                  "https://www03.vipanicdn.net/streamhls/0789fd4f049c3ca2a49b860ea5d1f456/ep.7.1653154019.480.m3u8");
            },
            textColor: Colors.white,
            title: const Text('click here'),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
