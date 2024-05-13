import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, required this.snapshot});
  final int index;
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 50,
              height: 150,
            ),
            Container(
              height: 250,
              width: 140,
              decoration: BoxDecoration(
                  borderRadius: kRadius10,
                  color: Colors.red,
                  image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(
                      // 'https://m.media-amazon.com/images/M/MV5BODI5NDUxNjAtZTIxYS00N2M1LWI5NmItODBmM2QyNTU4ZDY4XkEyXkFqcGdeQXVyMTM1NjM2ODg1._V1_FMjpg_UX1000_.jpg'
                      '${Constants.imagePath}${snapshot.data[index].posterPath}'))),
            ),
          ],
        ),
        Positioned(
            left: 5,
            top: 60,
            child: BorderedText(
                strokeWidth: 10,
                strokeColor: kwhiteColor,
                child: Text(
                  '${index + 1}',
                  style: TextStyle(fontSize: 120, color: kblackColor),
                )))
      ],
    );
  }
}
