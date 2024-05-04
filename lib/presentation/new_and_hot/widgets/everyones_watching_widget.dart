import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class EveryOneWatchingWidget extends StatelessWidget {
  const EveryOneWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
       crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        kheight,
        Text(
          'The Boys',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        kheight,
        Text(
          'These boys are going a trip and one boy was missing and the friends searching the friend name is subash and at the climax the friends find the subash',
          style: TextStyle(color: kGreyColor),
        ),
        kheight,
        VideoWidget(),
        kheight,  
        Row(mainAxisAlignment: MainAxisAlignment.end,
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
