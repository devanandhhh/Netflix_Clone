
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/models/movie.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,required this.movie
  });
final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Image.network(
            // newAndHotTempImg,
            '${Constants.imagePath}${movie.posterPath}',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.5),
            radius: 23,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.volume_off,
                  size: 30,
                  color: kwhiteColor,
                )),
          ),
        ),
      ],
    );
  }
}