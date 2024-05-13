import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    DateTime releaseDate = DateTime.parse(movie.releaseDate);
    String day = releaseDate.day.toString();
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 60,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'FEB',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: kGreyColor),
              ),
              Text(
                day,
                style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4),
              )
            ],
          ),
        ),
        SizedBox(
          height: 636,
          width: size.width - 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 4,
              ),
              VideoWidget(
                movie: movie,
              ),
              kheight,
              Row(
                children: [
                  SizedBox(
                    width: 188,
                    child: Text(
                      movie.title,
                      style: const TextStyle(
                          letterSpacing: -2,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  const Row(
                    children: [
                      CustomButtonWidget(
                        icon: Icons.all_out_sharp,
                        title: 'Reminder me',
                        iconsize: 18,
                        textsize: 11,
                      ),
                      kwidth,
                      CustomButtonWidget(
                        icon: Icons.info,
                        title: 'info',
                        iconsize: 18,
                        textsize: 11,
                      ),
                      kwidth
                    ],
                  )
                ],
              ),
              //kheight,
              Text('Coming on ${movie.releaseDate}'),
              kheight,
              Text(
                movie.title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                movie.overview,
                style: const TextStyle(color: kGreyColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
