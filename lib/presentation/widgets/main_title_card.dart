import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/main_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({super.key, required this.title, this.snapshot});
  final String title;
  final AsyncSnapshot? snapshot;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(
          title: title,
        ),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children:
             List.generate(10, (index) {
              
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: MainCard1(
                  index:index ,
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
