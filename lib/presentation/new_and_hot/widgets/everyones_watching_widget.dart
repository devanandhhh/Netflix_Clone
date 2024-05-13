import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class EveryOneWatchingWidget extends StatelessWidget {
  const EveryOneWatchingWidget({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        Text(
          movie.title,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: kwhiteColor),
        ),
        kheight,
        Text(
          movie.overview,
          style: const TextStyle(color: kGreyColor),
        ),
        kheight,
        VideoWidget(
          movie: movie,
        ),
        kheight,
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
              icon: Icons.share,
              title: 'Share',
              iconsize: 25,
              textsize: 16,
            ),
            kwidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: 'My List',
              iconsize: 25,
              textsize: 16,
            ),
            kwidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: 'Play',
              iconsize: 25,
              textsize: 16,
            ),
          ],
        )
      ],
    );
  }
}
