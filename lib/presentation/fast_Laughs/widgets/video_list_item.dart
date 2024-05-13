import 'package:flutter/material.dart';

import 'package:netflix_clone/core/colors/colors.dart';
import 'package:video_player/video_player.dart';

class VideoListItem extends StatefulWidget {
  const VideoListItem({super.key, required this.index, required this.videoUrl});
  final int index;
  final String videoUrl;
  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  late VideoPlayerController controller;
  @override
  void initState() {
    final url = Uri.parse(widget.videoUrl);
    controller = VideoPlayerController.networkUrl(url)
      ..initialize().then((_) {
        setState(() {
          controller.play();
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          child: controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: VideoPlayer(controller),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
        // Container(
        //   color: Colors.accents[widget.index % Colors.accents.length],
        // ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //leftside
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 30,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.volume_off,
                        size: 30,
                        color: kwhiteColor,
                      )),
                ),
                //rightside
                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 27,
                        backgroundImage: NetworkImage(
                          'https://i.pinimg.com/736x/32/71/0a/32710a972231979879576d792cf02e7c.jpg',
                        ),
                      ),
                    ),
                    VideoActionWidget(icon: Icons.emoji_emotions, title: 'LOL'),
                    VideoActionWidget(icon: Icons.add, title: 'My List'),
                    VideoActionWidget(icon: Icons.share, title: 'Share'),
                    VideoActionWidget(icon: Icons.play_arrow, title: 'Play'),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}

class VideoActionWidget extends StatelessWidget {
  const VideoActionWidget({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: kwhiteColor),
          )
        ],
      ),
    );
  }
}
