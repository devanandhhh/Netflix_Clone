import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/number_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(
          title: 'Top 10 TV Shows In India Today',
        ),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(10, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: NumberCard(
                  index: index,
                  snapshot: snapshot,
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
