import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';

import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          //color: kwhiteColor,
          decoration: const BoxDecoration(
              image: DecorationImage(image: NetworkImage(imagepath))),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(
                  title: 'My List',
                  icon: Icons.add,
                ),
                playbutton(),
                const CustomButtonWidget(icon: Icons.info, title: 'Info')
              ],
            ),
          ),
        )
      ],
    );
  }
}

TextButton playbutton() {
  return TextButton.icon(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(kwhiteColor)),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow_rounded,
        size: 25,
        color: kblackColor,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Play',
          style: TextStyle(fontSize: 20, color: kblackColor),
        ),
      ));
}
